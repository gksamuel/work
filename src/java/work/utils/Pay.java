/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
import work.objects.Inmessage;
import work.objects.Mpesa;

/**
 *
 * @author gachanja
 */
@WebServlet(name = "Pay", urlPatterns = {"/pay.html"})
public class Pay extends HttpServlet {

    private static final long serialVersionUID = 4188247098928946218L;

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
     * @throws javax.transaction.RollbackException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, RollbackException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Enumeration<String> parameterNames = request.getParameterNames();
            PrintWriter writer = null;
            writer = new PrintWriter("the-file-name.txt", "UTF-8");
            System.out.println(request.getQueryString());
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                writer.println(paramName);
                String[] paramValues = request.getParameterValues(paramName);
                for (String paramValue : paramValues) {
                    writer.println(paramValue);

                }
            }
            writer.close();
            String text = request.getParameter("m").replaceAll("\r", " ");
            String source = request.getParameter("s").trim();
            String result = "0";
            UserTransaction transaction;
            transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
            transaction.begin();
            if (source.length() > 13) {
                Logger.getLogger(Pay.class.getName()).log(Level.INFO, "IN MESSAGE SOURCE IS TOO LONG || {0} || {1}", new Object[]{source, text});
                return;
            }
            Inmessage inMessage = new Inmessage(source, text);
            em.persist(inMessage);
            // MPESA string
            if (source.compareTo("MPESA") == 0) {
                Pattern payPatt = Pattern.compile("(\\p{Alnum}{10}) Confirmed.on (.+) at (.+)Ksh(.+) received from (\\d{12}) (.+).New.+");
                Matcher message = payPatt.matcher(text);
                if (message.matches()) {
                    String code = message.group(1);
                    BigDecimal amount = BigDecimal.valueOf(Double.valueOf(message.group(4).replace(",", "")));
                    String name = message.group(6);
                    Long phone = Long.valueOf(message.group(5));
                    String strDate = message.group(2) + " " + message.group(3);
                    SimpleDateFormat dateParser = new SimpleDateFormat("dd/MM/yy h:mm a");
                    Date dateStr = dateParser.parse(strDate);
                    Mpesa mpesa = new Mpesa();
                    mpesa.setSource(phone);
                    mpesa.setInmessageid(inMessage);
                    mpesa.setAmount(amount);
                    mpesa.setPaytime(dateStr);
                    mpesa.setProcessed(false);
                    mpesa.setCode(code);
                    mpesa.setReceivetime(new Date());
                    mpesa.setName(name);
                    em.persist(mpesa);
                    result = "1";
                }
            }
            transaction.commit();
            out.print(result);
        } catch (HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | NotSupportedException | SystemException | ParseException | NamingException ex) {
            Logger.getLogger(Pay.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
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
        try {
            processRequest(request, response);
        } catch (RollbackException ex) {
            Logger.getLogger(Pay.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (RollbackException ex) {
            Logger.getLogger(Pay.class.getName()).log(Level.SEVERE, null, ex);
        }
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
