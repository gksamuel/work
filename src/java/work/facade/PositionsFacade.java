/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Positions;

/**
 *
 * @author gachanja
 */
@Stateless
public class PositionsFacade extends AbstractFacade<Positions> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PositionsFacade() {
        super(Positions.class);
    }
}
