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
import work.objects.Contact;
import work.objects.Seekers;
import work.objects.Users;

/**
 *
 * @author gachanja
 */
@Stateless
public class ContactFacade extends AbstractFacade<Contact> {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContactFacade() {
        super(Contact.class);
    }

    @Override
    public int count() {
        int count = 0;
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
            Seekers seeker = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            count = ((Number) getEntityManager().createNamedQuery("Contact.findSeekerCount").setParameter("seeker", seeker).getSingleResult()).intValue();
        }
        if(FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")){
            Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            count = ((Number) getEntityManager().createNamedQuery("Contact.findCompanyCount").setParameter("company", user.getCompanyid()).getSingleResult()).intValue();
        }
        return count;
    }

    @Override
    public List<Contact> findRange(int[] range) {
        List<Contact> contactUs = null;
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("seekers")) {
            Seekers seeker = (Seekers) getEntityManager().createNamedQuery("Seekers.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            contactUs = (List<Contact>) getEntityManager().createNamedQuery("Contact.findSeekerContacts").setParameter("seeker", seeker).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        }
        if (FacesContext.getCurrentInstance().getExternalContext().isUserInRole("companies")) {
            Users user = (Users) getEntityManager().createNamedQuery("Users.findUsername").setParameter("username", FacesContext.getCurrentInstance().getExternalContext().getRemoteUser()).setMaxResults(1).getSingleResult();
            contactUs = (List<Contact>) getEntityManager().createNamedQuery("Contact.findCompanyContacts").setParameter("company", user.getCompanyid()).setMaxResults(range[1] - range[0]).setFirstResult(range[0]).getResultList();
        }
        return contactUs;
    }
}
