package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Company;
import work.objects.Jobs;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Accounts.class)
public class Accounts_ { 

    public static volatile SingularAttribute<Accounts, Integer> id;
    public static volatile SingularAttribute<Accounts, Company> companyid;
    public static volatile CollectionAttribute<Accounts, Jobs> jobsCollection;
    public static volatile SingularAttribute<Accounts, String> description;
    public static volatile SingularAttribute<Accounts, String> name;
    public static volatile CollectionAttribute<Accounts, Users> usersCollection;
    public static volatile SingularAttribute<Accounts, Boolean> mainaccount;
    public static volatile SingularAttribute<Accounts, Date> datecreated;

}