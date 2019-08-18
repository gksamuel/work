package work.controllers;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.MimetypesFileTypeMap;
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
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.*;
import org.apache.myfaces.custom.fileupload.UploadedFile;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.FullTextQuery;
import org.hibernate.search.query.dsl.QueryBuilder;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.ApplicationsFacade;
import work.objects.Applications;
import work.objects.Firstshortlist;
import work.objects.Jobs;
import work.objects.Notes;
import work.objects.Seekers;
import work.objects.Users;

@ManagedBean(name = "applicationsController")
@SessionScoped
public class ApplicationsController extends ApplicationsFacade implements Serializable {

    private static final long serialVersionUID = -5409093678067677120L;

    private Applications current;
    private Applications applicationRecord;
    private UploadedFile applicationForm;
    private Jobs job;
    private Seekers seeker;
    private String internalcomment;
    private String seekercomment;
    private ListDataModel resultsModel;
    private List<Seekers> searchResults;
    private DataModel items = null;
    private DataModel<Applications> applicants = null;
    @EJB
    private work.facade.ApplicationsFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    @Resource
    private javax.transaction.UserTransaction utx;
    private Users userRecord;
    private Integer firstApplication;
    private Integer lastApplication;
    private Integer selectedSeeker;

    @ManagedProperty(value = "#{workController}")
    private WorkController workController;
    @ManagedProperty(value = "#{educationController}")
    private EducationController educationController;
    @ManagedProperty(value = "#{pagesController}")
    private PagesController pagesController;
    @ManagedProperty(value = "#{notesController}")
    private NotesController notesController;

    public ApplicationsController() {
    }

    public UploadedFile getApplicationForm() {
        return applicationForm;
    }

    public void setApplicationForm(UploadedFile applicationForm) {
        this.applicationForm = applicationForm;
    }

    public Applications getApplicationRecord() {
        return applicationRecord;
    }

