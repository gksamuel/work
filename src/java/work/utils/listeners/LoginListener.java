/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils.listeners;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gachanja
 */
public class LoginListener implements PhaseListener {

    String group = null;
    int id = 0;
    String mobile = null;
    FacesContext fc;
    Query query;
    Boolean active = true;

    @Override
    public PhaseId getPhaseId() {
        return PhaseId.RESTORE_VIEW;
    }

    @Override
    public void beforePhase(PhaseEvent event) {

    }

    @Override
    public void afterPhase(PhaseEvent event) {
        HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
        if (session.getAttribute("appVersion") == null) {
            try {
//                String patternString = ".+" + ResourceBundle.getBundle("/Bundle").getString("MobilePhones").replace(" ", ".+|.+") + ".+";
                String patternString = ResourceBundle.getBundle("/Bundle").getString("MobilePhones");
                if (FacesContext.getCurrentInstance().getExternalContext().getRequestHeaderMap().containsKey("User-Agent")) {
                    String user_agent = FacesContext.getCurrentInstance().getExternalContext().getRequestHeaderMap().get("User-Agent");
                    Pattern pattern = Pattern.compile(patternString, Pattern.CASE_INSENSITIVE);
                    Matcher matcher = pattern.matcher(user_agent);
                    Logger.getLogger(LoginListener.class.getName()).log(Level.OFF, "USER_AGENT {0}", new Object[]{user_agent});
                    if (matcher.matches()) {
                        FacesContext.getCurrentInstance().getExternalContext().redirect("/m");
                    }
                }
            } catch (IOException ex) {
                Logger.getLogger(LoginListener.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        fc = event.getFacesContext();
        if (fc.getExternalContext().getRemoteUser() != null) {
            if (session.getAttribute("prevViewID") != null) {
                String prevViewID = (String) session.getAttribute("prevViewID");
                if (prevViewID.compareTo("/login.xhtml") == 0 || prevViewID.compareTo("/public/loginError.xhtml") == 0) {
                    NavigationHandler nh = fc.getApplication().getNavigationHandler();
                    Date expiryDate = null;
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    try {
                        EntityManagerFactory emf = Persistence.createEntityManagerFactory("workRealmPU");
                        EntityManager em = emf.createEntityManager();
                        em.getTransaction().begin();
                        query = em.createNativeQuery("SELECT * FROM Seekers  where username =  ?");
                        query.setParameter(1, fc.getExternalContext().getRemoteUser());
                        query.setMaxResults(1);
                        List seekers = query.getResultList();
                        if (seekers.size() == 1) {
                            Object[] seeker = (Object[]) seekers.get(0);
                            expiryDate = sdf.parse(seeker[5].toString());
                            group = "seekers";
                            mobile = (String) seeker[7];
                            id = (int) seeker[0];

                        } else {
                            query = em.createNativeQuery(" select  c.id, c.expiry  , c.mobile , u.active from users u join  company c on u.companyid = c.id where u.username = ?");
                            query.setParameter(1, fc.getExternalContext().getRemoteUser());
                            query.setMaxResults(1);
                            List users = query.getResultList();
                            if (users.size() == 1) {
                                Object[] company = (Object[]) users.get(0);
                                id = (int) company[0];
                                expiryDate = sdf.parse(company[1].toString());
                                mobile = (String) company[2];
                                group = "companies";
                                active = (Boolean) company[3];
                            }
                        }

                        try {
                            HttpServletRequest request = (HttpServletRequest) fc.getExternalContext().getRequest();
                            if (expiryDate.before(new Date())) {
                                request.logout();
                                session.setAttribute("group", group);
                                session.setAttribute("id", id);
                                session.setAttribute("mobile", mobile);
                                nh.handleNavigation(fc, null, "Expired");
                            } else if (active == false) {
                                request.logout();
                                nh.handleNavigation(fc, null, "Inactive");
                            }
                        } catch (ServletException ex) {
                            Logger.getLogger(LoginListener.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        em.getTransaction().commit();
                    } catch (ParseException ex) {
                        Logger.getLogger(LoginListener.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    session.removeAttribute("prevViewID");
                }
            }
        }
        if (fc.getViewRoot().getViewId().compareTo("/login.xhtml") == 0 || fc.getViewRoot().getViewId().compareTo("/public/loginError.xhtml") == 0) {
            session.setAttribute("prevViewID", fc.getViewRoot().getViewId());
        }
    }
}
