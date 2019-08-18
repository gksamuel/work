/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Formanswers;

/**
 *
 * @author gachanja
 */
@Stateless
public class FormanswersFacade extends AbstractFacade<Formanswers> {
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    public FormanswersFacade() {
        super(Formanswers.class);
    }
    
}
