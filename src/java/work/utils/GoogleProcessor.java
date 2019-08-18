/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.net.ssl.HttpsURLConnection;
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
import work.objects.Groups;
import work.objects.Salary;
import work.objects.Seekers;

/**
 *
 * @author gachanja
 */
@WebServlet(name = "GoogleProcessor", urlPatterns = {"/GoogleProcessor"})
public class GoogleProcessor extends HttpServlet {

    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    private Seekers seeker;
    private Encode encode = new Encode();
    private static String salt = "3d274hSDF#";

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
        Logger.getLogger(GoogleProcessor.class.getName()).log(Level.SEVERE, "I am here muther fooker!!");
        Logger.getLogger(GoogleProcessor.class.getName()).log(Level.SEVERE, request.getHeader("referer"));
        Enumeration e = request.getParameterNames();
        Logger.getLogger(GoogleProcessor.class.getName()).log(Level.SEVERE, request.getParameter("token"));
        try {
            String url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=";
            String token = request.getParameter("token");
            url = url + token;
            URL u = new URL(url);
            HttpsURLConnection httpclient = (HttpsURLConnection) u.openConnection();
            httpclient.setRequestMethod("GET");
            httpclient.setDoOutput(true);
            httpclient.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            System.out.println(httpclient.getResponseCode());
            System.out.println(httpclient.getResponseMessage());
            if (httpclient.getResponseCode() == 200) {
                request.logout();
                UserTransaction transaction;
                transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
                transaction.begin();
                BufferedReader in = new BufferedReader(new InputStreamReader(httpclient.getInputStream()));
                String inputLine;
                StringBuffer googleresponse = new StringBuffer();
                while ((inputLine = in.readLine()) != null) {
                    googleresponse.append(inputLine);
                }
                in.close();
                System.out.println(googleresponse);
                System.out.println("\n#############################################################################\n");

                String json = googleresponse.toString();
                ObjectMapper mapper = new ObjectMapper();
                Map<String, String> map = (HashMap<String, String>) mapper.readValue(json, new TypeReference<Map<String, String>>() {
                });

                System.out.println("GOOGLE ID IS " + map.get("sub"));
                System.out.println("GOOGLE Email IS " + map.get("email"));
                System.out.println("GOOGLE Email2 IS " + map.get("email"));
                System.out.println("GOOGLE name IS " + map.get("name"));
                System.out.println("GOOGLE given_name IS " + map.get("given_name"));
                System.out.println("GOOGLE family_name IS " + map.get("family_name"));
                System.out.println("GOOGLE aud IS " + map.get("aud"));
                String googleEmail = map.get("email");
                Logger.getLogger(GoogleProcessor.class.getName()).log(Level.SEVERE, googleEmail);
                List<Seekers> currentSeekers = (List<Seekers>) em.createNamedQuery("Seekers.findEmail").setParameter("email", map.get("email")).setMaxResults(1).getResultList();
                Logger.getLogger(GoogleProcessor.class.getName()).log(Level.INFO, String.valueOf(currentSeekers.size()));
                if (currentSeekers.size() == 1) {
                    seeker = currentSeekers.get(0);

                    String password = map.get("sub") + salt + seeker.getEmail();
                    password = encode.endodesha1(password);
                    Logger.getLogger(GoogleProcessor.class.getName()).log(Level.SEVERE, encode.endodesha1("seeker"));
                    if ((seeker.getUsername().compareTo(map.get("email")) == 0) && (seeker.getPassword().compareTo(password) == 0)) {
                    } else {
                        seeker.setUsername(seeker.getEmail());
                        seeker.setPassword(password);
                        em.persist(seeker);
                        transaction.commit();
                    }
                    request.login(seeker.getUsername(), map.get("sub") + salt + map.get("email"));
                } else {
                    seeker = new Seekers();
                    seeker.setUsername(map.get("email"));
                    seeker.setEmail(map.get("email"));
                    seeker.setFirstname(map.get("given_name"));
                    seeker.setLastname(map.get("family_name"));
                    seeker.setPassword(encode.endodesha1(map.get("sub") + salt + map.get("email")));
                    seeker.setDatemodified(new Date());
                    seeker.setDatecreated(new Date());
                    Calendar day = Calendar.getInstance();
                    day.add(Calendar.MONTH, 1);
                    seeker.setExpiry(day.getTime());
                    Salary salary = (Salary) em.createNamedQuery("Salary.findByID").setParameter("id", 1).setMaxResults(1).getSingleResult();
                    salary.setId(1);
                    seeker.setSalaryid(salary);
                    work.objects.Status status = (work.objects.Status) em.createNamedQuery("Status.findByID").setParameter("id", 1).setMaxResults(1).getSingleResult();
                    seeker.setStatusid(status);
                    Groups group = (Groups) em.createNamedQuery("Groups.findByID").setParameter("id", 1).setMaxResults(1).getSingleResult();
                    seeker.setGroupid(group);
                    em.persist(seeker);
                    transaction.commit();
                    request.login(map.get("email"), map.get("sub") + salt + map.get("email"));

                    Logger.getLogger(GoogleProcessor.class.getName()).log(Level.INFO, "new user");

                }
            }
        } catch (MalformedURLException ex) {
            Logger.getLogger(GoogleProcessor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(GoogleProcessor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException | NotSupportedException | SystemException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
            Logger.getLogger(GoogleProcessor.class.getName()).log(Level.SEVERE, null, ex);
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
