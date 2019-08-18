/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import java.util.List;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Firstshortlist;
import work.objects.Jobs;

/**
 *
 * @author gachanja
 */
@Stateless
@RolesAllowed(value = "companies")
public class FirstshortlistFacade extends AbstractFacade<Firstshortlist> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FirstshortlistFacade() {
        super(Firstshortlist.class);
    }

    public int jobCount(Jobs jobid) {
         return ((Number) getEntityManager().createNamedQuery("Firstshortlist.findShortlistCount").setParameter("jobid", jobid).getSingleResult()).intValue();
    }

    public List<Firstshortlist> findShortListRange(int[] range, Jobs jobid) {
        List<Firstshortlist> firstShortlist = (List<Firstshortlist>) getEntityManager().createNamedQuery("Firstshortlist.findShortList").setParameter("jobid", jobid).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        return firstShortlist;
    }
}
