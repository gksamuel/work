/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.controllers;

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
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import javax.validation.constraints.Digits;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.MpesaFacade;
import work.objects.Company;
import work.objects.Mpesa;
import work.objects.Mpesatarrifs;
import work.objects.Seekers;
import work.objects.Users;
import work.utils.Email;

/**
 *
 * @author gachanja
 */
@ManagedBean(name = "mpesaController")
@SessionScoped
public class MpesaController implements Serializable {

    private static final long serialVersionUID = 8161586597091375987L;

    private Mpesa current;
    private DataModel items = null;
    @EJB
    private MpesaFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    private String group;
    private int id;
    private String mobile = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("mobile");
    @Digits(integer = 12, fraction = 0, message = "Mobile number is not valid")
    private String userNumber;
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUserNumber() {
        if (userNumber == null) {
            if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
                Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
                userNumber = seeker.getMobile();
            }
            if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")) {
                Users user = (Users) em.createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
                userNumber = user.getCompanyid().getMobile();
            }
        }
        return userNumber;
    }

    public void setUserNumber(String userNumber) {
        this.userNumber = userNumber;
    }

    public void setItems(DataModel items) {
        this.items = items;
    }

    /**
     * Creates a new instance of MpesaController
     */
    public MpesaController() {
    }

    public Boolean processPayment(String groupName, String MobileNo, int id) {
        List<Mpesa> payments = null;
        Mpesa payment = null;
        Mpesatarrifs tarriff = null;
        try {
            String source = MobileNo;
            String prefix = "254";
            if (MobileNo.length() == 9) {
                source = prefix.concat(MobileNo);
            }
            if (MobileNo.length() == 10) {
                source = prefix.concat(MobileNo.substring(1, MobileNo.length()));
            }
            if (MobileNo.length() == 12) {
                source = MobileNo;
            }
            UserTransaction transaction;
            transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
            transaction.begin();
            payments = (List<Mpesa>) em.createNamedQuery("Mpesa.findSource").setParameter("source", Long.valueOf(source)).setMaxResults(1).getResultList();
            if (payments.size() == 1) {
                List<Mpesatarrifs> tarrifs = (List<Mpesatarrifs>) em.createNamedQuery("Mpesatarrifs.findAll").getResultList();
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
                        days = days.add(result[0].multiply(BigDecimal.valueOf((long) tarriff.getDays())));
                        amount = result[1];
                    }
                }
                Calendar newDate = Calendar.getInstance();
                if (amount.compareTo(BigDecimal.valueOf(0.00)) != 0) {
                    days = days.add((BigDecimal.valueOf((long) tarriff.getDays()).divide(BigDecimal.valueOf((long) tarriff.getMembership()))).multiply(amount));
                    days = days.setScale(0, RoundingMode.UP);
                    newDate.add(Calendar.DAY_OF_MONTH, days.intValue());
                }
                payment.setProcessed(true);
                if (group.compareTo("seekers") == 0) {
                    Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findId").setParameter("id", id).getSingleResult();
                    payment.setFromtime(seeker.getExpiry());
                    payment.setSeekerid(seeker);
                    if (seeker.getExpiry().before(new Date())) {
                        newDate.setTime(new Date());
                        newDate.add(Calendar.DAY_OF_MONTH, days.intValue());
                        seeker.setExpiry(newDate.getTime());
                    }
                    if (seeker.getExpiry().after(new Date())) {
                        newDate.setTime(seeker.getExpiry());
                        newDate.add(Calendar.DAY_OF_MONTH, days.intValue());
                        seeker.setExpiry(newDate.getTime());
                    }
                    payment.setTotime(newDate.getTime());
                    em.persist(seeker);
                    payment.setProcesstime(new Date());
                    em.persist(payment);
                    Email emailSender = new Email();
                    emailSender.sendSeekerMpesaReceipt(payment);

                }
                if (group.compareTo("companies") == 0) {
                    Company company = (Company) em.createNamedQuery("Company.findCompany").setParameter("id", id).getSingleResult();
                    payment.setCompanyid(company);
                    payment.setFromtime(company.getExpiry());

                    if (company.getExpiry().before(new Date())) {
                        newDate.setTime(new Date());
                        newDate.add(Calendar.DAY_OF_MONTH, days.intValue());
                        company.setExpiry(newDate.getTime());
                    }
                    if (company.getExpiry().after(new Date())) {
                        newDate.setTime(company.getExpiry());
                        newDate.add(Calendar.DAY_OF_MONTH, days.intValue());
                        company.setExpiry(newDate.getTime());
                    }
                    payment.setTotime(newDate.getTime());
                    em.persist(company);
                    payment.setProcesstime(new Date());
                    em.persist(payment);
                    Email emailSender = new Email();
                    emailSender.sendCompanyMpesaReceipt(payment);
                }
            } else {
                return false;
            }
            transaction.commit();
        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException | NamingException ex) {
            Logger.getLogger(MpesaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public String processExpired() {
        group = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("group");
        id = (Integer) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("id");
        Boolean paymentProcessed = processPayment(group, mobile, id);
        if (paymentProcessed == false) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PaymentNotFound"));
            return "Membership";
        } else {
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PaymentProccessed"));
            return "Membership";
        }
    }

    public String extendMembership() {
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
            Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            group = "seekers";
            id = seeker.getId();
        }
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")) {
            Users user = (Users) em.createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            group = "companies";
            id = user.getCompanyid().getId();
        }

        Boolean paymentProcessed = processPayment(group, getUserNumber(), id);
        if (paymentProcessed == false) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PaymentNotFound"));
            return "Extension";
        } else {
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PaymentProccessed"));
            return "Extension";
        }
    }

    public Mpesa getSelected() {
        if (current == null) {
            current = new Mpesa();
            selectedItemIndex = -1;
        }
        return current;
    }

    private MpesaFacade getFacade() {
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
        current = (Mpesa) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareCreate() {
        current = new Mpesa();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            getFacade().create(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("MpesaCreated"));
            return prepareCreate();
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String prepareEdit() {
        current = (Mpesa) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("MpesaUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Mpesa) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("MpesaDeleted"));
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

    @FacesConverter(forClass = Mpesa.class)
    public static class MpesaControllerConverter implements Converter {

        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            MpesaController controller = (MpesaController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "mpesaController");
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
            if (object instanceof Mpesa) {
                Mpesa o = (Mpesa) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + Mpesa.class.getName());
            }
        }
    }
}