    public void setApplicationRecord(Applications applicationRecord) {
        this.applicationRecord = applicationRecord;
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

    public Integer getFirstApplication() {
        if (firstApplication == null) {
            List<Applications> firstApplicant = (List<Applications>) getEntityManager().createNamedQuery("Applications.findFirstApplication").setParameter("jobid", job).setMaxResults(1).getResultList();
            if (firstApplicant.size() == 1) {
                Applications applicantFirst = firstApplicant.get(0);
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
            List<Applications> lastApplicant = (List<Applications>) getEntityManager().createNamedQuery("Applications.findLastApplication").setParameter("jobid", job).setMaxResults(1).getResultList();
            if (lastApplicant.size() == 1) {
                Applications applicantLast = lastApplicant.get(0);
                lastApplication = applicantLast.getId();
            }
        }
        return lastApplication;
    }

    public void setLastApplication(Integer lastApplication) {
        this.lastApplication = lastApplication;
    }

    public Integer getSelectedSeeker() {
        return selectedSeeker;
    }

    public void setSelectedSeeker(Integer selectedSeeker) {
        this.selectedSeeker = selectedSeeker;
    }

    public void setWorkController(WorkController workController) {
        this.workController = workController;
    }

    public void setEducationController(EducationController educationController) {
        this.educationController = educationController;
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

    public Jobs getJob() {
        return job;
    }

    public void setJob(Jobs job) {
        this.job = job;
    }

    public Seekers getSeeker() {
        return seeker;
    }

    public void setSeeker(Seekers seeker) {
        this.seeker = seeker;
    }

    public Applications getSelected() {
        if (current == null) {
            current = new Applications();
            selectedItemIndex = -1;
        }
        return current;
    }

    public void setSelected(Applications current) {
        this.current = current;
    }

    public String download() {
        ServletContext context;
        context = (ServletContext) FacesContext.getCurrentInstance().getExternalContext().getContext();
        HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
        response.reset();
        response.setContentType("application/force-download");
        String uploadPath = ResourceBundle.getBundle("/Bundle").getString("jobApplications");
        String realPath = uploadPath + current.getAttachment();
        File filename = new File(realPath);
        response.addHeader("Content-Disposition", "attachment; filename=\"" + current.getAttachment() + "\"");
        response.addHeader("Content-Type", new MimetypesFileTypeMap().getContentType(filename));

        byte[] buf = new byte[1024];
        try {
            long length = filename.length();
            BufferedInputStream in = new BufferedInputStream(new FileInputStream(filename));
            ServletOutputStream out = response.getOutputStream();
            response.setContentLength((int) length);
            while ((in != null) && ((length = in.read(buf)) != -1)) {
                out.write(buf, 0, (int) length);
            }
            in.close();
            out.close();
            filename = null;
            realPath = null;
        } catch (Exception exc) {
        }
        FacesContext.getCurrentInstance().responseComplete();
        return "download";
    }

    public String addComment(String phase) {
        userRecord = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        current.setUserid(userRecord);
        Notes note = new Notes();
        note.setComment(getInternalcomment());
        note.setUserid(userRecord);
        note.setDatecreated(new Date());
        note.setDatemodified(new Date());
        note.setStage(phase);
        note.setParent(0);
        note.setApplicationid(getSelected());
        notesController.getFacade().create(note);
        clearInfo();
        current = (Applications) getEntityManager().createNamedQuery("Applications.findSameApplication").setParameter("jobid", getJob()).setParameter("id", current.getId()).setMaxResults(1).getSingleResult();
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("CommentsUpdated"));
        viewSeeker();
        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    public String removeComment(Notes note) {
        Logger.getLogger(ApplicationsController.class.getName()).log(Level.SEVERE, note.getComment());
        notesController.getFacade().remove(note);
        clearInfo();
        current = (Applications) getEntityManager().createNamedQuery("Applications.findSameApplication").setParameter("jobid", getJob()).setParameter("id", current.getId()).setMaxResults(1).getSingleResult();
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("CommentRemoved"));
        viewSeeker();
        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    public String firstShortList() {
        try {
//            TODO: add interview date
            utx.begin();
            List<Firstshortlist> shortlist = (List<Firstshortlist>) getEntityManager().createNamedQuery("Firstshortlist.findshortlist").setParameter("jobid", job).setParameter("seekerid", seeker).setMaxResults(1).getResultList();
            if (shortlist.size() >= 1) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("candidateAlreadyShortlisted"));
                shortlist = null;
                return null;
            }

            Firstshortlist firstShortList = new Firstshortlist();
            userRecord = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            firstShortList.setUserid(userRecord);
            firstShortList.setApplicationid(getSelected());
            firstShortList.setJobid(job);
            firstShortList.setDatemodified(new Date());
            firstShortList.setSeekerid(seeker);
            firstShortList.setInternalcomment(internalcomment);
            firstShortList.setSeekercomment(seekercomment);
            getEntityManager().persist(firstShortList);

            utx.commit();
        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException ex) {
            Logger.getLogger(ApplicationsController.class.getName()).log(Level.SEVERE, null, ex);
        }
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("Seekershortlisted"));
        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    public void viewNext() {
        clearInfo();
        current = (Applications) getEntityManager().createNamedQuery("Applications.findNextApplication").setParameter("jobid", getJob()).setParameter("id", current.getId()).setMaxResults(1).getSingleResult();
        viewSeeker();
    }

    public void viewPrevious() {
        clearInfo();
        current = (Applications) getEntityManager().createNamedQuery("Applications.findPreviousApplication").setParameter("jobid", getJob()).setParameter("id", current.getId()).setMaxResults(1).getSingleResult();
        viewSeeker();
    }

    public void clearInfo() {
        workController.setEmploymentRecord(null);
        educationController.setEducationRecord(null);
        pagesController.setPageRecord(null);
        setInternalcomment(null);
        setSeekercomment(null);
    }

    public String viewSeeker() {
        clearInfo();
        current.setViewed(Boolean.TRUE);
        getFacade().edit(current);
        this.seeker = current.getSeekerid();
        this.seekercomment = current.getComment();
//        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "viewSeeker";
    }

    public String viewTopSeeker() {
        resultsModel.setRowIndex(resultsModel.getRowIndex());
        selectedSeeker = resultsModel.getRowIndex();
        current = (Applications) getEntityManager().createNamedQuery("Applications.findApplicant").setParameter("jobid", job).setParameter("seekerid", seeker).setMaxResults(1).getSingleResult();
        this.seekercomment = current.getComment();
        current.setViewed(Boolean.TRUE);
        getFacade().edit(current);
        return "viewTopSeeker";
    }

    public String viewNextSeeker() {
        clearInfo();
        selectedSeeker++;
        resultsModel.setRowIndex(selectedSeeker);
        seeker = (Seekers) resultsModel.getRowData();
        current = (Applications) getEntityManager().createNamedQuery("Applications.findApplicant").setParameter("jobid", current.getJobid()).setParameter("seekerid", seeker).setMaxResults(1).getSingleResult();
        this.seekercomment = current.getComment();
        current.setViewed(Boolean.TRUE);
        getFacade().edit(current);
        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    public String viewPreviousSeeker() {
        clearInfo();
        selectedSeeker--;
        resultsModel.setRowIndex(selectedSeeker);
        seeker = (Seekers) resultsModel.getRowData();
        current = (Applications) getEntityManager().createNamedQuery("Applications.findApplicant").setParameter("jobid", current.getJobid()).setParameter("seekerid", seeker).setMaxResults(1).getSingleResult();
        this.seekercomment = current.getComment();
        current.setViewed(Boolean.TRUE);
        getFacade().edit(current);
        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    private ApplicationsFacade getFacade() {
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

    public PaginationHelper getApplicantPagination(final Jobs jobid) {
        if (pagination == null) {
            pagination = new PaginationHelper(10) {
                @Override
                public int getItemsCount() {
                    return getFacade().count(jobid);
                }

                @Override
                public DataModel createPageDataModel() {
                    return new ListDataModel(getFacade().findApplicantRange(new int[]{getPageFirstItem(), getPageFirstItem() + getPageSize()}, jobid));
                }
            };
        }
        return pagination;
    }

    public String prepareApplicants() {
        clearData();
        prepareApplications();
        return "Applicants";
    }

    public void prepareApplications() {
        Jobs currentJob = getJob();
        if (applicants == null) {
            applicants = getApplicantPagination(currentJob).createPageDataModel();
        }
    }

    public String unseen() {
        getFacade().setViewed(Boolean.FALSE);
        prepareApplications();
        return "Applicants";
    }

    public String seen() {
        getFacade().setViewed(Boolean.TRUE);
        prepareApplications();
        return "Applicants";
    }

    public void clearData() {
        pagination = null;
        applicants = null;
        lastApplication = null;
        firstApplication = null;
        getFacade().setViewed(null);
    }

    public String returnToApplicants() {
        return "Applicants";
    }

    public ListDataModel getResultsModel() {
        return resultsModel;
    }

    public void setResultsModel(ListDataModel resultsModel) {
        this.resultsModel = resultsModel;
    }

    public String getRecommendations() {
        applicants = null;
        Jobs currentJob = getJob();
        List<Seekers> seekers = (List<Seekers>) getEntityManager().createNamedQuery("Applications.findSeekerID").setParameter("jobid", currentJob).getResultList();

        if (seekers.size() < 1) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("noApplicantsFound") + " " + currentJob.getTitle());
            return null;
        }
        String searchTerms = currentJob.getTitle() + " " + currentJob.getJobdescription() + " " + currentJob.getQualifications();
        FullTextEntityManager fullTextEntityManager = org.hibernate.search.jpa.Search.getFullTextEntityManager(getEntityManager());
        final QueryBuilder b = fullTextEntityManager.getSearchFactory().buildQueryBuilder().forEntity(Seekers.class).get();

        org.apache.lucene.search.Query luceneQuery = b.keyword()
                .fuzzy()
                .withThreshold(0.8f)
                .withPrefixLength(1)
                .onField("work_position").boostedTo(12)
                .andField("work_jobdescription").boostedTo(11)
                .andField("work_company").boostedTo(10)
                .andField("education_certification").boostedTo(9)
                .andField("education_institution").boostedTo(8)
                .andField("files_filename").boostedTo(7)
                .andField("files_description").boostedTo(6)
                .andField("files_metadata").boostedTo(5)
                .andField("coverletters_letter").boostedTo(4)
                .andField("coverletters_name").boostedTo(3)
                .andField("pages_title").boostedTo(2)
                .andField("pages_content").boostedTo(1)
                .matching(searchTerms).createQuery();
        FullTextQuery fullTextQuery = fullTextEntityManager.createFullTextQuery(luceneQuery, Seekers.class);
        fullTextQuery.enableFullTextFilter("jobApplicants").setParameter("applicants", seekers);
        searchResults = (List<Seekers>) fullTextQuery.setMaxResults(10).getResultList();
        resultsModel = new ListDataModel();
        resultsModel.setWrappedData(searchResults);
        return "Recommendations";
    }

    public DataModel<Applications> getApplicants() {
        recreateApplicantModel();
        if (applicants == null) {
            applicants = getApplicantPagination(job).createPageDataModel();
        }
        return applicants;
    }

    public void setApplicants(DataModel<Applications> applicants) {
        this.applicants = applicants;
    }

    public String prepareList() {
        recreateModel();
        if (items.getRowCount() == 0) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("ListApplicationsEmpty"));
        }
        return "List";
    }

