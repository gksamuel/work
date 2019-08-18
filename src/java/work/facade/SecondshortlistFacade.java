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
import work.objects.Jobs;
import work.objects.Secondshortlist;

/**
 *
 * @author gachanja
 */
@Stateless
@RolesAllowed(value = "companies")
public class SecondshortlistFacade extends AbstractFacade<Secondshortlist> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SecondshortlistFacade() {
        super(Secondshortlist.class);
    }

    public List<Secondshortlist> findShortListRange(int[] range, Jobs jobid) {
        List<Secondshortlist> firstShortlist = (List<Secondshortlist>) getEntityManager().createNamedQuery("Secondshortlist.findShortList").setParameter("jobid", jobid).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        return firstShortlist;
    }
}
