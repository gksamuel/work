package work.controllers;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.faces.model.SelectItem;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.SecondshortlistFacade;
import work.objects.Jobs;
import work.objects.Notes;
import work.objects.Secondshortlist;
import work.objects.Users;

@ManagedBean(name = "secondshortlistController")
@SessionScoped
public class SecondshortlistController extends SecondshortlistFacade implements Serializable {

    private static final long serialVersionUID = -252383324615358062L;

    private Secondshortlist current;
    private Jobs job;
    private DataModel items = null;
    @EJB
    private work.facade.SecondshortlistFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    private DataModel<Secondshortlist> secondShortlist = null;
    private Integer firstApplication;
    private Integer lastApplication;
    @ManagedProperty(value = "#{workController}")
    private WorkController workController;
    @ManagedProperty(value = "#{educationController}")
    private EducationController educationController;
    @ManagedProperty(value = "#{pagesController}")
    private PagesController pagesController;
    @ManagedProperty(value = "#{notesController}")
    private NotesController notesController;

    public SecondshortlistController() {
    }

    public DataModel<Secondshortlist> getSecondShortlist() {
        return secondShortlist;
    }

    public void setSecondShortlist(DataModel<Secondshortlist> secondShortlist) {
        this.secondShortlist = secondShortlist;
    }

    public Jobs getJob() {
        return job;
    }

    public void setJob(Jobs job) {
        this.job = job;
    }

    public Secondshortlist getSelected() {
        if (current == null) {
            current = new Secondshortlist();
            selectedItemIndex = -1;
        }
        return current;
    }

    public WorkController getWorkController() {
        return workController;
    }

    public void setWorkController(WorkController workController) {
        this.workController = workController;
    }

    public EducationController getEducationController() {
        return educationController;
    }

    public void setEducationController(EducationController educationController) {
        this.educationController = educationController;
    }

    public PagesController getPagesController() {
        return pagesController;
    }

    public void setPagesController(PagesController pagesController) {
        this.pagesController = pagesController;
    }

    public NotesController getNotesController() {
        return notesController;
    }

    public void setNotesController(NotesController notesController) {
        this.notesController = notesController;
    }

    public void setSelected(Secondshortlist current) {
        this.current = current;
    }

    private SecondshortlistFacade getFacade() {
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

    public PaginationHelper getShortListPagination(final Jobs jobid) {
//        if (pagination == null) {
        pagination = new PaginationHelper(10) {
            @Override
            public int getItemsCount() {
                return getFacade().count();
            }

            @Override
            public DataModel createPageDataModel() {
                return new ListDataModel(getFacade().findShortListRange(new int[]{getPageFirstItem(), getPageFirstItem() + getPageSize()}, jobid));
            }
        };
//        }
        return pagination;
    }

    public Integer getFirstApplication() {
        if (firstApplication == null) {
            List<Secondshortlist> firstApplicant = (List<Secondshortlist>) getEntityManager().createNamedQuery("Secondshortlist.findFirstApplication").setParameter("jobid", job).setMaxResults(1).getResultList();
            if (firstApplicant.size() == 1) {
                Secondshortlist applicantFirst = firstApplicant.get(0);
                firstApplication = applicantFirst.getId();
            }
        }
        return firstApplication;
    }

    public void setFirstApplication(Integer firstApplication) {
        this.firstApplication = firstApplication;
    }

    public Integer getLastApplication() {
        if (lastApplication == null) {
            List<Secondshortlist> lastApplicant = (List<Secondshortlist>) getEntityManager().createNamedQuery("Secondshortlist.findLastApplication").setParameter("jobid", job).setMaxResults(1).getResultList();
            if (lastApplicant.size() == 1) {
                Secondshortlist applicantLast = lastApplicant.get(0);
                lastApplication = applicantLast.getId();
            }
        }
        return lastApplication;
    }

    public String prepareShortList() {
        Jobs currentJob = getJob();
        secondShortlist = null;
        secondShortlist = getShortListPagination(currentJob).createPageDataModel();
        return "secondShortlist";
    }

    public String prepareList() {
        recreateModel();
        return "List";
    }

    public void clearInfo() {
        firstApplication = null;
        lastApplication = null;
        items = null;
        pagination = null;
//        firstShortlist = null;
        workController.setEmploymentRecord(null);
        educationController.setEducationRecord(null);
        pagesController.setPageRecord(null);
        getSelected().setInternalcomment(null);
        getSelected().setSeekerid(null);
    }

    public void updateComment() {
        try {
            current.setDatemodified(new Date());
            current.setUserid((Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult());
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("ApplicationCommentUpdated"));
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
        }
    }

    public String addComment(String phase) {
        Users userRecord = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        current.setUserid(userRecord);
        Notes note = new Notes();
        note.setComment(current.getInternalcomment());
        note.setUserid(userRecord);
        note.setDatecreated(new Date());
        note.setDatemodified(new Date());
        note.setStage(phase);
        note.setParent(0);
        note.setApplicationid(current.getApplicationid());
        notesController.getFacade().create(note);
        clearInfo();
        current = (Secondshortlist) getEntityManager().createNamedQuery("Secondshortlist.findApplication").setParameter("applicationid", current.getApplicationid()).setMaxResults(1).getSingleResult();
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("CommentsUpdated"));

        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }
    /*
     */

    public String removeComment(Notes note) {
        Logger.getLogger(ApplicationsController.class.getName()).log(Level.SEVERE, note.getComment());
        notesController.getFacade().remove(note);
        clearInfo();
        current = (Secondshortlist) getEntityManager().createNamedQuery("Secondshortlist.findApplication").setParameter("applicationid", current.getApplicationid()).setMaxResults(1).getSingleResult();
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("CommentRemoved"));
        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    public String returnToApplicants() {
        return "secondShortlist";
    }

    public String prepareView() {
        return "View";
    }

    public void viewNext() {
        current = (Secondshortlist) getEntityManager().createNamedQuery("Secondshortlist.findNextApplication").setParameter("jobid", getJob()).setParameter("id", current.getId()).setMaxResults(1).getSingleResult();
        prepareView();
    }

    public void viewPrevious() {
        current = (Secondshortlist) getEntityManager().createNamedQuery("Secondshortlist.findPreviousApplication").setParameter("jobid", getJob()).setParameter("id", current.getId()).setMaxResults(1).getSingleResult();
        prepareView();
    }

    public String prepareCreate() {
        current = new Secondshortlist();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            getFacade().create(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("SecondshortlistCreated"));
            return prepareCreate();
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String prepareEdit() {
        current = (Secondshortlist) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("SecondshortlistUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Secondshortlist) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("SecondshortlistDeleted"));
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
        return "secondShortlist";
    }

    public String previous() {
        getPagination().previousPage();
        recreateModel();
        return "secondShortlist";
    }

    public SelectItem[] getItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(ejbFacade.findAll(), false);
    }

    public SelectItem[] getItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(ejbFacade.findAll(), true);
    }

    @FacesConverter(forClass = Secondshortlist.class)
    public static class SecondshortlistControllerConverter implements Converter {

        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            SecondshortlistController controller = (SecondshortlistController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "secondshortlistController");
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
            if (object instanceof Secondshortlist) {
                Secondshortlist o = (Secondshortlist) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + SecondshortlistController.class.getName());
            }
        }
    }
}
