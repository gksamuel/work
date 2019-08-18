/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package work.facade;

import java.util.List;
import javax.ejb.Stateless;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Forms;
import work.objects.Users;

/**
 *
 * @author gachanja
 */
@Stateless
public class FormsFacade extends AbstractFacade<Forms> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    public EntityManager getEntityManager() {
        return em;
    }

    @Override
    public List<Forms> findRange(int[] range) {
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        return (List<Forms>) getEntityManager().createNamedQuery("Forms.findForms").setParameter("companyid", user.getCompanyid()).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
    }

    @Override
    public List<Forms> findAll() {
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        return (List<Forms>) getEntityManager().createNamedQuery("Forms.findForms").setParameter("companyid", user.getCompanyid()).getResultList();
    }

    public FormsFacade() {
        super(Forms.class);
    }

    @Override
    public int count() {
        Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
        List<Forms> allForms = (List<Forms>) getEntityManager().createNamedQuery("Forms.findForms").setParameter("companyid", user.getCompanyid()).getResultList();
        return allForms.size();
    }
}
