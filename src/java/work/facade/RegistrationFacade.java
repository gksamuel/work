/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Registration;

/**
 *
 * @author gachanja
 */
@Stateless
public class RegistrationFacade extends AbstractFacade<Registration> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RegistrationFacade() {
        super(Registration.class);
    }
}
