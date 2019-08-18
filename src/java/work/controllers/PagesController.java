package work.controllers;

import java.io.Serializable;
import java.util.Date;
import java.util.ResourceBundle;
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
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.PagesFacade;
import work.objects.Pages;
import work.objects.Seekers;

@ManagedBean(name = "pagesController")
@SessionScoped
public class PagesController implements Serializable {
    private static final long serialVersionUID = 1750115595160030920L;

    private Pages current;
    private Pages pageRecord;
    private DataModel items = null;
    @EJB
    private work.facade.PagesFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    public PagesController() {
    }

    public Pages getPageRecord() {
        return pageRecord;
    }

    public void setPageRecord(Pages pageRecord) {
        this.pageRecord = pageRecord;
    }

    public Pages getSelected() {
        if (current == null) {
            current = new Pages();
            selectedItemIndex = -1;
        }
        return current;
    }

    private PagesFacade getFacade() {
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
        if (items.getRowCount() == 0) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("ListPagesEmpty"));
        }
        return "List";
    }

    public String prepareView() {
        current = (Pages) getPageRecord();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareCreate() {
        current = new Pages();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            current.setSeekerid(seeker);
            current.setDatemodified(new Date());
            getFacade().create(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PagesCreated"));
            return "List";

        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String prepareEdit() {
        current = (Pages) getPageRecord();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            current.setDatemodified(new Date());
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PagesUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Pages) getPageRecord();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("PagesDeleted"));
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

    @FacesConverter(forClass = Pages.class)
    public static class PagesControllerConverter implements Converter {

        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            PagesController controller = (PagesController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "pagesController");
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
            if (object instanceof Pages) {
                Pages o = (Pages) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + PagesController.class.getName());
            }
        }
    }
}
