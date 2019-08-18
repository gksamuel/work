package work.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import org.apache.myfaces.custom.fileupload.UploadedFile;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.FilesFacade;
import work.objects.Files;
import work.objects.Filetypes;
import work.objects.Seekers;

@ManagedBean(name = "filesController")
@SessionScoped
public class FilesController extends FilesFacade implements Serializable {

    private static final long serialVersionUID = -4460677638250934373L;

    private Files current;
    private Files file;
    private UploadedFile filedata;
    private DataModel items = null;
    @EJB
    private work.facade.FilesFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    public FilesController() {
    }

    public Files getFile() {
        return file;
    }

    public void setFile(Files file) {
        this.file = file;
    }

    public UploadedFile getFiledata() {
        return filedata;
    }

    public void setFiledata(UploadedFile filedata) {
        this.filedata = filedata;
    }

    public Files getSelected() {
        if (current == null) {
            current = new Files();
            selectedItemIndex = -1;
        }
        return current;
    }

    private FilesFacade getFacade() {
        return ejbFacade;
    }

    public String download() {
        current = getFile();
//        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        ServletContext context = (ServletContext) FacesContext.getCurrentInstance().getExternalContext().getContext();
        HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
        response.reset();
        response.setContentType("application/force-download");

        response.addHeader("Content-Disposition", "attachment; filename=\"" + current.getOriginalfilename() + "\"");
        response.addHeader("Content-Type", current.getFiletype());

        byte[] buf = new byte[1024];
        try {
            String realPath = "/opt/files/" + current.getFilename();
            File filename = new File(realPath);
            long length = filename.length();
            BufferedInputStream in = new BufferedInputStream(new FileInputStream(filename));
            ServletOutputStream out = response.getOutputStream();
            response.setContentLength((int) length);
            while ((length = in.read(buf)) != -1) {
                out.write(buf, 0, (int) length);
            }
            in.close();
            out.close();
            filename = null;
        } catch (IOException exc) {
        }

        FacesContext.getCurrentInstance().responseComplete();

        return "download";
    }

    public PaginationHelper getPagination() {
        if (pagination == null) {
            pagination = new PaginationHelper(10) {
                @Override
                public int getItemsCount() {
                    return getFacade().count();
                }

                @Override
                public DataModel createPageDataModel() {
                    return new ListDataModel(getFacade().findRange(new int[]{getPageFirstItem(), getPageFirstItem() + getPageSize()}));
                }
            };
        }
        return pagination;
    }

    public String prepareList() {
        recreateModel();
        return "List";
    }

    public String prepareView() {
        current = getFile();

        setFile(current);
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareCreate() {
        current = new Files();
        selectedItemIndex = -1;

        return "Create";
    }

    public String create() {
        InputStream stream = null;
        try {
            stream = getFiledata().getInputStream();
            String uploadPath = ResourceBundle.getBundle("/Bundle").getString("uploadPath");
            String quarantinePath = ResourceBundle.getBundle("/Bundle").getString("quarantinePath");
            File newUploadFile;
            int size = (int) getFiledata().getSize();

            if (size > 2000000) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("fileLimitExceded"));
                return null;
            }

            Boolean isValid = false;
            Iterator i = getEntityManager().createNamedQuery("Filetypes.findUploads").getResultList().iterator();

            while (i.hasNext()) {
                Filetypes filetype = (Filetypes) i.next();
                if (filetype.getFiletype().compareTo(getFiledata().getContentType()) == 0) {
                    isValid = true;
                }
            }

            if (isValid.compareTo(false) == 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("fileTypeNotValid"));
                return null;
            }

            String name = getFiledata().getName();
            current.setOriginalfilename(name);
            byte[] buffer = new byte[(int) size];
            stream.read(buffer, 0, (int) size);
            stream.close();

