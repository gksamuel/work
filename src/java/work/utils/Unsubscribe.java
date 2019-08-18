/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import work.objects.Seekers;
import work.objects.Status;

/**
 *
 * @author gachanja
 */
@WebServlet(name = "Unsubscribe", urlPatterns = {"/unsubscribe"})
public class Unsubscribe extends HttpServlet {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String result = "Error occured when unsubscribing you. Please try again later.";
        try {
            /* TODO output your page here. You may use following sample code. */
            String id = request.getParameter("id");
            String idString = id.substring(0, 7);
            Integer seekerID = Integer.valueOf(idString);
            UserTransaction transaction;
            transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
            transaction.begin();
            List<Seekers> seekerList = (List<Seekers>) em.createNamedQuery("Seekers.findId").setParameter("id", seekerID).getResultList();
            if (seekerList.size() == 1) {
                Seekers seeker = seekerList.get(0);
                Status status = (Status) em.createNamedQuery("Status.findByID").setParameter("id", 2).getSingleResult();
                seeker.setStatusid(status);
                em.persist(seeker);
                result = "You have been removed from our mailing list";
            }
            transaction.commit();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Unsubscribe</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>" + result + "</p>");
            out.println("</body>");
            out.println("</html>");
        } catch (NotSupportedException | SystemException | NamingException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | NullPointerException | IllegalStateException ex) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Unsubscribe</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>" + result + "</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
