/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import java.util.List;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Users;

/**
 *
 * @author gachanja
 */
@Stateless
@RolesAllowed(value = "companies")
public class UsersFacade extends AbstractFacade<Users> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }

    @Override
    public List<Users> findRange(int[] range) {
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).getSingleResult();
        List<Users> users = (List<Users>) getEntityManager().createNamedQuery("Users.findCompanyUsers").setParameter("companyid", user.getCompanyid()).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        user = null;
        return users;
    }
}
