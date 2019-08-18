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
import work.objects.Education;
import work.objects.Mpesa;
import work.objects.Seekers;
import work.objects.Users;

/**
 *
 * @author gachanja
 */
@Stateless
public class MpesaFacade extends AbstractFacade<Mpesa> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MpesaFacade() {
        super(Mpesa.class);
    }

    @Override
    public List<Mpesa> findRange(int[] range) {
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
            Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            javax.persistence.Query q = getEntityManager().createNamedQuery("Mpesa.findSeekerPayments");
            q.setParameter("seekerid", seeker);
            q.setMaxResults(range[1] - range[0]);
            q.setFirstResult(range[0]);
            return q.getResultList();
        }
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")) {
            Users user = (Users) em.createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            javax.persistence.Query q = getEntityManager().createNamedQuery("Mpesa.findCompanyPayments");
            q.setParameter("companyid", user.getCompanyid());
            q.setMaxResults(range[1] - range[0]);
            q.setFirstResult(range[0]);
            return q.getResultList();
        }
        return null;
    }

    @Override
    public int count() {
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
            Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            javax.persistence.Query q = getEntityManager().createNamedQuery("Mpesa.findSeekerPayments");
            q.setParameter("seekerid", seeker);
            return q.getResultList().size();
        }
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")) {
            Users user = (Users) em.createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            javax.persistence.Query q = getEntityManager().createNamedQuery("Mpesa.findCompanyPayments");
            q.setParameter("companyid", user.getCompanyid());
            return q.getResultList().size();
        }
        return 0;
    }
}
