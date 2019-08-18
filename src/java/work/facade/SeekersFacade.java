/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Seekers;

/**
 *
 * @author gachanja
 */
@Stateless
@RolesAllowed(value = "seekers")
public class SeekersFacade extends AbstractFacade<Seekers> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SeekersFacade() {
        super(Seekers.class);
    }
}
