package work.controllers;

import java.io.Serializable;
import java.util.*;
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
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.*;
import javax.validation.ConstraintViolationException;
import javax.validation.constraints.Pattern;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.RegistrationFacade;
import work.objects.Accounts;
import work.objects.Company;
import work.objects.Content;
import work.objects.Groups;
import work.objects.Lostpassword;
import work.objects.Registration;
import work.objects.Salary;
import work.objects.Seekers;
import work.objects.Users;
import work.utils.Email;
import work.utils.Encode;

@ManagedBean(name = "registrationController")
@SessionScoped
public class RegistrationController extends RegistrationFacade implements Serializable {

    private static final long serialVersionUID = 4694816779101590892L;

    private Registration current;
    private String password2;
    private String password;
    private String username;
    private Boolean userConfirmed = false;
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    private String email;
    private String resetcode;
    private String regType = "1";
    private DataModel items = null;
    @EJB
    private work.facade.RegistrationFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    public RegistrationController() {
    }

    public String getResetcode() {
        if (FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().containsKey("asdewedhyfse")) {
            resetcode = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("asdewedhyfse");
        }
        return resetcode;
    }

    public void setResetcode(String resetcode) {
        this.resetcode = resetcode;
    }

    public String getRegType() {
        return regType;
    }

    public void setRegType(String regType) {
        this.regType = regType;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public String getUsername() {
        if (FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().containsKey("asdewedhyfse")) {
            List<Users> users = (List<Users>) em.createNamedQuery("Users.findCode").setParameter("password", FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("asdewedhyfse")).setMaxResults(1).getResultList();
            if (users.size() == 1) {
                username = ((Users) users.get(0)).getUsername();
            }
        }
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getUserConfirmed() {

        return userConfirmed;
    }

    public void setUserConfirmed(Boolean userConfirmed) {
        this.userConfirmed = userConfirmed;
    }

    public Boolean processConfirmation() {

        String uname;
        if (FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().containsKey("asdewedhyfse") && FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().containsKey("username")) {
            try {
                resetcode = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("asdewedhyfse");
                uname = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("username");

                UserTransaction transaction;
                transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
                transaction.begin();
                List<Registration> registrationList = (List<Registration>) em.createNamedQuery("Registration.findRegistration").setParameter("code", resetcode).setParameter("username", uname).setMaxResults(1).getResultList();
                if (registrationList.size() == 1) {
                    Calendar newDate = Calendar.getInstance();
                    newDate.add(Calendar.DAY_OF_MONTH, 30);
                    Registration userregistration = registrationList.get(0);
                    if (userregistration.getGroupid().getId().equals(1)) {
                        Seekers seeker = new Seekers();
                        seeker.setUsername(userregistration.getUsername());
                        seeker.setPassword(userregistration.getPassword());
                        seeker.setEmail(userregistration.getEmail());
                        seeker.setExpiry(newDate.getTime());
                        Salary salary = (Salary) em.createNamedQuery("Salary.findByID").setParameter("id", 1).setMaxResults(1).getSingleResult();
                        salary.setId(1);
                        seeker.setSalaryid(salary);
                        work.objects.Status status = (work.objects.Status) em.createNamedQuery("Status.findByID").setParameter("id", 1).setMaxResults(1).getSingleResult();
                        seeker.setStatusid(status);
                        seeker.setDatemodified(new Date());
                        seeker.setDatecreated(new Date());
                        Groups group = (Groups) em.createNamedQuery("Groups.findByID").setParameter("id", 1).setMaxResults(1).getSingleResult();
                        seeker.setGroupid(group);
                        em.persist(seeker);
                        em.remove(userregistration);
                        userConfirmed = true;
                        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("candidateRegistered"));
                        em.flush();
                        transaction.commit();
                        return true;
                    }
                    if (userregistration.getGroupid().getId().equals(2)) {
                        Boolean emailExists = false;
                        List<Company> companies = em.createNamedQuery("Company.findEmail").setParameter("email", userregistration.getEmail()).setMaxResults(1).getResultList();
                        if (companies.isEmpty()) {
                            List<Users> users = em.createNamedQuery("Users.findEmail").setParameter("email", userregistration.getEmail()).setMaxResults(1).getResultList();
                            if (users.isEmpty()) {
                                Company company = new Company();
                                company.setExpiry(newDate.getTime());
                                company.setEmail(userregistration.getEmail());
                                company.setDatemodified(new Date());
                                em.persist(company);
                                Accounts account = new Accounts();
                                account.setCompanyid(company);
                                account.setMainaccount(true);
                                account.setDatecreated(new Date());
                                account.setName(ResourceBundle.getBundle("/Bundle").getString("mainaccount"));
                                em.persist(account);
                                Users user = new Users();
                                user.setAccountid(account);
                                user.setEmail(userregistration.getEmail());
                                user.setActive(true);
                                user.setAdmin(true);
                                Groups group = new Groups();
                                group.setId(2);
                                user.setGroupid(group);
                                user.setPassword(userregistration.getPassword());
                                user.setUsername(userregistration.getUsername());
                                user.setCompanyid(company);
                                user.setDatemodified(new Date());
                                em.persist(user);
                                em.remove(userregistration);
                                userConfirmed = true;
                                JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("companyRegistered"));
                                em.flush();
                                transaction.commit();
                                return true;
                            } else {
                                emailExists = true;
                            }
                        } else {
                            emailExists = true;
                        }
                        if (emailExists == true) {
                            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationEmailInUse"));
                            emailExists = null;
                            userConfirmed = false;
                            return null;
                        }
                    }
                } else {
                    JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("couldNotRegister"));
                    userConfirmed = false;
                    return false;
                }
            } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException | NamingException ex) {
                Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    public String prepareRecover() {
        List<Seekers> seekers = null;
        List<Users> users = null;
        try {
            UserTransaction transaction;
            transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
            transaction.begin();
            Boolean recordfound = false;
            seekers = em.createNamedQuery("Seekers.findByUsernameEmail").setParameter("username", username).setParameter("email", email).setMaxResults(1).getResultList();
            if (seekers.isEmpty()) {
                users = em.createNamedQuery("Users.findByUsernameEmail").setParameter("username", username).setParameter("email", email).setMaxResults(1).getResultList();
                if (users.size() > 0) {
                    recordfound = true;
                }
            } else {
                recordfound = true;
            }
            if (recordfound == true) {
                String code = "";
                code = UUID.randomUUID().toString();
                code = code.substring(0, 6);
                Lostpassword lostpassword = new Lostpassword();
                lostpassword.setUsername(username);
                lostpassword.setCode(code);
                lostpassword.setDatemodified(new Date());
                em.persist(lostpassword);
                Email emailSender = new Email();
                emailSender.sendPasswordEmail(lostpassword, email);
                transaction.commit();
                JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PreparePasswordResetOk"));
                username = null;
                email = null;
                code = null;
                seekers = null;
                users = null;
                emailSender = null;
                lostpassword = null;
                return "Forgot";
            } else {
                username = null;
                email = null;
                seekers = null;
                users = null;
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PreparePasswordResetError"));
                return "Forgot";
            }
        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException | NamingException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Forgot";
    }

    public String completeReset() {

        Boolean passwordUpdated = false;
        if (password.compareTo(password2) == 0) {
            try {
                UserTransaction transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
                transaction.begin();
                Encode encode = new Encode();
                List<Lostpassword> lostpasswords = em.createNamedQuery("Lostpassword.findLostPassword").setParameter("code", resetcode).setParameter("username", username).setMaxResults(1).getResultList();

                if (lostpasswords.size() > 0) {
                    Lostpassword lostpassword = lostpasswords.get(0);
                    List<Seekers> seekers = em.createNamedQuery("Seekers.findUsername").setParameter("username", username).setMaxResults(1).getResultList();
                    if (seekers.size() > 0) {
                        Seekers seeker = seekers.get(0);
                        seeker.setPassword(encode.endodesha1(password));
                        em.persist(seeker);
                        passwordUpdated = true;
                    } else {
                        List<Users> users = em.createNamedQuery("Users.findUsername").setParameter("username", username).setMaxResults(1).getResultList();
                        if (users.size() > 0) {
                            Users user = users.get(0);
                            user.setPassword(encode.endodesha1(password));
                            em.persist(user);
                            passwordUpdated = true;
                        }

                    }
                    em.remove(lostpassword);
                }
                transaction.commit();
            } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NamingException | NotSupportedException | SystemException ex) {
                Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (passwordUpdated == false) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PasswordsNotSame"));
            return "ResetPassword";
        } else {
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PasswordWasReset"));

        }

        return "login";
    }

    public Registration getSelected() {
        if (current == null) {
            current = new Registration();
            selectedItemIndex = -1;
        }
        return current;
    }

    private RegistrationFacade getFacade() {
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
        current = (Registration) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareCreate() {
        current = new Registration();
        selectedItemIndex = -1;
        return "Create";
    }

    public String register() {
        if (regType.compareTo("1") == 0) {
            return create();
        } else {
            return registerCompany();
        }
    }

    public String create() {
        if (current.getUsername().contains(" ")) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("SpacesNotAllowed"));
            return null;
        }

        try {
            if (current.getPassword().compareTo(password2) != 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PasswordsNotSame"));
                return null;
            }
            Encode encode = new Encode();
            current.setPassphrase(current.getPassword());
            current.setPassword(encode.endodesha1(current.getPassword()));
            String code = "";
            code = UUID.randomUUID().toString();
            code = code.substring(0, 6);
            current.setCode(code);
            Groups group = new Groups();
            group.setId(1);
            current.setGroupid(group);

            List<Registration> registrations = (List<Registration>) em.createNamedQuery("Registration.findEmail").setParameter("email", current.getEmail()).setMaxResults(1).getResultList();
            if (registrations.size() > 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationEmailInUse"));

                return null;
            }
            registrations = (List<Registration>) em.createNamedQuery("Registration.findUsername").setParameter("username", current.getUsername()).setMaxResults(1).getResultList();
            if (registrations.size() > 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationUsernameInUse"));
                return null;
            }
            List<Seekers> seeker = (List<Seekers>) em.createNamedQuery("Seekers.findEmail").setParameter("email", current.getEmail()).setMaxResults(1).getResultList();
            if (seeker.size() > 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationEmailInUse"));
                return null;
            }
            seeker = (List<Seekers>) em.createNamedQuery("Seekers.findUsername").setParameter("username", current.getUsername()).setMaxResults(1).getResultList();
            if (seeker.size() > 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationUsernameInUse"));
                return null;
            } else {
                Content content = (Content) em.createNamedQuery("Content.findOne").setParameter("id", 1).setMaxResults(1).getSingleResult();
                getFacade().create(current);
                Email registrationEmail = new Email();
                if (registrationEmail.sendRegistrationEmail(current, content).compareTo("failed") == 0) {
                    JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("registrationFailed"));
                    return null;
                }
                JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationCreated"));

                return prepareCreate();
            }

        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String registerCompany() {
        try {
            if (current.getUsername().contains(" ")) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("SpacesNotAllowed"));
                return null;
            }
            if (current.getPassword().compareTo(password2) != 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PasswordsNotSame"));
                return null;
            }
            Encode encode = new Encode();
            current.setPassphrase(current.getPassword());
            current.setPassword(encode.endodesha1(current.getPassword()));
            String code = "";
            code = UUID.randomUUID().toString();
            code = code.substring(0, 6);
            current.setCode(code);
            Groups group = new Groups();
            group.setId(2);
            current.setGroupid(group);
            List<Registration> registrations = (List<Registration>) em.createNamedQuery("Registration.findEmail").setParameter("email", current.getEmail()).setMaxResults(1).getResultList();
            if (registrations.size() > 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationEmailInUse"));
                return null;
            }
            registrations = (List<Registration>) em.createNamedQuery("Registration.findUsername").setParameter("username", current.getUsername()).setMaxResults(1).getResultList();
            if (registrations.size() > 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationUsernameInUse"));
                return null;
            }
            List<Users> seeker = (List<Users>) em.createNamedQuery("Users.findEmail").setParameter("email", current.getEmail()).setMaxResults(1).getResultList();
            if (seeker.size() > 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationEmailInUse"));
                return null;
            }
            seeker = (List<Users>) em.createNamedQuery("Users.findUsername").setParameter("username", current.getUsername()).setMaxResults(1).getResultList();
            if (seeker.size() > 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationUsernameInUse"));
                return null;
            } else {
                Content content = (Content) em.createNamedQuery("Content.findOne").setParameter("id", 2).setMaxResults(1).getSingleResult();
                getFacade().create(current);
                Email email = new Email();
                if (email.sendRegistrationEmail(current, content).compareTo("failed") == 0) {
                    JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("registrationFailed"));
                    return null;
                }
                JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationCreated"));
                return prepareCreate();
            }
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String confirm() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, 1);
        try {
            UserTransaction transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
            transaction.begin();
            Encode encode = new Encode();
            current.setPassword(encode.endodesha1(current.getPassword()));
            List<Registration> registration = (List<Registration>) em.createNamedQuery("Registration.findRegistration").setParameter("username", current.getUsername()).setParameter("code", current.getCode()).setParameter("password", current.getPassword()).setMaxResults(1).getResultList();
            if (registration.size() == 1) {
                Registration userregistration = registration.get(0);
                if (userregistration.getGroupid().getId().equals(1)) {
                    Seekers seeker = new Seekers();
                    seeker.setUsername(userregistration.getUsername());
                    seeker.setPassword(userregistration.getPassword());
                    seeker.setEmail(userregistration.getEmail());
                    seeker.setExpiry(cal.getTime());
                    Salary salary = (Salary) em.createNamedQuery("Salary.findByID").setParameter("id", 1).setMaxResults(1).getSingleResult();
                    salary.setId(1);
                    seeker.setSalaryid(salary);
                    work.objects.Status status = (work.objects.Status) em.createNamedQuery("Status.findByID").setParameter("id", 1).setMaxResults(1).getSingleResult();
                    seeker.setStatusid(status);
                    seeker.setDatemodified(new Date());
                    Groups group = (Groups) em.createNamedQuery("Groups.findByID").setParameter("id", 1).setMaxResults(1).getSingleResult();
                    seeker.setGroupid(group);
                    em.persist(seeker);
                    em.remove(userregistration);

                }
                if (userregistration.getGroupid().getId().equals(2)) {
                    Boolean emailExists = false;
                    List<Company> companies = em.createNamedQuery("Company.findEmail").setParameter("email", userregistration.getEmail()).setMaxResults(1).getResultList();
                    if (companies.isEmpty()) {
                        List<Users> users = em.createNamedQuery("Users.findEmail").setParameter("email", userregistration.getEmail()).setMaxResults(1).getResultList();
                        if (users.isEmpty()) {
                            Company company = new Company();
                            company.setExpiry(cal.getTime());
                            company.setEmail(userregistration.getEmail());
                            company.setDatemodified(new Date());
                            em.persist(company);
                            Users user = new Users();
                            user.setEmail(userregistration.getEmail());
                            Groups group = new Groups();
                            group.setId(2);
                            user.setGroupid(group);
                            user.setPassword(userregistration.getPassword());
                            user.setUsername(userregistration.getUsername());
                            user.setCompanyid(company);
                            user.setDatemodified(new Date());
                            em.persist(user);
                            em.remove(userregistration);
                        } else {
                            emailExists = true;
                        }
                    } else {
                        emailExists = true;
                    }
                    if (emailExists == true) {
                        JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationEmailInUse"));
                        emailExists = null;
                        return null;
                    }
                }
                em.flush();

                transaction.commit();

            } else {
                JsfUtil.addErrorMessage("Could not complete your registration");
                return "Confirm";
            }

        } catch (ConstraintViolationException cve) {
            JsfUtil.addErrorMessage(cve.getConstraintViolations().toString());
            return null;
        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException | NamingException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationComplete"));
        return "success";
    }

    public String completeUserRegistration() {
        try {
            if (password.length() < 5) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("FiveCharPassword"));
                return null;
            }
            if (password.compareTo(password2) != 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PasswordsNotSame"));
                return null;
            }
            UserTransaction transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
            transaction.begin();
            List<Users> users = (List<Users>) em.createNamedQuery("Users.findByUsernamePassword").setParameter("username", username).setParameter("password", resetcode).setMaxResults(1).getResultList();
            if (users.size() > 0) {
                Users user = users.get(0);
                Encode encode = new Encode();
                user.setPassword(encode.endodesha1(password));
                user.setActive(Boolean.TRUE);
                user.setDatemodified(new Date());
                em.persist(user);
                transaction.commit();
                JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationSuccesfull"));
                return "login";
            }

        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException | NamingException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("IncompleteUserRegistration"));
        return null;
    }

    public String prepareEdit() {
        current = (Registration) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Registration) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("RegistrationDeleted"));
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

    @FacesConverter(forClass = Registration.class)
    public static class RegistrationControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            RegistrationController controller = (RegistrationController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "registrationController");
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
            if (object instanceof Registration) {
                Registration o = (Registration) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + RegistrationController.class.getName());
            }
        }
    }
}