            newUploadFile = new File(uploadPath + name);
            if (newUploadFile.exists()) {
                Boolean fileExists = true;
                String baseName = name.substring(0, name.lastIndexOf("."));
                String extension = name.substring(name.lastIndexOf(".") + 1, name.length());
                int fileCount = 1;
                while (fileExists.compareTo(true) == 0) {
                    String filePath = uploadPath + baseName + "_" + fileCount + "." + extension;
                    newUploadFile = new File(filePath);
                    if (newUploadFile.exists()) {
                        fileCount++;
                    } else {
                        fileExists = false;
                    }
                }
                if (fileCount >= 1) {
                    name = baseName + "_" + fileCount + "." + extension;
                }
            }
            FileOutputStream outstream = new FileOutputStream(quarantinePath + name);
            outstream.write(buffer);
            outstream.close();
            try {
                Process p = Runtime.getRuntime().exec(new String[]{"clamscan", quarantinePath + name});

                p.waitFor();
                BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
                String line = reader.readLine();
                if (line.substring((line.length() - 2), line.length()).compareTo("OK") == 0) {
                    p = Runtime.getRuntime().exec(new String[]{"mv", quarantinePath + name, uploadPath});
                    p.waitFor();

                    Seekers seeker = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
                    current.setSeekerid(seeker);
                    current.setDatemodified(new Date());
                    current.setFilename(name);
                    current.setFilesize(size);
                    current.setFiletype(getFiledata().getContentType());
                    getFacade().create(current);
                } else {
                    p = Runtime.getRuntime().exec(new String[]{"rm", quarantinePath + name});
                    p.waitFor();
                    JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("VirusFound"));
                    return null;
                }
            } catch (IOException | InterruptedException e1) {
            }

        } catch (IOException e) {
            Logger.getLogger(FilesController.class.getName()).log(Level.SEVERE, e.getMessage());
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }

        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FilesCreated"));
        current = new Files();
        return "List";

    }

    public String prepareEdit() {
        current = (Files) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FilesUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        performDestroy();
        recreateModel();
        return "List";
    }

    public String destroyAndView() {
        performDestroy();
        recreateModel();
        updateCurrentItem();
        if (selectedItemIndex >= 0) {
            return "View";
        } else {
            // all items were removed - go back to list
            recreateModel();
            return "List";
        }
    }

    private void performDestroy() {
        current = getFile();
        try {
            utx.begin();
            Files remFile = (Files) em.createNamedQuery("Files.findFile").setParameter("id", getFile().getId()).getSingleResult();
            em.merge(remFile);
            em.remove(remFile);
            em.flush();
            utx.commit();
            String uploadPath = ResourceBundle.getBundle("/Bundle").getString("uploadPath");
            Process p = Runtime.getRuntime().exec(new String[]{"rm", uploadPath + current.getFilename()});
            p.waitFor();
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FilesDeleted"));

        } catch (IOException | InterruptedException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException ex) {
            JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
        }
    }

    private void updateCurrentItem() {
        int count = getFacade().count();
        if (selectedItemIndex >= count) {
            // selected index cannot be bigger than number of items:
            selectedItemIndex = count - 1;
            // go to previous page if last page disappeared:
            if (pagination.getPageFirstItem() >= count) {
                pagination.previousPage();
            }
        }
        if (selectedItemIndex >= 0) {
            current = getFacade().findRange(new int[]{selectedItemIndex, selectedItemIndex + 1}).get(0);
        }
    }

    public DataModel getItems() {
        items = null;
        if (items == null) {
            items = getPagination().createPageDataModel();
        }
        return items;
    }

    private void recreateModel() {
        items = null;
    }

    private void recreatePagination() {
        pagination = null;
    }

    public String next() {
        getPagination().nextPage();
        recreateModel();
        return "List";
    }

    public String previous() {
        getPagination().previousPage();
        recreateModel();
        return "List";
    }

    public SelectItem[] getItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(ejbFacade.findAll(), false);
    }

    public SelectItem[] getItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(ejbFacade.findAll(), true);
    }

    @FacesConverter(forClass = Files.class)
    public static class FilesControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            FilesController controller = (FilesController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "filesController");
            return controller.ejbFacade.find(getKey(value));
        }

        java.lang.Integer getKey(String value) {
            java.lang.Integer key;
            key = Integer.valueOf(value);
            return key;
        }

        String getStringKey(java.lang.Integer value) {
            StringBuilder sb = new StringBuilder();
            sb.append(value);
            return sb.toString();
        }

        @Override
        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof Files) {
                Files o = (Files) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + FilesController.class.getName());
            }
        }
    }
}
