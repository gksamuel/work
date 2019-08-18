/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Tiprate;

/**
 *
 * @author gachanja
 */
@Stateless
public class TiprateFacade extends AbstractFacade<Tiprate> {
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TiprateFacade() {
        super(Tiprate.class);
    }
    
}
