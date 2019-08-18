package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Company;
import work.objects.Seekers;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Contact.class)
public class Contact_ { 

    public static volatile SingularAttribute<Contact, Integer> id;
    public static volatile SingularAttribute<Contact, Date> commentdate;
    public static volatile SingularAttribute<Contact, String> response;
    public static volatile SingularAttribute<Contact, Company> companyid;
    public static volatile SingularAttribute<Contact, Seekers> seekerid;
    public static volatile SingularAttribute<Contact, Date> responsedate;
    public static volatile SingularAttribute<Contact, Users> userid;
    public static volatile SingularAttribute<Contact, String> comment;

}