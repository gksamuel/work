/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import java.util.List;
import javax.ejb.Stateless;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Accounts;
import work.objects.Users;

/**
 *
 * @author gachanja
 */
@Stateless
public class AccountsFacade extends AbstractFacade<Accounts> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccountsFacade() {
        super(Accounts.class);
    }
    
    @Override
    public List<Accounts> findAll() {
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        return  (List<Accounts>) getEntityManager().createNamedQuery("Accounts.findAccounts").setParameter("companyid", user.getCompanyid()).getResultList();
    }


    @Override
    public List<Accounts> findRange(int[] range) {
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        return  (List<Accounts>) getEntityManager().createNamedQuery("Accounts.findAccounts").setParameter("companyid", user.getCompanyid()).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
    }
}
