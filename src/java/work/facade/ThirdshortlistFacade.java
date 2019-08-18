/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Thirdshortlist;

/**
 *
 * @author gachanja
 */
@Stateless
@RolesAllowed(value = "companies")
public class ThirdshortlistFacade extends AbstractFacade<Thirdshortlist> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ThirdshortlistFacade() {
        super(Thirdshortlist.class);
    }
}
