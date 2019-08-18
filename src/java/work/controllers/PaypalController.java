/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.controllers;

import java.io.Serializable;
import java.util.ResourceBundle;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import work.controllers.util.JsfUtil;
import work.facade.PaypalFacade;
import work.objects.Seekers;
import work.objects.Users;

/**
 *
 * @author gachanja
 */
@ManagedBean(name = "paypalController")
@SessionScoped
public class PaypalController extends PaypalFacade implements Serializable {
    private static final long serialVersionUID = -7147573883356449477L;

    private work.facade.PaypalFacade ejbFacade;
    private String customString;
    private String expiredUser;

    public PaypalController() {
    }

    private PaypalFacade getFacade() {
        return ejbFacade;
    }

    public String getCustomString() {
        if (customString == null) {

            if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
                Seekers seeker = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
                customString = "seekers " + seeker.getId();
            }
            if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")) {
                Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
                customString = "companies " + user.getCompanyid().getId();
            }
        }
        return customString;
    }

    public void setCustomString(String customString) {
        this.customString = customString;
    }

    public String getExpiredUser() {
        if (FacesContext.getCurrentInstance().getExternalContext().getSessionMap().containsKey("group") && FacesContext.getCurrentInstance().getExternalContext().getSessionMap().containsKey("id")) {
            expiredUser = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("group") + " " + FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("id");
        }
        return expiredUser;
    }

    public void setExpiredUser(String expiredUser) {
        this.expiredUser = expiredUser;
    }

    public void checkPayment() {
        String status = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("status");
        if (status.compareTo("success") == 0) {
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("paypalPaid"));
        }
        if (status.compareTo("failed") == 0) {
            JsfUtil.addErrorMessage(ResourceBundle.getBundle("/Bundle").getString("paypalFailed"));
        }


    }
}
