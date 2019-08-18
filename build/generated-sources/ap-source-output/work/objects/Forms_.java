package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Company;
import work.objects.Formanswers;
import work.objects.Formquestions;
import work.objects.Jobs;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Forms.class)
public class Forms_ { 

    public static volatile SingularAttribute<Forms, Integer> id;
    public static volatile CollectionAttribute<Forms, Formanswers> formanswersCollection;
    public static volatile SingularAttribute<Forms, Company> companyid;
    public static volatile SingularAttribute<Forms, String> title;
    public static volatile CollectionAttribute<Forms, Jobs> jobsCollection;
    public static volatile SingularAttribute<Forms, String> description;
    public static volatile SingularAttribute<Forms, Users> userid;
    public static volatile SingularAttribute<Forms, Date> datemodified;
    public static volatile CollectionAttribute<Forms, Formquestions> formquestionsCollection;

}