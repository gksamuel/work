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
import work.objects.Jobs;
import work.objects.Users;

/**
 *
 * @author gachanja
 */
@Stateless
public class JobsFacade extends AbstractFacade<Jobs> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public JobsFacade() {
        super(Jobs.class);
    }

    @Override
    public int count() {
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        int count = ((Number) em.createNamedQuery("Jobs.findCompanyJobsCount").setParameter("companyid", user.getCompanyid()).getSingleResult()).intValue();
        return count;
    }

    public int browseCount() {
        int count = ((Number) em.createNamedQuery("Jobs.findJobsCount").getSingleResult()).intValue();
        return count;
    }

    public int myCount() {
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        int count = ((Number) em.createNamedQuery("Jobs.findUserJobsCount").setParameter("userid", user).getSingleResult()).intValue();
        return count;
    }

    @Override
    @RolesAllowed(value = "companies")
    public List<Jobs> findRange(int[] range) {
        List<Jobs> jobs = null;
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        if (user.getAccountid().getMainaccount() == true) {
            jobs = (List<Jobs>) getEntityManager().createNamedQuery("Jobs.findCompanyJobs").setParameter("companyid", user.getCompanyid()).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        }
        if (user.getAccountid().getMainaccount() == false) {
            jobs = (List<Jobs>) getEntityManager().createNamedQuery("Jobs.findAccountJobs").setParameter("companyid", user.getCompanyid()).setParameter("accountid", user.getAccountid()).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        }
        return jobs;
    }

    @RolesAllowed(value = "seekers")
    public List<Jobs> findBrowseRange(int[] range) {
        List<Jobs> jobs = (List<Jobs>) getEntityManager().createNamedQuery("Jobs.findAll").setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        return jobs;
    }

    @RolesAllowed(value = "companies")
    public List<Jobs> findMyRange(int[] range) {
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        List<Jobs> jobs = (List<Jobs>) getEntityManager().createNamedQuery("Jobs.findUserJobs").setParameter("userid", user).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        return jobs;
    }
}
