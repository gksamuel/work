/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Salary;

/**
 *
 * @author gachanja
 */
@Stateless
public class SalaryFacade extends AbstractFacade<Salary> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SalaryFacade() {
        super(Salary.class);
    }
}
