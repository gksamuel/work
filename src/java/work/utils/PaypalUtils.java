/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import work.objects.Company;
import work.objects.Paypal;
import work.objects.Seekers;

/**
 *
 * @author gachanja
 */
public class PaypalUtils {

    private Paypal paypal;
    private List<Paypal> payments;

    public void processTransaction(String tx, EntityManager em) {
        try {
            UserTransaction transaction;
            transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
            transaction.begin();
            payments = em.createNamedQuery("Paypal.findTx").setParameter("txnId", tx).setMaxResults(1).getResultList();
            if (payments.size() != 1) {
                String urlParameters = "cmd=_notify-synch&tx=" + tx + "&at=YbYJ5lo1gpLwWrq1Wl8eEzhAe4FbvbmF4Thh8YalUYGbGlGtDiKiCs6ojJu";
                URL url = new URL("https://www.paypal.com/cgi-bin/webscr");
                URLConnection conn = url.openConnection();
                conn.setDoOutput(true);
                OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
                writer.write(urlParameters);
                writer.flush();
                String line;
                BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                line = reader.readLine();
                Date timenow = new Date();
                if (line.compareTo("SUCCESS") != 0) {
                    Logger.getLogger(PaypalUtils.class.getName()).log(Level.SEVERE, "{0} || {1}", new Object[]{timenow, line});
                    while ((line = reader.readLine()) != null) {
                        Logger.getLogger(PaypalUtils.class.getName()).log(Level.SEVERE, "{0} || {1}", new Object[]{timenow, line});
                    }
                    return;
                }
                Logger.getLogger(PaypalUtils.class.getName()).log(Level.INFO, "{0} || {1}", new Object[]{timenow, line});

                paypal = new Paypal();
                while ((line = reader.readLine()) != null) {
                    Logger.getLogger(PaypalUtils.class.getName()).log(Level.INFO, "{0} || {1}", new Object[]{timenow, line});
                    if (line.lastIndexOf("=") > 0) {
                        paypal = setParameter(paypal, line);
                    }
                }
                paypal.setProcesstime(new Date());
                writer.close();
                reader.close();
                em.persist(paypal);
            }
            transaction.commit();
        } catch (RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException | IOException | NotSupportedException | SystemException | NamingException ex) {
            Logger.getLogger(PaypalUtils.class.getName()).log(Level.SEVERE, null, ex);
        }


    }

    public Paypal setParameter(Paypal paypal, String line) {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss MMM dd, yyyy z");
        try {
            String param = "";
            param = line.substring(0, line.indexOf("="));
            String value = URLDecoder.decode(line.substring(line.indexOf("=") + 1, line.length()), "UTF-8");

            if (param.compareTo("txn_id") == 0) {
                paypal.setTxnId(value);
            }


            if (param.compareTo("txn_id") == 0) {
                paypal.setTxnId(value);

            }

            if (param.compareTo("mc_gross") == 0) {
                paypal.setMcGross(BigDecimal.valueOf(Double.valueOf(value)));

            }

            if (param.compareTo("protection_eligibility") == 0) {
                paypal.setProtectionEligibility(value);

            }

            if (param.compareTo("payer_id") == 0) {
                paypal.setPayerId(value);

            }

            if (param.compareTo("first_name") == 0) {
                paypal.setFirstName(value);

            }

            if (param.compareTo("last_name") == 0) {
                paypal.setLastName(value);
            }

            if (param.compareTo("payer_email") == 0) {
                paypal.setPayerEmail(value);

            }

            if (param.compareTo("residence_country") == 0) {
                paypal.setResidenceCountry(value);

            }

            if (param.compareTo("payer_status") == 0) {
                paypal.setPayerStatus(value);

            }

            if (param.compareTo("tax") == 0) {
                paypal.setTax(BigDecimal.valueOf(Double.valueOf(value)));

            }

            if (param.compareTo("payment_date") == 0) {
                paypal.setPaymentDate(sdf.parse(value));

            }

            if (param.compareTo("option_selection1") == 0) {
                paypal.setOptionSelection1(value);

            }

            if (param.compareTo("payment_status") == 0) {
                paypal.setPaymentStatus(value);
            }

            if (param.compareTo("charset") == 0) {
                paypal.setCharset(value);

            }

            if (param.compareTo("mc_fee") == 0) {
                paypal.setMcFee(BigDecimal.valueOf(Double.valueOf(value)));

            }

            if (param.compareTo("custom") == 0) {
                paypal.setCustom(value);

                if (value.substring(0, value.indexOf(" ")).compareTo("seekers") == 0) {
                    Seekers seeker = new Seekers();
                    seeker.setId(Integer.valueOf(value.substring(value.lastIndexOf(" ") + 1, value.length())));
                    paypal.setSeekerid(seeker);
                }

                if (value.substring(0, value.indexOf(" ")).compareTo("companies") == 0) {
                    Company company = new Company();
                    company.setId(Integer.valueOf(value.substring(value.lastIndexOf(" ") + 1, value.length())));
                    paypal.setCompanyid(company);
                }
            }

            if (param.compareTo("receiver_email") == 0) {
                paypal.setReceiverEmail(value);

            }

            if (param.compareTo("business") == 0) {
                paypal.setBusiness(value);

            }

            if (param.compareTo("quantity") == 0) {
                paypal.setQuantity(Integer.valueOf(value));

            }

            if (param.compareTo("option_name1") == 0) {
                paypal.setOptionName1(value);

            }

            if (param.compareTo("payment_type") == 0) {
                paypal.setPaymentType(value);

            }

            if (param.compareTo("btn_id") == 0) {
                paypal.setBtnId(Integer.valueOf(value));

            }

            if (param.compareTo("payment_fee") == 0) {
                paypal.setPaymentFee(BigDecimal.valueOf(Double.valueOf(value)));

            }

            if (param.compareTo("shipping_discount") == 0) {
                paypal.setShippingDiscount(BigDecimal.valueOf(Double.valueOf(value)));

            }

            if (param.compareTo("insurance_amount") == 0) {
                paypal.setInsuranceAmount(BigDecimal.valueOf(Double.valueOf(value)));

            }

            if (param.compareTo("receiver_id") == 0) {
                paypal.setReceiverId(value);

            }

            if (param.compareTo("pending_reason") == 0) {
                paypal.setPendingReason(value);

            }

            if (param.compareTo("txn_type") == 0) {
                paypal.setTxnType(value);

            }

            if (param.compareTo("item_name") == 0) {
                paypal.setItemName(value);

            }

            if (param.compareTo("discount") == 0) {
                paypal.setDiscount(BigDecimal.valueOf(Double.valueOf(value)));

            }

            if (param.compareTo("mc_currency") == 0) {
                paypal.setMcCurrency(value);

            }

            if (param.compareTo("item_number") == 0) {
                paypal.setItemNumber(value);

            }

            if (param.compareTo("shipping_method") == 0) {
                paypal.setShippingMethod(value);

            }

            if (param.compareTo("handling_amount") == 0) {
                paypal.setHandlingAmount(BigDecimal.valueOf(Double.valueOf(value)));

            }

            if (param.compareTo("transaction_subject") == 0) {
                paypal.setTransactionSubject(value);

            }

            if (param.compareTo("payment_gross") == 0) {
                paypal.setPaymentGross(BigDecimal.valueOf(Double.valueOf(value)));

            }

            if (param.compareTo("shipping") == 0) {
                paypal.setShipping(BigDecimal.valueOf(Double.valueOf(value)));

            }






        } catch (UnsupportedEncodingException | ParseException ex) {
            Logger.getLogger(PaypalProcessor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return paypal;
    }
}
