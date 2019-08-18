/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import java.util.List;
import javax.annotation.security.DenyAll;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Company;

/**
 *
 * @author gachanja
 */
@Stateless
@DenyAll
public class CompanyFacade extends AbstractFacade<Company> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CompanyFacade() {
        super(Company.class);
    }

    @Override
    public List<Company> findRange(int[] range) {
        List<Company> companies = getEntityManager().createNamedQuery("Company.findAll").setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        return companies;
    }
}
