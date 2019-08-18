/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import work.objects.Paypal;
import work.objects.Paypaltarrifs;

/**
 *
 * @author gachanja
 */
@WebServlet(name = "PaypalSuccess", urlPatterns = {"/PaypalSuccess"})
public class PaypalSuccess extends HttpServlet {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    private Date expiry;
    private Calendar cal;
    private String group;
    private Integer customerID;
    private Paypal paypal;
    private Integer amount;
    private Paypaltarrifs ppTarrif;
    private Integer days;
    private String tx;
    private List<Paypal> payments;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession(true);
            session.setAttribute("sourcefile", request.getRequestURI());
            tx = request.getParameter("tx");
            PaypalUtils paypalUtils = new PaypalUtils();
            paypalUtils.processTransaction(tx, em);
            session.setAttribute("status", "failed");
            Map params = request.getParameterMap();
            Iterator i = params.entrySet().iterator();
            String parameters = new Date() + " || PAYPAL SUCCESS PARAMETERS: ||";
            while (i.hasNext()) {
                Map.Entry<String, String[]> entry = (Map.Entry<String, String[]>) i.next();
                parameters = parameters + " " + entry.getKey() + " = " + entry.getValue()[0] + ",";
            }
            Logger.getLogger(PaypalSuccess.class.getName()).log(Level.INFO, "{0} || {1}", new Object[]{new Date(), parameters});
            UserTransaction transaction;
            transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
            transaction.begin();
            payments = em.createNamedQuery("Paypal.findTx").setParameter("txnId", tx).setMaxResults(1).getResultList();
            if (payments.size() == 1) {
                paypal = (Paypal) payments.get(0);
                if ((paypal.getFromtime() == null) && (paypal.getTotime() == null)) {
                    amount = paypal.getMcGross().intValue();
                    ppTarrif = (Paypaltarrifs) em.createNamedQuery("Paypaltarrifs.findTarrif").setParameter("membership", amount).setMaxResults(1).getSingleResult();
                    days = ppTarrif.getDays();
                    group = paypal.getCustom().substring(0, paypal.getCustom().lastIndexOf(" "));
                    customerID = Integer.valueOf(paypal.getCustom().substring(paypal.getCustom().lastIndexOf(" ") + 1, paypal.getCustom().length()));
                    if (group.compareTo("seekers") == 0) {
                        if (customerID.compareTo(paypal.getSeekerid().getId()) == 0) {
                            cal = Calendar.getInstance();
                            expiry = paypal.getSeekerid().getExpiry();
                            paypal.setFromtime(expiry);
                            if (expiry.compareTo(new Date()) < 0) {
                                cal.add(Calendar.DAY_OF_YEAR, days);
                                paypal.getSeekerid().setExpiry(cal.getTime());
                                paypal.setTotime(cal.getTime());
                                em.persist(paypal.getSeekerid());
                                em.persist(paypal);
                            }
                            if (expiry.compareTo(new Date()) >= 0) {
                                cal.setTime(paypal.getSeekerid().getExpiry());
                                cal.add(Calendar.DAY_OF_YEAR, days);
                                paypal.getSeekerid().setExpiry(cal.getTime());
                                paypal.setTotime(cal.getTime());
                                em.persist(paypal.getSeekerid());
                                em.persist(paypal);
                                Email emailSender = new Email();
                                emailSender.sendSeekerPaypalReceipt(paypal);
                            }
                        }
                    }
                    if (group.compareTo("companies") == 0) {
                        if (customerID.compareTo(paypal.getCompanyid().getId()) == 0) {
                            cal = Calendar.getInstance();
                            expiry = paypal.getCompanyid().getExpiry();
                            paypal.setFromtime(expiry);
                            if (expiry.compareTo(new Date()) < 0) {
                                cal.add(Calendar.DAY_OF_YEAR, days);
                                paypal.getCompanyid().setExpiry(cal.getTime());
                                paypal.setTotime(cal.getTime());
                                em.persist(paypal.getCompanyid());
                                em.persist(paypal);

                            }
                            if (expiry.compareTo(new Date()) >= 0) {
                                cal.setTime(paypal.getCompanyid().getExpiry());
                                cal.add(Calendar.DAY_OF_YEAR, days);
                                paypal.getCompanyid().setExpiry(cal.getTime());
                                paypal.setTotime(cal.getTime());
                                em.persist(paypal.getCompanyid());
                                em.persist(paypal);
                                Email emailSender = new Email();
                                emailSender.sendCompanyPaypalReceipt(paypal);
                            }
                        }
                    }
                    session.setAttribute("status", "success");
                }
            }
            transaction.commit();
            response.sendRedirect("/faces/public/paypal.xhtml");
        } catch (NotSupportedException | SystemException | NamingException | RollbackException | HeuristicMixedException | HeuristicRollbackException ex) {
            Logger.getLogger(PaypalSuccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
