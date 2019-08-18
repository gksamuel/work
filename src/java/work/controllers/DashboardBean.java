/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.controllers;

import java.io.Serializable;
import javax.faces.bean.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import org.primefaces.event.DashboardReorderEvent;
import org.primefaces.model.DashboardColumn;
import org.primefaces.model.DashboardModel;
import org.primefaces.model.DefaultDashboardColumn;
import org.primefaces.model.DefaultDashboardModel;

/**
 *
 * @author gachanja
 */
@ManagedBean(name = "dashboardBean")
@SessionScoped
public class DashboardBean implements Serializable {
    private static final long serialVersionUID = 8723445904276733215L;

    private DashboardModel model;

    public DashboardBean() {
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
            model = new DefaultDashboardModel();
            DashboardColumn column1 = new DefaultDashboardColumn();
            DashboardColumn column2 = new DefaultDashboardColumn();
            DashboardColumn column3 = new DefaultDashboardColumn();
            DashboardColumn column4 = new DefaultDashboardColumn();
            column1.addWidget("myEmployment");
            column1.addWidget("myPages");
            column2.addWidget("myEducation");
            column2.addWidget("myDetails");
            column3.addWidget("myFiles");
            column3.addWidget("myPassword");
            column4.addWidget("myLetters");
            column4.addWidget("myPhoto");
            model.addColumn(column1);
            model.addColumn(column2);
            model.addColumn(column3);
            model.addColumn(column4);
        }
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")) {
            model = new DefaultDashboardModel();
            DashboardColumn column1 = new DefaultDashboardColumn();
            DashboardColumn column2 = new DefaultDashboardColumn();
            DashboardColumn column3 = new DefaultDashboardColumn();
            DashboardColumn column4 = new DefaultDashboardColumn();

            
            
            column1.addWidget("vacancies");
            column2.addWidget("myJobs");
            column3.addWidget("accounts");
            column4.addWidget("companyUsers");
            column1.addWidget("companyDetails");
            column2.addWidget("userDetails");
            column3.addWidget("companyLogo");
            column4.addWidget("userPassword");

            model.addColumn(column1);
            model.addColumn(column2);
            model.addColumn(column3);
            model.addColumn(column4);

        }
    }

    public void handleReorder(DashboardReorderEvent event) {
        FacesMessage message = new FacesMessage();
        message.setSeverity(FacesMessage.SEVERITY_INFO);
        message.setSummary("Reordered: " + event.getWidgetId());
        message.setDetail("Item index: " + event.getItemIndex() + ", Column index: " + event.getColumnIndex() + ", Sender index: " + event.getSenderColumnIndex());

        addMessage(message);
    }

    private void addMessage(FacesMessage message) {
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public DashboardModel getModel() {
        return model;
    }
}
