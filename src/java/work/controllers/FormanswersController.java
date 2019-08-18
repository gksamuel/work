package work.controllers;

import work.objects.Formanswers;
import work.controllers.util.JsfUtil;
import work.controllers.util.PaginationHelper;
import work.facade.FormanswersFacade;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.faces.model.SelectItem;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import work.objects.Formquestions;
import work.objects.Forms;
import work.objects.Seekers;

@ManagedBean(name = "formanswersController")
@SessionScoped
public class FormanswersController implements Serializable {

    private static final long serialVersionUID = -4489489205470081796L;

    private Formanswers current;
    private DataModel items = null;
    @EJB
    private work.facade.FormanswersFacade ejbFacade;
    private PaginationHelper pagination;
    private int selectedItemIndex;
    private Forms formid;
    private Integer numQuestions;
    private Integer questionNum = 1;
    private Integer progress;
    private String question;
    private String answer;
    private Seekers seekerid;
    private Formquestions formquestionID;
    @Resource
    private javax.transaction.UserTransaction utx;

    @ManagedProperty(value = "#{jobsController}")
    private JobsController jobsController;

    public FormanswersController() {
    }

    public Formanswers getSelected() {
        if (current == null) {
            current = new Formanswers();
            selectedItemIndex = -1;
        }
        return current;
    }

    public Seekers getSeekerid() {
        if (seekerid == null) {
            this.seekerid = (Seekers) ejbFacade.getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        }
        return seekerid;
    }

    public void setSeekerid(Seekers seekerid) {
        this.seekerid = seekerid;
    }

    public Forms getFormid() {
        if (formid == null) {
            setFormid(jobsController.getApplication().getJobid().getFormid());
        }
        return formid;
    }

    public void setFormid(Forms formid) {
        this.formid = formid;
    }

    public JobsController getJobsController() {
        return jobsController;
    }

    public void setJobsController(JobsController jobsController) {
        this.jobsController = jobsController;
    }

    public Integer getNumQuestions() {
        if (numQuestions == null) {
            numQuestions = ejbFacade.getEntityManager().createNamedQuery("Formquestions.findAllQuestions").setParameter("formid", getFormid()).getResultList().size();
        }
        return numQuestions;
    }

    public Integer getQuestionNum() {
        return questionNum;
    }

    public void setQuestionNum(Integer questionNum) {
        this.questionNum = questionNum;
    }

    public Integer getProgress() {
        Double result = (((double) questionNum / (double) numQuestions) * 100);
        progress = result.intValue();
        return progress;
    }

    public String getQuestion() {
        Formquestions formQuestion;
        int id = 0;
        if (current != null) {
            if (current.getFormquestionid() != null) {
                id = current.getFormquestionid().getId();
            }
        }

        List<Formquestions> questionList = (List<Formquestions>) ejbFacade.getEntityManager().createNamedQuery("Formquestions.findQuestion").setParameter("id", id).setParameter("formid", getFormid()).setMaxResults(1).getResultList();
        if (questionList.size() == 1) {
            formQuestion = (Formquestions) questionList.get(0);
            this.question = formQuestion.getQuestion();
            setFormquestionID(formquestionID);
            this.formquestionID = formQuestion;
        }
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Formquestions getFormquestionID() {
        return formquestionID;
    }

    public void setFormquestionID(Formquestions formquestionID) {
        this.formquestionID = formquestionID;
    }

    private FormanswersFacade getFacade() {
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
        current = (Formanswers) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "View";
    }

    public String prepareCreate() {
        current = new Formanswers();
        selectedItemIndex = -1;
        return "Create";
    }

    public String create() {
        try {
            getFacade().create(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FormanswersCreated"));
            return prepareCreate();
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String createUpdate() {
        try {
            utx.begin();
            Map<String, String> params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
            List<Formanswers> formAnswers = (List<Formanswers>) ejbFacade.getEntityManager().createNamedQuery("Formanswers.findAnswer")
                    .setParameter("formid", formid)
                    .setParameter("formquestionid", formquestionID)
                    .setParameter("seekerid", getSeekerid())
                    .setMaxResults(1)
                    .getResultList();
            if (formAnswers.size() == 1) {
                current = (Formanswers) formAnswers.get(0);
                current.setQuestion(params.get("answerForm:question"));
                current.setAnswer(params.get("answerForm:answer"));
                current.setFormid(formid);
                current.setFormquestionid(getFormquestionID());
                current.setDatemodified(new Date());
                current.setSeekerid(getSeekerid());
                ejbFacade.getEntityManager().persist(current);
            } else {
                current = new Formanswers();
                current.setQuestion(params.get("answerForm:question"));
                current.setAnswer(params.get("answerForm:answer"));
                current.setFormid(formid);
                current.setFormquestionid(getFormquestionID());
                current.setDatemodified(new Date());
                current.setSeekerid(getSeekerid());
                ejbFacade.getEntityManager().persist(current);
            }
            utx.commit();
            current.setAnswer(null);
            if (getQuestionNum().compareTo(getNumQuestions()) == 0) {
                JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("ApplicationsComplete"));
                return "Complete";
            }
            questionNum++;
        } catch (NotSupportedException | SystemException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
            Logger.getLogger(FormanswersController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Create";
    }

    public String prepareEdit() {
        current = (Formanswers) getItems().getRowData();
        selectedItemIndex = pagination.getPageFirstItem() + getItems().getRowIndex();
        return "Edit";
    }

    public String update() {
        try {
            getFacade().edit(current);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FormanswersUpdated"));
            return "View";
        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            return null;
        }
    }

    public String destroy() {
        current = (Formanswers) getItems().getRowData();
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
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("FormanswersDeleted"));
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

    public Formanswers getFormanswers(java.lang.Integer id) {
        return ejbFacade.find(id);
    }

    @FacesConverter(forClass = Formanswers.class)
    public static class FormanswersControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            FormanswersController controller = (FormanswersController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "formanswersController");
            return controller.getFormanswers(getKey(value));
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
            if (object instanceof Formanswers) {
                Formanswers o = (Formanswers) object;
                return getStringKey(o.getId());
            } else {
                throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: " + Formanswers.class.getName());
            }
        }

    }

}
