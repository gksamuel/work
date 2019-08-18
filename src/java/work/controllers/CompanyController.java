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
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import org.apache.myfaces.custom.fileupload.UploadedFile;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.CompanyFacade;
import work.objects.Agent;
import work.objects.Company;
import work.objects.Filetypes;
import work.objects.Mpesa;
import work.objects.Mpesatarrifs;
import work.objects.Users;
import work.utils.Email;

@ManagedBean(name = "companyController")
@SessionScoped
public class CompanyController extends CompanyFacade implements Serializable {

    private static final long serialVersionUID = 1136389198050564817L;

    private Company current;
    private Company companyRecord;
    private UploadedFile photoData;
    private DataModel items = null;
    @EJB
    private work.facade.CompanyFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    List<Mpesa> payments;
    private String userNumber;

    public CompanyController() {
    }

    public void unsubAgent() {
        if (FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().containsKey("code")) {
            try {
                UserTransaction transaction;
                transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
                transaction.begin();
                String code = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("code");
                List<Agent> agents = (List<Agent>) getEntityManager().createNamedQuery("Agent.findAgent").setParameter("code", code).getResultList();
                Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, String.valueOf(agents.size()));
                if (agents.size() > 0) {
                    Agent agent = agents.get(0);
                    agent.setActive(Boolean.FALSE);
                    getEntityManager().persist(agent);
                }
                transaction.commit();
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("agentRemoved"));
            } catch (NamingException | NotSupportedException | SystemException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
                Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public void emailReader() {
        if (FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().containsKey("code")) {
            try {
                UserTransaction transaction;
                transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
                transaction.begin();
                String code = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("code");
                List<Agent> agents = (List<Agent>) getEntityManager().createNamedQuery("Agent.findAgent").setParameter("code", code).getResultList();
                if (agents.size() > 0) {
                    Agent agent = agents.get(0);
                    agent.setAccesstime(new Date());
                    if (agent.getAccess() == null) {
                        agent.setAccess(1);
                    } else {
                        agent.setAccess(agent.getAccess() + 1);
                    }
                    getEntityManager().persist(agent);
                }
                transaction.commit();
            } catch (NamingException | NotSupportedException | SystemException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
                Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public Company getSelected() {
        if (current == null) {
            Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            current = (Company) user.getCompanyid();
        }
        return current;
    }

    private CompanyFacade getFacade() {
        return ejbFacade;
    }

    public Company getCompanyRecord() {
        if (companyRecord == null) {
            Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            companyRecord = (Company) user.getCompanyid();
        }
        return companyRecord;
    }

    public void setCompanyRecord(Company companyRecord) {
        this.companyRecord = companyRecord;
    }

    public UploadedFile getPhotoData() {
        return photoData;
    }

    public void setPhotoData(UploadedFile photoData) {
        this.photoData = photoData;
    }

    public String getUserNumber() {
        if (userNumber == null) {
            Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            userNumber = user.getCompanyid().getMobile();
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
                    total = tarriff.getRecruitermembership();
                    int morethan = amount.compareTo(BigDecimal.valueOf(total));
                    if (morethan >= 0) {
                        BigDecimal[] result = amount.divideAndRemainder(BigDecimal.valueOf(Long.valueOf(tarriff.getRecruitermembership())));
                        days = days.add(result[0].multiply(BigDecimal.valueOf(Long.valueOf(tarriff.getDays()))));
                        amount = result[1];
                    }
                }
                Calendar newDate = Calendar.getInstance();
                if (amount.compareTo(BigDecimal.valueOf(0.00)) != 0) {
                    days = days.add((BigDecimal.valueOf(Long.valueOf(tarriff.getDays())).divide(BigDecimal.valueOf(Long.valueOf(tarriff.getRecruitermembership())))).multiply(amount));
                    days = days.setScale(0, RoundingMode.UP);
                    newDate.add(Calendar.DAY_OF_MONTH, days.intValue());
                }
                current = ((Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult()).getCompanyid();
                payment.setFromtime(current.getExpiry());
                payment.setCompanyid(current);
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
                emailSender.sendCompanyMpesaReceipt(payment);
                setCompanyRecord(current);
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
                    p = Runtime.getRuntime().exec(new String[]{"convert", "-resize", "x100", quarantinePath + name, uploadPath + name});
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
            }
            companyRecord.setLogo(name);
            getFacade().edit(companyRecord);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FilesCreated"));

        } catch (IOException ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stream.close();
            } catch (IOException ex) {
                Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return "Photo";
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
        current = (Company) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareCreate() {
        current = new Company();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            getFacade().create(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("CompanyCreated"));
            return prepareCreate();
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String prepareEdit() {
//        current = (Company) getItems().getRowData();
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        current = (Company) user.getCompanyid();
//        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("CompanyUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Company) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("CompanyDeleted"));
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

    @FacesConverter(forClass = Company.class)
    public static class CompanyControllerConverter implements Converter {

        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            CompanyController controller = (CompanyController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "companyController");
            return controller.ejbFacade.find(getKey(value));
        }

        java.lang.Integer getKey(String value) {
            java.lang.Integer key;
            key = Integer.valueOf(value);
            return key;
        }

        String getStringKey(java.lang.Integer value) {
            StringBuffer sb = new StringBuffer();
            sb.append(value);
            return sb.toString();
        }

        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof Company) {
                Company o = (Company) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + CompanyController.class.getName());
            }
        }
    }
}
