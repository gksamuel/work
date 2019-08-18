package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Abuse;
import work.objects.Applications;
import work.objects.Contact;
import work.objects.Coverletters;
import work.objects.Education;
import work.objects.Files;
import work.objects.Firstshortlist;
import work.objects.Formanswers;
import work.objects.Groups;
import work.objects.Mpesa;
import work.objects.Pages;
import work.objects.Paypal;
import work.objects.Salary;
import work.objects.Secondshortlist;
import work.objects.Status;
import work.objects.Tellafriend;
import work.objects.Thirdshortlist;
import work.objects.Tiprate;
import work.objects.Work;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Seekers.class)
public class Seekers_ { 

    public static volatile CollectionAttribute<Seekers, Files> filesCollection;
    public static volatile CollectionAttribute<Seekers, Education> educationCollection;
    public static volatile CollectionAttribute<Seekers, Pages> pagesCollection;
    public static volatile SingularAttribute<Seekers, String> lastname;
    public static volatile SingularAttribute<Seekers, Date> dateofbirth;
    public static volatile SingularAttribute<Seekers, Date> datecreated;
    public static volatile SingularAttribute<Seekers, String> password;
    public static volatile SingularAttribute<Seekers, Date> expiry;
    public static volatile CollectionAttribute<Seekers, Applications> applicationsCollection;
    public static volatile SingularAttribute<Seekers, Integer> id;
    public static volatile SingularAttribute<Seekers, Salary> salaryid;
    public static volatile SingularAttribute<Seekers, String> username;
    public static volatile SingularAttribute<Seekers, String> maritalstatus;
    public static volatile CollectionAttribute<Seekers, Contact> contactCollection;
    public static volatile SingularAttribute<Seekers, String> driverslicence;
    public static volatile CollectionAttribute<Seekers, Work> workCollection;
    public static volatile SingularAttribute<Seekers, Boolean> gender;
    public static volatile SingularAttribute<Seekers, Date> datemodified;
    public static volatile CollectionAttribute<Seekers, Secondshortlist> secondshortlistCollection;
    public static volatile SingularAttribute<Seekers, Integer> points;
    public static volatile SingularAttribute<Seekers, Groups> groupid;
    public static volatile CollectionAttribute<Seekers, Formanswers> formanswersCollection;
    public static volatile CollectionAttribute<Seekers, Firstshortlist> firstshortlistCollection;
    public static volatile SingularAttribute<Seekers, String> middlename;
    public static volatile SingularAttribute<Seekers, String> website;
    public static volatile SingularAttribute<Seekers, String> idnumber;
    public static volatile SingularAttribute<Seekers, Status> statusid;
    public static volatile SingularAttribute<Seekers, String> firstname;
    public static volatile SingularAttribute<Seekers, String> photo;
    public static volatile CollectionAttribute<Seekers, Paypal> paypalCollection;
    public static volatile CollectionAttribute<Seekers, Mpesa> mpesaCollection;
    public static volatile SingularAttribute<Seekers, String> othernumber;
    public static volatile CollectionAttribute<Seekers, Tiprate> tiprateCollection;
    public static volatile SingularAttribute<Seekers, String> address;
    public static volatile SingularAttribute<Seekers, String> email;
    public static volatile CollectionAttribute<Seekers, Coverletters> coverlettersCollection;
    public static volatile CollectionAttribute<Seekers, Abuse> abuseCollection;
    public static volatile SingularAttribute<Seekers, String> pinnumber;
    public static volatile CollectionAttribute<Seekers, Tellafriend> tellafriendCollection;
    public static volatile SingularAttribute<Seekers, String> passport;
    public static volatile SingularAttribute<Seekers, String> mobile;
    public static volatile CollectionAttribute<Seekers, Thirdshortlist> thirdshortlistCollection;

}