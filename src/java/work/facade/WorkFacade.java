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
import work.objects.Seekers;
import work.objects.Work;

/**
 *
 * @author gachanja
 */
@Stateless
public class WorkFacade extends AbstractFacade<Work> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WorkFacade() {
        super(Work.class);
    }

    @Override
    @RolesAllowed(value = "seekers")
    public List<Work> findRange(int[] range) {
        Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        javax.persistence.Query q = getEntityManager().createNamedQuery("Work.findBySeekerId");
        q.setParameter("seekerid", seeker);
        q.setMaxResults(range[1] - range[0]);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }

    @Override
    @RolesAllowed(value = "seekers")
    public int count() {
        Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        javax.persistence.Query q = getEntityManager().createNamedQuery("Work.findBySeekerId");
        q.setParameter("seekerid", seeker);
        return q.getResultList().size();

    }
}
