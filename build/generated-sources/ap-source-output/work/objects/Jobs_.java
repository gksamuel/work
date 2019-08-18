package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Abuse;
import work.objects.Accounts;
import work.objects.Applications;
import work.objects.Category;
import work.objects.Company;
import work.objects.Firstshortlist;
import work.objects.Forms;
import work.objects.Positions;
import work.objects.Salary;
import work.objects.Secondshortlist;
import work.objects.Tellafriend;
import work.objects.Thirdshortlist;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Jobs.class)
public class Jobs_ { 

    public static volatile SingularAttribute<Jobs, String> summary;
    public static volatile CollectionAttribute<Jobs, Firstshortlist> firstshortlistCollection;
    public static volatile SingularAttribute<Jobs, String> qualifications;
    public static volatile SingularAttribute<Jobs, String> instructions;
    public static volatile SingularAttribute<Jobs, Users> userid;
    public static volatile SingularAttribute<Jobs, Positions> positionsid;
    public static volatile SingularAttribute<Jobs, String> attachment;
    public static volatile SingularAttribute<Jobs, Forms> formid;
    public static volatile CollectionAttribute<Jobs, Applications> applicationsCollection;
    public static volatile SingularAttribute<Jobs, Integer> id;
    public static volatile SingularAttribute<Jobs, Salary> salaryid;
    public static volatile SingularAttribute<Jobs, Company> companyid;
    public static volatile SingularAttribute<Jobs, Category> categoryid;
    public static volatile SingularAttribute<Jobs, String> jobdescription;
    public static volatile SingularAttribute<Jobs, String> title;
    public static volatile SingularAttribute<Jobs, Date> startdate;
    public static volatile SingularAttribute<Jobs, String> email;
    public static volatile SingularAttribute<Jobs, Integer> maxapplications;
    public static volatile CollectionAttribute<Jobs, Abuse> abuseCollection;
    public static volatile SingularAttribute<Jobs, String> referenceno;
    public static volatile CollectionAttribute<Jobs, Tellafriend> tellafriendCollection;
    public static volatile SingularAttribute<Jobs, String> experience;
    public static volatile SingularAttribute<Jobs, Date> datemodified;
    public static volatile CollectionAttribute<Jobs, Secondshortlist> secondshortlistCollection;
    public static volatile SingularAttribute<Jobs, Date> enddate;
    public static volatile SingularAttribute<Jobs, Accounts> accountid;
    public static volatile CollectionAttribute<Jobs, Thirdshortlist> thirdshortlistCollection;

}