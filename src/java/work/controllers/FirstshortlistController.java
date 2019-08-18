package work.controllers;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
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
import javax.transaction.*;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.FirstshortlistFacade;
import work.objects.Firstshortlist;
import work.objects.Jobs;
import work.objects.Notes;
import work.objects.Secondshortlist;
import work.objects.Users;

@ManagedBean(name = "firstshortlistController")
@SessionScoped
public class FirstshortlistController extends FirstshortlistFacade implements Serializable {

    private static final long serialVersionUID = 9132086892109301822L;

    private Firstshortlist current;
    private Jobs job;
    private DataModel items = null;
    private String internalcomment;
    private String seekercomment;
    @EJB
    private work.facade.FirstshortlistFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    private DataModel<Firstshortlist> firstShortlist = null;
    @Resource
    private javax.transaction.UserTransaction utx;
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

    public FirstshortlistController() {
    }

    public String getInternalcomment() {
        return internalcomment;
    }

    public void setInternalcomment(String internalcomment) {
        this.internalcomment = internalcomment;
    }

    public String getSeekercomment() {
        return seekercomment;
    }

    public void setSeekercomment(String seekercomment) {
        this.seekercomment = seekercomment;
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

    public DataModel<Firstshortlist> getFirstShortlist() {
        recreateShortlistModel();
        if (firstShortlist == null) {
            firstShortlist = getShortListPagination(getJob()).createPageDataModel();
        }
        return firstShortlist;
    }

    public void setFirstShortlist(DataModel<Firstshortlist> firstShortlist) {
        this.firstShortlist = firstShortlist;
    }

    public Jobs getJob() {
        return job;
    }

    public void setJob(Jobs job) {
        this.job = job;
    }

    public String secondShortList() {
        try {
            utx.begin();
            List<Secondshortlist> secondShortlist = (List<Secondshortlist>) getEntityManager().createNamedQuery("Secondshortlist.findSecondShortList").setParameter("jobid", current.getJobid()).setParameter("seekerid", current.getSeekerid()).setMaxResults(1).getResultList();
            if (secondShortlist.size() > 0) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("candidateAlreadyShortlisted"));
                secondShortlist = null;
                return null;
            }

            Secondshortlist secondShortList = new Secondshortlist();
            Users userRecord = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            secondShortList.setUserid(userRecord);
            secondShortList.setApplicationid(current.getApplicationid());
            secondShortList.setDatemodified(new Date());
            secondShortList.setSeekercomment(seekercomment);
            secondShortList.setInternalcomment(internalcomment);
            secondShortList.setSeekerid(current.getSeekerid());
            secondShortList.setJobid(current.getJobid());
            getEntityManager().persist(secondShortList);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("SeekerSecondShortListed"));
            utx.commit();

        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException ex) {
            Logger.getLogger(FirstshortlistController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "secondShortList";
    }

    public Firstshortlist getSelected() {
        if (current == null) {
            current = new Firstshortlist();
            selectedItemIndex = -1;
        }
        return current;
    }

    public void setSelected(Firstshortlist current) {
        this.current = current;
    }

    private FirstshortlistFacade getFacade() {
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
        if (pagination == null) {
            pagination = new PaginationHelper(10) {
                @Override
                public int getItemsCount() {
                    return getFacade().jobCount(jobid);
                }

                @Override
                public DataModel createPageDataModel() {
                    return new ListDataModel(getFacade().findShortListRange(new int[]{getPageFirstItem(), getPageFirstItem() + getPageSize()}, jobid));
                }
            };
        }
        return pagination;
    }

    public Integer getFirstApplication() {
        if (firstApplication == null) {
            List<Firstshortlist> firstApplicant = (List<Firstshortlist>) getEntityManager().createNamedQuery("Firstshortlist.findFirstApplication").setParameter("jobid", job).setMaxResults(1).getResultList();
            if (firstApplicant.size() == 1) {
                Firstshortlist applicantFirst = firstApplicant.get(0);
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
            List<Firstshortlist> lastApplicant = (List<Firstshortlist>) getEntityManager().createNamedQuery("Firstshortlist.findLastApplication").setParameter("jobid", job).setMaxResults(1).getResultList();
            if (lastApplicant.size() == 1) {
                Firstshortlist applicantLast = lastApplicant.get(0);
                lastApplication = applicantLast.getId();
            }
        }
        return lastApplication;
    }

    public String prepareShortList() {
        clearInfo();
        firstShortlist = getShortListPagination(getJob()).createPageDataModel();
        if (firstShortlist.getRowCount() == 0) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("ListFirstshortlistEmpty"));
        }

        return "firstShortlist";
    }

    public String shortListNext() {
        getShortListPagination(getJob()).nextPage();
        recreateShortlistModel();
        return "firstShortlist";
    }

    public String shortListPrevious() {
        getShortListPagination(getJob()).previousPage();
        recreateShortlistModel();
        return "firstShortlist";
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
        firstShortlist = null;
        workController.setEmploymentRecord(null);
        educationController.setEducationRecord(null);
        pagesController.setPageRecord(null);
        setInternalcomment(null);
        setSeekercomment(null);
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
        note.setComment(getInternalcomment());
        note.setUserid(userRecord);
        note.setDatecreated(new Date());
        note.setDatemodified(new Date());
        note.setStage(phase);
        note.setParent(0);
        note.setApplicationid(current.getApplicationid());
        notesController.getFacade().create(note);
        clearInfo();
        current = (Firstshortlist) getEntityManager().createNamedQuery("Firstshortlist.findApplication").setParameter("applicationid", current.getApplicationid()).setMaxResults(1).getSingleResult();
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("CommentsUpdated"));

        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    public String removeComment(Notes note) {
        Logger.getLogger(ApplicationsController.class.getName()).log(Level.SEVERE, note.getComment());
        notesController.getFacade().remove(note);
        clearInfo();
        current = (Firstshortlist) getEntityManager().createNamedQuery("Firstshortlist.findApplication").setParameter("applicationid", current.getApplicationid()).setMaxResults(1).getSingleResult();
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("CommentRemoved"));
        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    public String returnToApplicants() {
        return "firstShortlist";
    }

    public String prepareView() {
        return "View";
    }

    public void viewNext() {
        clearInfo();
        current = (Firstshortlist) getEntityManager().createNamedQuery("Firstshortlist.findNextApplication").setParameter("jobid", getJob()).setParameter("id", current.getId()).setMaxResults(1).getSingleResult();
        prepareView();
    }

    public void viewPrevious() {
        clearInfo();
        current = (Firstshortlist) getEntityManager().createNamedQuery("Firstshortlist.findPreviousApplication").setParameter("jobid", getJob()).setParameter("id", current.getId()).setMaxResults(1).getSingleResult();
        prepareView();
    }

    public String prepareCreate() {
        current = new Firstshortlist();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            getFacade().create(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FirstshortlistCreated"));
            return prepareCreate();
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String prepareEdit() {
        current = (Firstshortlist) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FirstshortlistUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Firstshortlist) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FirstshortlistDeleted"));
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

    private void recreateShortlistModel() {
        firstShortlist = null;
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

    @FacesConverter(forClass = Firstshortlist.class)
    public static class FirstshortlistControllerConverter implements Converter {

        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            FirstshortlistController controller = (FirstshortlistController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "firstshortlistController");
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
            if (object instanceof Firstshortlist) {
                Firstshortlist o = (Firstshortlist) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + FirstshortlistController.class.getName());
            }
        }
    }
}
