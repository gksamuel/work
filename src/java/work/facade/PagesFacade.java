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
import work.objects.Pages;
import work.objects.Seekers;

/**
 *
 * @author gachanja
 */
@Stateless
@RolesAllowed(value = "seekers")
public class PagesFacade extends AbstractFacade<Pages> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PagesFacade() {
        super(Pages.class);
    }

    @Override
    public List<Pages> findRange(int[] range) {
        Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        javax.persistence.Query q = getEntityManager().createNamedQuery("Pages.findBySeekerId");
        q.setParameter("seekerid", seeker);
        q.setMaxResults(range[1] - range[0]);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }

    @Override
    public int count() {
        Seekers seeker = (Seekers) em.createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        javax.persistence.Query q = getEntityManager().createNamedQuery("Pages.findBySeekerId");
        q.setParameter("seekerid", seeker);
        return q.getResultList().size();

    }
}
