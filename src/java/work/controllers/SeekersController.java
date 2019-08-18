package work.controllers;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import javax.imageio.ImageIO;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import org.apache.myfaces.custom.fileupload.UploadedFile;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.SeekersFacade;
import work.objects.Filetypes;
import work.objects.Jobs;
import work.objects.Mpesa;
import work.objects.Mpesatarrifs;
import work.objects.Seekers;
import work.utils.Email;
import work.utils.Encode;

@ManagedBean(name = "seekersController")
@SessionScoped
public class SeekersController extends SeekersFacade implements Serializable {

    private static final long serialVersionUID = 3405878359470564790L;

    private Seekers current;
    private Seekers seekerRecord;
    private String currentPassword;
    private String newPassword;
    private String secondPassword;
    private Jobs job;
    private UploadedFile photoData;
    private DataModel items = null;
    @EJB
    private work.facade.SeekersFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    List<Mpesa> payments;
    private String userNumber;

    public SeekersController() {
    }

    public String getCurrentPassword() {
        return currentPassword;
    }

    public void setCurrentPassword(String currentPassword) {
        this.currentPassword = currentPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getSecondPassword() {
        return secondPassword;
    }

    public void setSecondPassword(String secondPassword) {
        this.secondPassword = secondPassword;
    }

    public Seekers getSeekerRecord() {
        if (seekerRecord == null) {
            seekerRecord = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        }
        return seekerRecord;
    }

    public void setSeekerRecord(Seekers seekerRecord) {
        this.seekerRecord = seekerRecord;
    }

    public Jobs getJob() {
        return job;
    }

    public void setJob(Jobs job) {
        this.job = job;
    }

    public UploadedFile getPhotoData() {
        return photoData;
    }

    public void setPhotoData(UploadedFile photoData) {
        this.photoData = photoData;
    }

    public String getUserNumber() {
        if (userNumber == null) {
            Seekers seeker = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            userNumber = seeker.getMobile();
        }
        return userNumber;
    }

    public void setUserNumber(String userNumber) {
        this.userNumber = userNumber;
    }

    public String extendMembership() {
        try {
            UserTransaction transaction;
            transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
            transaction.begin();

            String prefix = "254";
            if (userNumber.length() == 9) {
                userNumber = prefix.concat(userNumber);
            }
            if (userNumber.length() == 10) {
                userNumber = prefix.concat(userNumber.substring(1, userNumber.length()));
            }

            payments = (List<Mpesa>) getEntityManager().createNamedQuery("Mpesa.findSource").setParameter("source", Long.valueOf(userNumber)).setMaxResults(1).getResultList();
            if (payments.size() == 1) {
                Mpesa payment = null;
                Mpesatarrifs tarriff = null;
                List<Mpesatarrifs> tarrifs = (List<Mpesatarrifs>) getEntityManager().createNamedQuery("Mpesatarrifs.findAll").getResultList();
                payment = (Mpesa) payments.get(0);
                BigDecimal amount = payment.getAmount();
                Iterator i = tarrifs.iterator();
                int total;
                BigDecimal days = BigDecimal.valueOf(Long.valueOf("0"));
                while (i.hasNext()) {
                    tarriff = (Mpesatarrifs) i.next();
                    total = tarriff.getMembership();
                    int morethan = amount.compareTo(BigDecimal.valueOf(total));
                    if (morethan >= 0) {
                        BigDecimal[] result = amount.divideAndRemainder(BigDecimal.valueOf(Long.valueOf(tarriff.getMembership())));
                        days = days.add(result[0].multiply(BigDecimal.valueOf(Long.valueOf(tarriff.getDays()))));
                        amount = result[1];
                    }
                }
                Calendar newDate = Calendar.getInstance();
                if (amount.compareTo(BigDecimal.valueOf(0.00)) != 0) {
                    days = days.add((BigDecimal.valueOf(Long.valueOf(tarriff.getDays())).divide(BigDecimal.valueOf(Long.valueOf(tarriff.getMembership())))).multiply(amount));
                    days = days.setScale(0, RoundingMode.UP);
                    newDate.add(Calendar.DAY_OF_MONTH, days.intValue());
                }
                current = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
                payment.setFromtime(current.getExpiry());
                payment.setSeekerid(current);
                if (current.getExpiry().before(new Date())) {
                    newDate.setTime(new Date());
                    newDate.add(Calendar.DAY_OF_MONTH, days.intValue());
                    current.setExpiry(newDate.getTime());
                }
                if (current.getExpiry().after(new Date())) {
                    newDate.setTime(current.getExpiry());
                    newDate.add(Calendar.DAY_OF_MONTH, days.intValue());
                    current.setExpiry(newDate.getTime());
                }
                payment.setTotime(newDate.getTime());
                payment.setProcessed(true);
                payment.setProcesstime(new Date());

                getEntityManager().persist(current);
                getEntityManager().persist(payment);
                transaction.commit();
                Email emailSender = new Email();
                emailSender.sendSeekerMpesaReceipt(payment);
            } else {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PaymentNotFound"));
                return "Extension";
            }
        } catch (NamingException | NotSupportedException | SystemException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
            Logger.getLogger(SeekersController.class.getName()).log(Level.SEVERE, null, ex);
        }
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PaymentProccessed"));
        return "Extension";
    }

    public String updatePassword() {
        seekerRecord = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        Encode encode = new Encode();
        if (seekerRecord.getPassword().compareTo(encode.endodesha1(currentPassword)) != 0) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("InCorrectPassword"));
            return null;
        }
        if (newPassword.compareTo(secondPassword) != 0) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PasswordsNotSame"));
            return null;
        }
        seekerRecord.setPassword(encode.endodesha1(newPassword));
        getFacade().edit(seekerRecord);
        currentPassword = null;
        newPassword = null;
        secondPassword = null;
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PasswordUpdated"));
        return "Password";
    }

    public String uploadPhoto() {
        InputStream stream = null;
        try {

            stream = getPhotoData().getInputStream();

            String uploadPath = ResourceBundle.getBundle("/Bundle").getString("Photopath");
            String quarantinePath = ResourceBundle.getBundle("/Bundle").getString("quarantinePath");
            File newUploadFile;
            int size = (int) getPhotoData().getSize();
            String name = getPhotoData().getName().replace(" ", "_");

            List<Filetypes> fileTypes = getEntityManager().createNamedQuery("Filetypes.findImageType").setParameter("filetype", getPhotoData().getContentType()).setMaxResults(1).getResultList();
            if (fileTypes.isEmpty()) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("FileTypeNotValid"));
                return null;
            }

            byte[] buffer = new byte[(int) size];
            stream.read(buffer, 0, (int) size);
            stream.close();

            newUploadFile = new File(uploadPath + name);
            String extension = name.substring(name.lastIndexOf(".") + 1, name.length());
            if (newUploadFile.exists()) {
                Boolean fileExists = true;
                String baseName = name.substring(0, name.lastIndexOf("."));
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
            BufferedImage originalImage = ImageIO.read(getPhotoData().getInputStream());
            ImageIO.write(originalImage, extension, new File(quarantinePath + name));
            try {
                Process p = Runtime.getRuntime().exec(new String[]{"clamscan", quarantinePath + name});
                p.waitFor();
                BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
                String line = reader.readLine();
                if (line.substring((line.length() - 2), line.length()).compareTo("OK") == 0) {
                    p = Runtime.getRuntime().exec(new String[]{"convert", "-resize", "x150", quarantinePath + name, uploadPath + name});
                    p.waitFor();
                    p = Runtime.getRuntime().exec(new String[]{"rm", quarantinePath + name});
                    p.waitFor();
                } else {
                    p = Runtime.getRuntime().exec(new String[]{"rm", quarantinePath + name});
                    p.waitFor();
                    JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("VirusFound"));
                    return null;
                }
            } catch (IOException | InterruptedException e1) {
                Logger.getLogger(SeekersController.class.getName()).log(Level.SEVERE, null, e1);
            }
            Seekers seeker = (Seekers) getSeekerRecord();
            seeker.setPhoto(name);
            getFacade().edit(seeker);
            seeker = null;
            current = (Seekers) getSeekerRecord();
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FilesCreated"));
        } catch (IOException ex) {
            Logger.getLogger(SeekersController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stream.close();
            } catch (IOException | NullPointerException ex) {
                Logger.getLogger(SeekersController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        setSeekerRecord(null);
        return "Photo";
    }

    public String logout() throws ServletException {
        FacesContext context = FacesContext.getCurrentInstance();
        HttpServletRequest request = (HttpServletRequest) context.getExternalContext().getRequest();
        context.getExternalContext().invalidateSession();
        request.logout();
        return "logout";
    }

    public Seekers getSelected() {
        if (current == null) {
            current = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        }
        return current;
    }

    public void setCurrent(Seekers current) {
        this.current = current;
    }

    private SeekersFacade getFacade() {
        return ejbFacade;
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
        current = (Seekers) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String viewSeeker() {
        current = (Seekers) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "viewSeeker";
    }

    public String prepareCreate() {
        current = new Seekers();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            getFacade().create(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("SeekersCreated"));
            return prepareCreate();
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String prepareEdit() {
        current = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            current.setDatemodified(new Date());
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("SeekersUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Seekers) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        performDestroy();
        recreatePagination();
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
        try {
            getFacade().remove(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("SeekersDeleted"));
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
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

    @FacesConverter(forClass = Seekers.class)
    public static class SeekersControllerConverter implements Converter {

        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            SeekersController controller = (SeekersController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "seekersController");
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
            if (object instanceof Seekers) {
                Seekers o = (Seekers) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + SeekersController.class.getName());
            }
        }
    }
}
