/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.controllers;

import java.io.Serializable;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.application.FacesMessage;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.primefaces.component.tabview.TabView;
import org.primefaces.event.TabChangeEvent;
import work.objects.Users;

/**
 *
 * @author gachanja
 */
@ManagedBean(name = "tabBean")
@SessionScoped
public class TabBean implements Serializable {

    private static final long serialVersionUID = -1387996022176440687L;

    private Integer activeTabIndex = 10;
    private Integer activeSearchIndex = 0;
    private Integer activeRegistrationIndex = 0;
    private Integer activePaymentIndex = 0;
    private Integer activeSeekerIndex = 0;
    private String tmp;
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    private Users userRecord;

    /**
     * Creates a new instance of TabBean
     */
    public TabBean() {
    }

    public Users getUserRecord() {
        if (userRecord == null) {
            userRecord = (Users) em.createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        }
        return userRecord;
    }

    public void setUserRecord(Users userRecord) {
        this.userRecord = userRecord;
    }

    public Integer getActiveTabIndex() {
        return activeTabIndex;
    }

    public void setActiveTabIndex(Integer activeTabIndex) {
        this.activeTabIndex = activeTabIndex;
    }

    public Integer getActiveSearchIndex() {
        return activeSearchIndex;
    }

    public void setActiveSearchIndex(Integer activeSearchIndex) {
        this.activeSearchIndex = activeSearchIndex;
    }

    public Integer getActiveRegistrationIndex() {
        return activeRegistrationIndex;
    }

    public void setActiveRegistrationIndex(Integer activeRegistrationIndex) {
        this.activeRegistrationIndex = activeRegistrationIndex;
    }

    public Integer getActivePaymentIndex() {
        return activePaymentIndex;
    }

    public void setActivePaymentIndex(Integer activePaymentIndex) {
        this.activePaymentIndex = activePaymentIndex;
    }

    public Integer getActiveSeekerIndex() {
        return activeSeekerIndex;
    }

    public void setActiveSeekerIndex(Integer activeSeekerIndex) {
        this.activeSeekerIndex = activeSeekerIndex;
    }

    public void onSeekerTabChange(TabChangeEvent event) {
        activeSeekerIndex = ((TabView) event.getSource()).getIndex();
    }

    public String getTmp() {
        return tmp;
    }

    public void setTmp(String tmp) {
        this.tmp = tmp;
    }

    public void changeTab() {
        tmp = FacesContext.getCurrentInstance().getExternalContext().getRequestPathInfo();
        HashMap<String, Integer> urls = new HashMap<>();
        activeTabIndex = 10;
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
            urls.put("/work/List.xhtml", 0);
            urls.put("/education/List.xhtml", 1);
            urls.put("/files/List.xhtml", 2);
            urls.put("/coverletters/List.xhtml", 3);
            urls.put("/pages/List.xhtml", 4);
            urls.put("/seekers/Edit.xhtml", 5);
            urls.put("/seekers/Password.xhtml", 6);
            urls.put("/seekers/Photo.xhtml", 7);
        } else if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")) {
            userRecord = getUserRecord();
            if (userRecord.getAccountid().getMainaccount() == true) {
                urls.put("/jobs/List.xhtml", 0);
                urls.put("/jobs/MyList.xhtml", 1);
                urls.put("/accounts/List.xhtml", 2);
                urls.put("/users/List.xhtml", 3);
                urls.put("/company/Edit.xhtml", 4);
                urls.put("/users/MyDetails.xhtml", 5);
                urls.put("/company/Photo.xhtml", 6);
                urls.put("/users/Password.xhtml", 7);
            }
            if (userRecord.getAccountid().getMainaccount() == false) {
                urls.put("/users/MyDetails.xhtml", 0);
                urls.put("/users/Password.xhtml", 1);
                urls.put("/jobs/List.xhtml", 2);
                urls.put("/jobs/MyList.xhtml", 3);
            }
        }
        if (urls.containsKey(tmp)) {
            activeTabIndex = urls.get(FacesContext.getCurrentInstance().getExternalContext().getRequestPathInfo());
        }

    }

    public void changeSearchTab(TabChangeEvent event) {
        if (event.getTab().getId().compareTo("tab1") == 0) {
            setActiveSearchIndex(0);
        }
        if (event.getTab().getId().compareTo("tab2") == 0) {
            setActiveSearchIndex(1);
        }
    }

    public void changeRegistrationTab(TabChangeEvent event) {
        if (event.getTab().getId().compareTo("tab1") == 0) {
            setActiveRegistrationIndex(0);
        }
        if (event.getTab().getId().compareTo("tab2") == 0) {
            setActiveRegistrationIndex(1);
        }
    }

    public void changePaymentTab(TabChangeEvent event) {
        if (event.getTab().getId().compareTo("tab1") == 0) {
            setActivePaymentIndex(0);
        }
        if (event.getTab().getId().compareTo("tab2") == 0) {
            setActivePaymentIndex(1);
        }
        FacesMessage msg = new FacesMessage("Tab Changed", "TITLE: " + event.getTab().getTitle());
        FacesContext.getCurrentInstance().addMessage(null, msg);
        msg = new FacesMessage("Tab Changed", "ID: " + event.getTab().getId());
        FacesContext.getCurrentInstance().addMessage(null, msg);
        msg = new FacesMessage("Tab Changed", "FAMILY: " + event.getTab().getFamily());
        FacesContext.getCurrentInstance().addMessage(null, msg);
        UsersController uc = new UsersController();
        msg = new FacesMessage("Tab Changed", "USER: " + uc.getUserRecord().getUsername());
        FacesContext.getCurrentInstance().addMessage(null, msg);

    }
}
