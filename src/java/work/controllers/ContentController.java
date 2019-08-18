/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.controllers;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.SessionScoped;
import javax.inject.Named;
import work.facade.ContentFacade;
import work.objects.Company;
import work.objects.Content;
import work.objects.Jobs;

/**
 *
 * @author gachanja
 */
@SessionScoped
@Named("contentController")
public class ContentController extends ContentFacade implements Serializable {

    private static final long serialVersionUID = 4774679486229250933L;

    public ContentController() {
    }

    public String getContent(Integer id) {
        Content content = (Content) getEntityManager().createNamedQuery("Content.findOne").setParameter("id", id).getSingleResult();
        return content.getContent();
    }

    public StringBuilder getLatest() {
        SimpleDateFormat sdf = new  SimpleDateFormat("dd MMM Y");
        List<Jobs> jobs = (List<Jobs>) getEntityManager().createNamedQuery("Jobs.findAll").setMaxResults(15).getResultList();
        StringBuilder sb = new StringBuilder();
        if (jobs.size() > 0) {
            Iterator i = jobs.iterator();
            String txt = "<img align='left' src='" + ResourceBundle.getBundle("/Bundle").getString("externalUrl") + "/img/new.png'>";
            sb.append(txt);
            txt = "<strong>Log in now to apply for the following hot jobs.</strong>";
            sb.append(txt);
            sb.append(ResourceBundle.getBundle("/Bundle").getString("VacancyHead"));
            while (i.hasNext()) {
                Jobs job = (Jobs) i.next();
                sb.append("<tr><td>");
                sb.append(job.getCompanyid().getName());
                sb.append("</td><td>");
                sb.append(job.getTitle());
                sb.append("</td><td>");
                sb.append(sdf.format(job.getEnddate()));
                sb.append("</td></tr>");
            }
            sb.append("</table>");
        }
        return sb;
    }
}
