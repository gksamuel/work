/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import java.util.List;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Applications;
import work.objects.Jobs;
import work.objects.Seekers;

/**
 *
 * @author gachanja
 */
@Stateless
public class ApplicationsFacade extends AbstractFacade<Applications> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    private Boolean viewed;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ApplicationsFacade() {
        super(Applications.class);
    }

    public Boolean getViewed() {
        return viewed;
    }

    public void setViewed(Boolean viewed) {
        this.viewed = viewed;
    }

    @RolesAllowed(value = "companies")
    public List<Applications> findApplicantRange(int[] range, Jobs jobid) {
        List<Applications> applications = null;
        if (getViewed() == null) {
            applications = (List<Applications>) getEntityManager().createNamedQuery("Applications.findJobApplications").setParameter("jobid", jobid).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        }
        if (getViewed() != null) {
            applications = (List<Applications>) getEntityManager().createNamedQuery("Applications.findFilteredApplications").setParameter("viewed", getViewed()).setParameter("jobid", jobid).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        }
        return applications;
    }

    public int count(Jobs jobid) {
        if (getViewed() == null) {
            return ((Number) getEntityManager().createNamedQuery("Applications.findSeekerCount").setParameter("jobid", jobid).getSingleResult()).intValue();
        }
        if (getViewed() != null) {
            return ((Number) getEntityManager().createNamedQuery("Applications.findFilteredCount").setParameter("viewed", getViewed()).setParameter("jobid", jobid).getSingleResult()).intValue();
        }
        return 0;
    }

    @Override
    public List<Applications> findRange(int[] range) {
        Seekers seeker = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        List<Applications> applications = (List<Applications>) getEntityManager().createNamedQuery("Applications.findSeekerApplications").setParameter("seekerid", seeker).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        return applications;
    }
}
