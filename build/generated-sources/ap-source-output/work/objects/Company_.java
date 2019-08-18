package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Accounts;
import work.objects.Contact;
import work.objects.Forms;
import work.objects.Jobs;
import work.objects.Mpesa;
import work.objects.Paypal;
import work.objects.Status;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Company.class)
public class Company_ { 

    public static volatile SingularAttribute<Company, String> logo;
    public static volatile CollectionAttribute<Company, Jobs> jobsCollection;
    public static volatile SingularAttribute<Company, String> phone;
    public static volatile CollectionAttribute<Company, Accounts> accountsCollection;
    public static volatile SingularAttribute<Company, String> contactmobile;
    public static volatile SingularAttribute<Company, String> location;
    public static volatile SingularAttribute<Company, String> website;
    public static volatile CollectionAttribute<Company, Users> usersCollection;
    public static volatile SingularAttribute<Company, String> contactemail;
    public static volatile SingularAttribute<Company, Status> statusid;
    public static volatile CollectionAttribute<Company, Paypal> paypalCollection;
    public static volatile CollectionAttribute<Company, Mpesa> mpesaCollection;
    public static volatile SingularAttribute<Company, Date> expiry;
    public static volatile SingularAttribute<Company, String> contactperson;
    public static volatile SingularAttribute<Company, Integer> id;
    public static volatile CollectionAttribute<Company, Contact> contactCollection;
    public static volatile SingularAttribute<Company, String> email;
    public static volatile SingularAttribute<Company, String> address;
    public static volatile CollectionAttribute<Company, Forms> formsCollection;
    public static volatile SingularAttribute<Company, String> description;
    public static volatile SingularAttribute<Company, String> name;
    public static volatile SingularAttribute<Company, Date> datemodified;
    public static volatile SingularAttribute<Company, String> applicationemail;
    public static volatile SingularAttribute<Company, String> mobile;

}