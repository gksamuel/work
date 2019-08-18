package work.objects;

import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Company;
import work.objects.Inmessage;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Mpesa.class)
public class Mpesa_ { 

    public static volatile SingularAttribute<Mpesa, Date> receivetime;
    public static volatile SingularAttribute<Mpesa, Seekers> seekerid;
    public static volatile SingularAttribute<Mpesa, Date> processtime;
    public static volatile SingularAttribute<Mpesa, String> code;
    public static volatile SingularAttribute<Mpesa, Date> paytime;
    public static volatile SingularAttribute<Mpesa, Integer> id;
    public static volatile SingularAttribute<Mpesa, BigDecimal> amount;
    public static volatile SingularAttribute<Mpesa, Company> companyid;
    public static volatile SingularAttribute<Mpesa, Boolean> processed;
    public static volatile SingularAttribute<Mpesa, Long> source;
    public static volatile SingularAttribute<Mpesa, Date> totime;
    public static volatile SingularAttribute<Mpesa, String> name;
    public static volatile SingularAttribute<Mpesa, Date> fromtime;
    public static volatile SingularAttribute<Mpesa, Inmessage> inmessageid;

}