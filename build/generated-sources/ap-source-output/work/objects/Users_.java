package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Accounts;
import work.objects.Applications;
import work.objects.Company;
import work.objects.Contact;
import work.objects.Firstshortlist;
import work.objects.Forms;
import work.objects.Groups;
import work.objects.Jobs;
import work.objects.Notes;
import work.objects.Secondshortlist;
import work.objects.Thirdshortlist;
import work.objects.Tiprate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile CollectionAttribute<Users, Jobs> jobsCollection;
    public static volatile CollectionAttribute<Users, Firstshortlist> firstshortlistCollection;
    public static volatile SingularAttribute<Users, String> password;
    public static volatile CollectionAttribute<Users, Applications> applicationsCollection;
    public static volatile SingularAttribute<Users, Integer> id;
    public static volatile SingularAttribute<Users, Company> companyid;
    public static volatile CollectionAttribute<Users, Tiprate> tiprateCollection;
    public static volatile SingularAttribute<Users, String> username;
    public static volatile CollectionAttribute<Users, Contact> contactCollection;
    public static volatile SingularAttribute<Users, String> email;
    public static volatile SingularAttribute<Users, Boolean> admin;
    public static volatile CollectionAttribute<Users, Forms> formsCollection;
    public static volatile SingularAttribute<Users, String> description;
    public static volatile SingularAttribute<Users, String> name;
    public static volatile SingularAttribute<Users, Boolean> active;
    public static volatile SingularAttribute<Users, Date> datemodified;
    public static volatile SingularAttribute<Users, Groups> groupid;
    public static volatile CollectionAttribute<Users, Secondshortlist> secondshortlistCollection;
    public static volatile CollectionAttribute<Users, Notes> notesCollection;
    public static volatile SingularAttribute<Users, Accounts> accountid;
    public static volatile CollectionAttribute<Users, Thirdshortlist> thirdshortlistCollection;

}