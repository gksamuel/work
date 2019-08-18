/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Filecategory;

/**
 *
 * @author gachanja
 */
@Stateless
public class FilecategoryFacade extends AbstractFacade<Filecategory> {
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FilecategoryFacade() {
        super(Filecategory.class);
    }
    
}
