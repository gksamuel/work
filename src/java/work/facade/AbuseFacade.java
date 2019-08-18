/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Abuse;

/**
 *
 * @author gachanja
 */
@Stateless
public class AbuseFacade extends AbstractFacade<Abuse> {
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AbuseFacade() {
        super(Abuse.class);
    }
    
}
