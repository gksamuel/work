package work.controllers;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.UUID;
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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.UsersFacade;
import work.objects.Users;
import work.utils.Email;
import work.utils.Encode;

@ManagedBean(name = "usersController")
@SessionScoped
public class UsersController extends UsersFacade implements Serializable {
    private static final long serialVersionUID = 4562727500569552258L;

    private Users current;
    private Users userRecord;
    private Users userItem;
    private String currentPassword;
    private String newPassword;
    private String secondPassword;
    private DataModel items = null;
    @EJB
    private work.facade.UsersFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;

    public UsersController() {
    }

    public UsersController(Users userRecord) {
        this.userRecord = userRecord;
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

    public Users getUserRecord() {
        if (userRecord == null) {
            userRecord = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        }
        return userRecord;
    }

    public void setUserRecord(Users userRecord) {
        this.userRecord = userRecord;
    }

    public Users getUserItem() {
        return userItem;
    }

    public void setUserItem(Users userItem) {
        this.userItem = userItem;
    }

    public String updatePassword() {
        userRecord = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        Encode encode = new Encode();
        if (userRecord.getPassword().compareTo(encode.endodesha1(currentPassword)) != 0) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("InCorrectPassword"));
            return null;
        }
        if (newPassword.compareTo(secondPassword) != 0) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("PasswordsNotSame"));
            return null;
        }
        userRecord.setPassword(encode.endodesha1(newPassword));
        getFacade().edit(userRecord);
        currentPassword = null;
        newPassword = null;
        secondPassword = null;
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PasswordUpdated"));
        return "Password";
    }

    public String logout() throws ServletException {
        FacesContext context = FacesContext.getCurrentInstance();
        HttpServletRequest request = (HttpServletRequest) context.getExternalContext().getRequest();
        context.getExternalContext().invalidateSession();
        request.logout();
        return "logout";
    }

    public Users getSelected() {
        if (current == null) {
            current = new Users();
            selectedItemIndex = -1;
        }
        return current;
    }

    private UsersFacade getFacade() {
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
        current = (Users) getUserItem();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareCreate() {
        if (userRecord.getAdmin() == false) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("OnlyAdminCanAdd"));
            return "List";
        }
        current = new Users();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        if(current.getUsername().contains(" ")){
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("SpacesNotAllowed"));
            return null;
        }
        if (userRecord.getAdmin() == false) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("OnlyAdminCanAdd"));
            return "List";
        }
        try {
            List<Users> existingEmail = getEntityManager().createNamedQuery("Users.findEmail").setParameter("email", current.getEmail()).setMaxResults(1).getResultList();
            if (existingEmail.size() == 1) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("UserEmailExists"));
                existingEmail = null;
                return null;
            }
            List<Users> existingUsername = getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", current.getUsername()).setMaxResults(1).getResultList();
            if (existingUsername.size() == 1) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("UsernameExists"));
                existingUsername = null;
                return null;

            }
            Users user = getUserRecord();
            String code = "";
            code = UUID.randomUUID().toString();
            code = code.substring(0, 6);
            current.setPassword(code);
            current.setDatemodified(new Date());
            current.setGroupid(user.getGroupid());
            current.setCompanyid(user.getCompanyid());
            current.setActive(Boolean.FALSE);
            current.setAdmin(Boolean.FALSE);
            getFacade().create(current);
            Email emailer = new Email();
            emailer.notifyNewUser(current);

            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("UsersCreated"));
            current = new Users();
            selectedItemIndex = -1;
            return "List";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String prepareEdit() {
        current = (Users) getUserItem();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String disableUser() {
        if (userItem.getAdmin() == true) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("CannotDisableAdmin"));
            return "List";
        }
        userItem = (Users) getUserItem();
        userItem.setActive(Boolean.FALSE);
        userItem.setDatemodified(new Date());
        getFacade().edit(userItem);
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("UserDisabled"));
        return "List";
    }

    public String enableUser() {
        userItem = (Users) getUserItem();
        userItem.setActive(Boolean.TRUE);
        userItem.setDatemodified(new Date());
        getFacade().edit(userItem);
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("UserActivated"));
        return "List";
    }

    public String update() {
        try {
            userItem.setDatemodified(new Date());
            getFacade().edit(userItem);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("UsersUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String updateUserRecord() {
        try {
            userRecord.setDatemodified(new Date());
            getFacade().edit(userRecord);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("UsersUpdated"));
            return "MyProfile";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Users) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("UsersDeleted"));
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
        items = getPagination().createPageDataModel();
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

    @FacesConverter(forClass = Users.class)
    public static class UsersControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            UsersController controller = (UsersController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "usersController");
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
            if (object instanceof Users) {
                Users o = (Users) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + UsersController.class.getName());
            }
        }
    }
}