    public String prepareView() {
        current = (Applications) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareCreate() {
        current = new Applications();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            getFacade().create(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("ApplicationsCreated"));
            return prepareCreate();
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String prepareEdit() {
        current = (Applications) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public void updateComment() {
        try {
            current.setDatemodified(new Date());
            current.setCommentdate(new Date());
            current.setComment(seekercomment);
            current.setUserid((Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult());
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("ApplicationCommentUpdated"));
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
        }
    }

    public String update() {
        try {
            if (getApplicationForm() != null) {
                InputStream stream = getApplicationForm().getInputStream();
                String uploadPath = ResourceBundle.getBundle("/Bundle").getString("jobApplications");
                File newUploadFile;
                int size = (int) getApplicationForm().getSize();
                String name = getApplicationForm().getName();
                current.setAttachment(name);
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
                FileOutputStream outstream = new FileOutputStream(uploadPath + name);
                outstream.write(buffer);
                outstream.close();

            }
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("ApplicationsUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Applications) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("ApplicationsDeleted"));
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
        recreateModel();
        if (items == null) {
            items = getPagination().createPageDataModel();
        }
        return items;
    }

    private void recreateModel() {
        items = null;
    }

    private void recreateApplicantModel() {
        applicants = null;
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

    public String applicantNext() {
        recreateApplicantModel();
        getApplicantPagination(getJob()).nextPage();
        return "Applicants";
    }

    public String applicantPrevious() {
        recreateApplicantModel();
        getApplicantPagination(getJob()).previousPage();
        return "Applicants";
    }

    public SelectItem[] getItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(ejbFacade.findAll(), false);
    }

    public SelectItem[] getItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(ejbFacade.findAll(), true);
    }

    @FacesConverter(forClass = Applications.class)
    public static class ApplicationsControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            ApplicationsController controller = (ApplicationsController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "applicationsController");
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
            if (object instanceof Applications) {
                Applications o = (Applications) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + ApplicationsController.class.getName());
            }
        }
    }
}
