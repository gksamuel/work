package work.objects;

import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Company;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Paypal.class)
public class Paypal_ { 

    public static volatile SingularAttribute<Paypal, BigDecimal> paymentFee;
    public static volatile SingularAttribute<Paypal, String> optionName1;
    public static volatile SingularAttribute<Paypal, BigDecimal> mcGross;
    public static volatile SingularAttribute<Paypal, Date> processtime;
    public static volatile SingularAttribute<Paypal, String> protectionEligibility;
    public static volatile SingularAttribute<Paypal, BigDecimal> handlingAmount;
    public static volatile SingularAttribute<Paypal, String> optionSelection1;
    public static volatile SingularAttribute<Paypal, String> payerStatus;
    public static volatile SingularAttribute<Paypal, BigDecimal> paymentGross;
    public static volatile SingularAttribute<Paypal, String> business;
    public static volatile SingularAttribute<Paypal, String> txnId;
    public static volatile SingularAttribute<Paypal, String> payerEmail;
    public static volatile SingularAttribute<Paypal, Integer> id;
    public static volatile SingularAttribute<Paypal, Company> companyid;
    public static volatile SingularAttribute<Paypal, BigDecimal> shipping;
    public static volatile SingularAttribute<Paypal, String> receiverId;
    public static volatile SingularAttribute<Paypal, Date> fromtime;
    public static volatile SingularAttribute<Paypal, String> mcCurrency;
    public static volatile SingularAttribute<Paypal, Integer> quantity;
    public static volatile SingularAttribute<Paypal, String> itemNumber;
    public static volatile SingularAttribute<Paypal, String> firstName;
    public static volatile SingularAttribute<Paypal, Integer> btnId;
    public static volatile SingularAttribute<Paypal, String> custom;
    public static volatile SingularAttribute<Paypal, String> txnType;
    public static volatile SingularAttribute<Paypal, Date> paymentDate;
    public static volatile SingularAttribute<Paypal, String> lastName;
    public static volatile SingularAttribute<Paypal, String> itemName;
    public static volatile SingularAttribute<Paypal, Seekers> seekerid;
    public static volatile SingularAttribute<Paypal, String> paymentType;
    public static volatile SingularAttribute<Paypal, String> receiverEmail;
    public static volatile SingularAttribute<Paypal, String> charset;
    public static volatile SingularAttribute<Paypal, String> paymentStatus;
    public static volatile SingularAttribute<Paypal, String> shippingMethod;
    public static volatile SingularAttribute<Paypal, String> residenceCountry;
    public static volatile SingularAttribute<Paypal, BigDecimal> discount;
    public static volatile SingularAttribute<Paypal, BigDecimal> mcFee;
    public static volatile SingularAttribute<Paypal, BigDecimal> tax;
    public static volatile SingularAttribute<Paypal, String> transactionSubject;
    public static volatile SingularAttribute<Paypal, Date> totime;
    public static volatile SingularAttribute<Paypal, BigDecimal> insuranceAmount;
    public static volatile SingularAttribute<Paypal, String> pendingReason;
    public static volatile SingularAttribute<Paypal, String> payerId;
    public static volatile SingularAttribute<Paypal, BigDecimal> shippingDiscount;

}