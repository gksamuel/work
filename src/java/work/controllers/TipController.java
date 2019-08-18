package work.controllers;

import work.objects.Tip;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.TipFacade;

import java.io.Serializable;
import java.util.List;
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
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import work.objects.Seekers;
import work.objects.Tiprate;
import work.objects.Users;

@ManagedBean(name = "tipController")
@SessionScoped
public class TipController extends TipFacade implements Serializable {
    private static final long serialVersionUID = 3821825246156436783L;

    private Tip current;
    private Tip random;
    private DataModel items = null;
    @EJB
    private work.facade.TipFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    public TipController() {
    }

    public Tip getSelected() {
        if (current == null) {
            current = new Tip();
            selectedItemIndex = -1;
        }
        return current;
    }

    public Tip getRandom() {
        if (random == null) {
            generateRandom();
        }
        return random;
    }

    public void setRandom(Tip random) {
        this.random = random;
    }

    public String generateRandom() {
        setRandom((Tip) getEntityManager().createNamedQuery("Tip.findOne").setMaxResults(1).getSingleResult());
        return "View";
    }

    private TipFacade getFacade() {
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
        random = (Tip) getEntityManager().createNamedQuery("Tip.findOne").setMaxResults(1).getSingleResult();
//        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareCreate() {
        current = new Tip();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            getFacade().create(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("TipCreated"));
            current = null;
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public void addRate(int rate) {
        String message = "added";
        try {
            utx.begin();
            Tiprate tipRate = new Tiprate();
            tipRate.setTipid(random);
            if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
                Seekers seeker = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
                tipRate.setSeekerid(seeker);
                List<Tiprate> tipRates = getEntityManager().createNamedQuery("Tiprate.findSeekerTip").setParameter("seekerid", seeker).setParameter("tip", random).setMaxResults(1).getResultList();
                if (tipRates.size() == 1) {
                    tipRate = tipRates.get(0);
                    message = "updated";
                }
            }


            if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")) {
                Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
                tipRate.setUserid(user);
                List<Tiprate> tipRates = getEntityManager().createNamedQuery("Tiprate.findUserTip").setParameter("userid", user).setParameter("tip", random).setMaxResults(1).getResultList();
                if (tipRates.size() == 1) {
                    tipRate = tipRates.get(0);
                    message = "updated";
                }
            }
            tipRate.setRate(rate);
            getEntityManager().persist(tipRate);


            Object[] obj = (Object[]) getEntityManager().createNamedQuery("Tiprate.findCount").setParameter("tip", random).setMaxResults(1).getSingleResult();
            Tip tip = (Tip) getEntityManager().createNamedQuery("Tip.findCurrent").setParameter("id", random.getId()).getSingleResult();

            if (Long.valueOf((Long) obj[0]) > 0) {
                Long sum = (Long) obj[1];
                Long count = (Long) obj[0];
                long newRate = sum / count;
                tip.setRate((int) newRate);
            } else {
                tip.setRate(rate);
            }
            getEntityManager().persist(tip);

            utx.commit();
        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException ex) {
            message = "failed";
            Logger.getLogger(TipController.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            addRateMessage(message);
        }
    }

    public void addRateMessage(String message) {
        if (message.compareTo("added") == 0) {
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("rateSubmitted"));
        }
        
        if (message.compareTo("updated") == 0) {
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("rateUpdated"));
        }
        if (message.compareTo("failed") == 0) {
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("rateFailed"));
        }
        

    }

    public String rate1() {
        addRate(1);
        return "View";
    }

    public String rate2() {
        addRate(2);
        return "View";
    }

    public String rate3() {
        addRate(3);
        return "View";
    }

    public String rate4() {
        addRate(4);
        return "View";
    }

    public String rate5() {
        addRate(5);
        return "View";
    }

    public String prepareEdit() {
        current = (Tip) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("TipUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Tip) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("TipDeleted"));
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

    @FacesConverter(forClass = Tip.class)
    public static class TipControllerConverter implements Converter {

        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            TipController controller = (TipController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "tipController");
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
            if (object instanceof Tip) {
                Tip o = (Tip) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + Tip.class.getName());
            }
        }
    }
}
