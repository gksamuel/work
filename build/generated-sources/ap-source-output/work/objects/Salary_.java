package work.objects;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Jobs;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Salary.class)
public class Salary_ { 

    public static volatile SingularAttribute<Salary, Integer> id;
    public static volatile CollectionAttribute<Salary, Jobs> jobsCollection;
    public static volatile SingularAttribute<Salary, String> salaryrange;
    public static volatile CollectionAttribute<Salary, Seekers> seekersCollection;

}