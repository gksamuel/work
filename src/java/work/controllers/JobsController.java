package work.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
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
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.*;
import javax.validation.constraints.Pattern;
import org.apache.myfaces.custom.fileupload.UploadedFile;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.FullTextQuery;
import org.hibernate.search.query.dsl.QueryBuilder;
import work.controllers.util.BrowsePaginationHelper;
import work.controllers.util.JsfUtil;
import work.controllers.util.MyPaginationHelper;
import work.controllers.util.PaginationHelper;
import work.facade.JobsFacade;
import work.objects.*;
import work.utils.Email;

@ManagedBean(name = "jobsController")
@SessionScoped
public class JobsController extends JobsFacade implements Serializable {

    private static final long serialVersionUID = 6665772572427063498L;
    private Jobs current;
    private Jobs jobRecord;
    private String jobReference;
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "Invalid email address")//if the field contains email address consider using this annotation to enforce field validation
    private String friendEmail;
    private String friendName;
    private Seekers seekerRecord;
    private String internalcomment;
    private String abuseComment;
    private DataModel items = null;
    private DataModel browseItems = null;
    private DataModel myItems = null;
    private UploadedFile applicationForm;
    @EJB
    private work.facade.JobsFacade ejbFacade;
    @EJB
    private work.facade.CoverlettersFacade coverFacade;
    private PaginationHelper pagination;
    private BrowsePaginationHelper browsePagination;
    private MyPaginationHelper myPagination;
    private int selectedItemIndex;
    private String searchTerms;
    private ListDataModel resultsModel;
    private ListDataModel seekerResultsModel;
    private List<Jobs> searchResults;
    private List<Seekers> seekerResults;
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;
    private Coverletters coverLetter;
    private Applications application;
    private Integer selectedSeeker;

    @ManagedProperty(value = "#{workController}")
    private WorkController workController;
    @ManagedProperty(value = "#{educationController}")
    private EducationController educationController;
    @ManagedProperty(value = "#{pagesController}")
    private PagesController pagesController;

    public JobsController() {
    }

    public UploadedFile getApplicationForm() {
        return applicationForm;
    }

    public void setApplicationForm(UploadedFile applicationForm) {
        this.applicationForm = applicationForm;
    }

    public Jobs getSelected() {
        if (current == null) {
            current = getJobRecord();
            selectedItemIndex = -1;
        }
        return current;
    }

    public Jobs getJobRecord() {
        return jobRecord;
    }

    public Seekers getSeekerRecord() {
        return seekerRecord;
    }

    public void setSeekerRecord(Seekers seekerRecord) {
        this.seekerRecord = seekerRecord;
    }

    public void setJobRecord(Jobs jobRecord) {
        this.jobRecord = jobRecord;
    }

    public String getSearchTerms() {
        return searchTerms;
    }

    public void setSearchTerms(String searchTerms) {
        this.searchTerms = searchTerms;
    }

    public String getJobReference() {
        return jobReference;
    }

    public void setJobReference(String jobReference) {
        this.jobReference = jobReference;
    }

    public String getInternalcomment() {
        return internalcomment;
    }

    public String getAbuseComment() {
        return abuseComment;
    }

    public void setAbuseComment(String abuseComment) {
        this.abuseComment = abuseComment;
    }

    public void setInternalcomment(String internalcomment) {
        this.internalcomment = internalcomment;
    }

    public String getFriendEmail() {
        return friendEmail;
    }

    public void setFriendEmail(String friendEmail) {
        this.friendEmail = friendEmail;
    }

    public String getFriendName() {
        return friendName;
    }

    public void setFriendName(String friendName) {
        this.friendName = friendName;
    }

    private JobsFacade getFacade() {
        return ejbFacade;
    }

    public Applications getApplication() {
        return application;
    }

    public void setApplication(Applications application) {
        this.application = application;
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

    public String addApplication() {
        try {
            utx.begin();
            Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();

            application = new Applications();

            List<Applications> applicants = (List<Applications>) getEntityManager().createNamedQuery("Applications.findApplicant").setParameter("jobid", current).setParameter("seekerid", seekerRecord).setMaxResults(1).getResultList();
            if (applicants.size() > 0) {
                application = (Applications) applicants.get(0);
                application.setComment(getInternalcomment());
                application.setDatemodified(new Date());
                application.setCommentdate(new Date());
                em.merge(application);
                em.flush();
                utx.commit();
                JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("applicationUpdated"));
                return "ViewSeeker";
            } else {
                application.setUserid(user);
                application.setLetter(ResourceBundle.getBundle("/Bundle").getString("addedByEmployer"));
                application.setJobid(current);
                application.setSeekerid(seekerRecord);
                application.setComment(getInternalcomment());
                application.setViewed(Boolean.TRUE);
                application.setDatemodified(new Date());
                application.setCommentdate(new Date());
                getEntityManager().persist(application);
                utx.commit();
            }
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("applicationCreated"));
        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | SystemException | NotSupportedException ex) {
            Logger.getLogger(JobsController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "ViewSeeker";
    }

    public String download() {
//        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        ServletContext context;
        context = (ServletContext) FacesContext.getCurrentInstance().getExternalContext().getContext();
        HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
        response.reset();
        response.setContentType("application/force-download");
        String uploadPath = ResourceBundle.getBundle("/Bundle").getString("jobAttachments");
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
        } catch (IOException exc) {
        }
        FacesContext.getCurrentInstance().responseComplete();
        return "download";
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

    public BrowsePaginationHelper getBrowsePagination() {
        if (browsePagination == null) {
            browsePagination = new BrowsePaginationHelper(10) {
                @Override
                public int getItemsCount() {
                    return getFacade().browseCount();
                }

                @Override
                public DataModel createPageDataModel() {
                    return new ListDataModel(getFacade().findBrowseRange(new int[]{getPageFirstItem(), getPageFirstItem() + getPageSize()}));
                }
            };
        }
        return browsePagination;
    }

    public MyPaginationHelper getMyPagination() {
        if (myPagination == null) {
            myPagination = new MyPaginationHelper(10) {
                @Override
                public int getItemsCount() {
                    return getFacade().myCount();
                }

                @Override
                public DataModel createPageDataModel() {
                    return new ListDataModel(getFacade().findMyRange(new int[]{getPageFirstItem(), getPageFirstItem() + getPageSize()}));
                }
            };
        }
        return myPagination;
    }

    public String prepareList() {
        setItems(null);
        this.items = null;
        recreateModel();
        this.items = getPagination().createPageDataModel();
        return "List";
    }

    public String browseList() {
        recreateBrowseModel();
        return "Browse";
    }

    public String ListMyJobs() {
        recreateModel();
        return "MyList";
    }

    public String prepareView() {
        Logger.getLogger(JobsController.class.getName()).log(Level.SEVERE, getJobRecord().getTitle());
        current = getJobRecord();
        Logger.getLogger(JobsController.class.getName()).log(Level.SEVERE, current.getTitle());
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareApply() {
        current = (Jobs) getEntityManager().createNamedQuery("Jobs.findOne").setParameter("id", getJobRecord().getId()).getSingleResult();
        if (current.getAbuseCollection().size() > 0) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("abuseReports").replace("X", String.valueOf(current.getAbuseCollection().size())));
        }
        return "Apply";
    }

    public String prepareApplication() {
        current = (Jobs) getJobRecord();
        return "Application";
    }

    public String tellAFriend() {
        return "TellAFriend";
    }

    public String SendToFriend() {
        try {
            utx.begin();
            Seekers seeker = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            Tellafriend tellAFriend = new Tellafriend();
            tellAFriend.setSeekerid(seeker);
            tellAFriend.setJobid(getJobRecord());
            tellAFriend.setFriend(getFriendEmail());
            tellAFriend.setName(friendName);
            tellAFriend.setDatecreated(new Date());
            em.persist(tellAFriend);
            utx.commit();
            Email email = new Email();
            email.tellAFriend(tellAFriend, getJobRecord(), seeker);
        } catch (NotSupportedException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | SystemException ex) {
            Logger.getLogger(JobsController.class.getName()).log(Level.SEVERE, null, ex);
        }
        JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("VacancySent"));
        return "TellAFriend";
    }

    public String reportAbuse() {
        return "Abuse";
    }

    public String submitReport() {
        try {
            utx.begin();
            Abuse abuse = new Abuse();
            Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            List<Abuse> abuseList = (List<Abuse>) em.createNamedQuery("Abuse.findReport").setParameter("seekerid", seeker).setParameter("jobid", current).setMaxResults(1).getResultList();
            if (abuseList.size() == 1) {
                abuse = abuseList.get(0);
                abuse.setComment(getAbuseComment());
                abuse.setDatesubmitted(new Date());
                em.persist(abuse);
                JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("AbuseUpdated"));
            } else {
                abuse.setComment(getAbuseComment());
                abuse.setDatesubmitted(new Date());
                abuse.setSeekerid(seeker);
                abuse.setJobid(current);
                em.persist(abuse);
                JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("AbuseSubmitted"));
            }
            utx.commit();

        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException ex) {
            Logger.getLogger(JobsController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Abuse";
    }

    public SelectItem[] getCoverFacade() {
        return JsfUtil.getSelectItems(ejbFacade.findAll(), true);
    }

    public Coverletters getCoverLetter() {
        return coverLetter;
    }

    public void setCoverLetter(Coverletters coverLetter) {
        this.coverLetter = coverLetter;
    }

    public String submitApplication() {
        FileOutputStream outstream = null;
        try {
            utx.begin();
            application = new Applications();
            application.setJobid(current);
            Seekers seeker = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            List<Applications> applications = (List<Applications>) getEntityManager().createNamedQuery("Applications.findApplication").setParameter("jobid", current).setParameter("seekerid", seeker).setMaxResults(1).getResultList();
            if (applications.size() >= 1) {
                JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("haveAlreadyApplied"));
                applications = null;
                return null;
            }
            if (getApplicationForm() != null) {
                InputStream stream = getApplicationForm().getInputStream();
                String uploadPath = ResourceBundle.getBundle("/Bundle").getString("jobApplications");
                String quarantinePath = ResourceBundle.getBundle("/Bundle").getString("quarantinePath");

                File newUploadFile;
                int size = (int) getApplicationForm().getSize();
                String name = getApplicationForm().getName();
                application.setAttachment(name);
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
                outstream = new FileOutputStream(quarantinePath + name);
                outstream.write(buffer);
                outstream.close();

                try {
                    Process p = Runtime.getRuntime().exec(new String[]{"clamscan", quarantinePath + name});
                    p.waitFor();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
                    String line = reader.readLine();
                    if (line.substring((line.length() - 2), line.length()).compareTo("OK") == 0) {
                        p = Runtime.getRuntime().exec("mv " + quarantinePath + name + " " + uploadPath);
                        p.waitFor();
                    } else {
                        p = Runtime.getRuntime().exec("rm " + quarantinePath + name);
                        p.waitFor();
                        JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("VirusFound"));
                        return null;
                    }
                } catch (IOException | InterruptedException e1) {
                }
            }
            application.setSeekerid(seeker);
            application.setDatemodified(new Date());
            application.setCommentdate(new Date());
            application.setLetter(coverLetter.getLetter());
            setApplication(application);
            if (current.getFormid() != null) {
                FacesContext.getCurrentInstance().getExternalContext().redirect("/faces/formanswers/Create.xhtml");
            }

            getEntityManager().persist(application);
            getEntityManager().flush();
            utx.commit();

            Email email = new Email();
            email.sendApplication(application);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("ApplicationSubmitted"));
        } catch (IOException | NotSupportedException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | SystemException ex) {
            Logger.getLogger(JobsController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "Application";
    }

    public String prepareCreate() {
        current = new Jobs();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            if (getApplicationForm() != null) {
                InputStream stream = getApplicationForm().getInputStream();
                String uploadPath = ResourceBundle.getBundle("/Bundle").getString("jobAttachments");
                String quarantinePath = ResourceBundle.getBundle("/Bundle").getString("quarantinePath");

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
                FileOutputStream outstream = new FileOutputStream(quarantinePath + name);
                outstream.write(buffer);
                outstream.close();
                try {
                    Process p = Runtime.getRuntime().exec(new String[]{"clamscan", quarantinePath + name});
                    p.waitFor();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
                    String line = reader.readLine();
                    if (line.substring((line.length() - 2), line.length()).compareTo("OK") == 0) {
                        p = Runtime.getRuntime().exec(new String[]{"mv", quarantinePath + name, uploadPath});
                        p.waitFor();
                    } else {
                        p = Runtime.getRuntime().exec(new String[]{"rm", quarantinePath + name});
                        p.waitFor();
                        JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("VirusFound"));
                        return null;
                    }
                } catch (IOException | InterruptedException e1) {
                }

            }
            current.setDatemodified(new Date());
            Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            current.setCompanyid(user.getCompanyid());
            current.setUserid(user);
            getFacade().create(current);
            items = null;
            getRecomendations(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("JobsCreated"));
            return "Instant";
        } catch (IOException e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String ViewSeeker() {
        seekerResultsModel.setRowIndex(seekerResultsModel.getRowIndex());
        selectedSeeker = seekerResultsModel.getRowIndex();
        seekerRecord = getSeekerRecord();
        setInternalcomment(null);
        return "ViewSeeker";
    }

    public String viewNextSeeker() {
        clearInfo();
        selectedSeeker++;
        seekerResultsModel.setRowIndex(selectedSeeker);
        seekerRecord = (Seekers) seekerResultsModel.getRowData();
        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    public String viewPreviousSeeker() {
        clearInfo();
        selectedSeeker--;
        seekerResultsModel.setRowIndex(selectedSeeker);
        seekerRecord = (Seekers) seekerResultsModel.getRowData();
        return FacesContext.getCurrentInstance().getViewRoot().getViewId();
    }

    public void clearInfo() {
        workController.setEmploymentRecord(null);
        educationController.setEducationRecord(null);
        pagesController.setPageRecord(null);
    }

    public ListDataModel getSeekerResultsModel() {
        if (seekerResultsModel == null) {
            seekerResultsModel = new ListDataModel();
        }
        seekerResultsModel.setWrappedData(getSeekerResults());
        return seekerResultsModel;
    }

    public List<Seekers> getSeekerResults() {
        return seekerResults;
    }

    public void setSeekerResults(List<Seekers> seekerResults) {
        this.seekerResults = seekerResults;
    }

    public void setSeekerResultsModel(ListDataModel seekerResultsModel) {
        this.seekerResultsModel = seekerResultsModel;
    }

    public void getRecomendations(Jobs currentJob) {
        searchTerms = currentJob.getTitle() + " " + currentJob.getJobdescription() + " " + currentJob.getQualifications();
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
        seekerResults = (List<Seekers>) fullTextQuery.setMaxResults(10).getResultList();
        seekerResultsModel = new ListDataModel();
        seekerResultsModel.setWrappedData(seekerResults);
    }

    public String prepareEdit() {
        current = getJobRecord();
        return "Edit";
    }

    public String update() {
        try {
            if (getApplicationForm() != null) {
                InputStream stream = getApplicationForm().getInputStream();
                String uploadPath = ResourceBundle.getBundle("/Bundle").getString("jobAttachments");
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
            current.setDatemodified(new Date());
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("JobsUpdated"));
            return "View";
        } catch (IOException e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Jobs) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("JobsDeleted"));
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

    public void setItems(DataModel items) {
        this.items = items;
    }

    public DataModel getBrowseItems() {
        browseItems = null;
        if (browseItems == null) {
            browseItems = getBrowsePagination().createPageDataModel();
        }
        return browseItems;
    }

    private void recreateModel() {
        this.items = null;
        this.myItems = null;
    }

    private void recreateBrowseModel() {
        browseItems = null;
    }

    public DataModel getMyItems() {
        this.myItems = null;
        if (myItems == null) {
            myItems = getMyPagination().createPageDataModel();
        }
        return myItems;
    }

    private void recreatePagination() {
        pagination = null;
    }

    public String next() {
        getPagination().nextPage();
        recreateModel();
        return "List";
    }

    public String browseNext() {
        getBrowsePagination().nextPage();
        recreateBrowseModel();
        return "Browse";
    }

    public String previous() {
        getPagination().previousPage();
        recreateModel();
        return "List";
    }

    public String browsePrevious() {
        getBrowsePagination().previousPage();
        recreateBrowseModel();
        return "Browse";
    }

    public SelectItem[] getItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(ejbFacade.findAll(), false);
    }

    public SelectItem[] getItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(coverFacade.findUserLetters(), true);
    }

    public List<Jobs> getSearchResults() {
        return searchResults;
    }

    public void setSearchResults(List<Jobs> searchResults) {
        this.searchResults = searchResults;
    }

    public ListDataModel getResultsModel() {
        if (resultsModel == null) {
            resultsModel = new ListDataModel();
        }
        resultsModel.setWrappedData(getSearchResults());
        return resultsModel;
    }

    public void setResultsModel(ListDataModel resultsModel) {
        this.resultsModel = resultsModel;
    }

    public String searchReference() {
        searchResults = (List<Jobs>) getEntityManager().createNamedQuery("Jobs.searchReference").setParameter("referenceno", jobReference).getResultList();
        resultsModel = new ListDataModel();
        resultsModel.setWrappedData(searchResults);
        return "search";
    }

    public String search() {
        FullTextEntityManager fullTextEntityManager = org.hibernate.search.jpa.Search.getFullTextEntityManager(em);
        final QueryBuilder b = fullTextEntityManager.getSearchFactory().buildQueryBuilder().forEntity(Jobs.class).get();
        org.apache.lucene.search.Query luceneQuery = b.keyword()
                .fuzzy()
                .withThreshold(0.8f)
                .withPrefixLength(1)
                .onField("title").boostedTo(6)
                .andField("referenceno").boostedTo(5)
                .andField("summary").boostedTo(4)
                .andField("jobdescription").boostedTo(4)
                .andField("qualifications").boostedTo(3)
                .andField("qualifications").boostedTo(2)
                .andField("instructions").boostedTo(1)
                .matching(searchTerms).createQuery();
        javax.persistence.Query fullTextQuery = fullTextEntityManager.createFullTextQuery(luceneQuery);
        searchResults = (List<Jobs>) fullTextQuery.getResultList();
        resultsModel = new ListDataModel();
        resultsModel.setWrappedData(searchResults);
        return "search";
    }

    public String searchJobs() {
        setItems(null);
        this.items = null;
        try {
            utx.begin();

            Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();

            FullTextEntityManager fullTextEntityManager = org.hibernate.search.jpa.Search.getFullTextEntityManager(em);
            final QueryBuilder b = fullTextEntityManager.getSearchFactory().buildQueryBuilder().forEntity(Jobs.class).get();
            org.apache.lucene.search.Query luceneQuery = b.bool()
                    .must(b.keyword().onField("company_id").matching(user.getCompanyid().getId()).createQuery())
                    .must(b.keyword().fuzzy().onField("title").matching(searchTerms).createQuery())
                    .createQuery();
            javax.persistence.Query fullTextQuery = fullTextEntityManager.createFullTextQuery(luceneQuery);
            searchResults = (List<Jobs>) fullTextQuery.getResultList();
            items = new ListDataModel();
            items.setWrappedData(searchResults);
            Logger.getLogger(JobsController.class.getName()).log(Level.SEVERE, String.valueOf(items.getRowCount()));
            utx.commit();
        } catch (NotSupportedException | SystemException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
            Logger.getLogger(JobsController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "List";
    }

    @FacesConverter(forClass = Jobs.class)
    public static class JobsControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            JobsController controller = (JobsController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "jobsController");
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
            if (object instanceof Jobs) {
                Jobs o = (Jobs) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + JobsController.class.getName());
            }
        }
    }
}
