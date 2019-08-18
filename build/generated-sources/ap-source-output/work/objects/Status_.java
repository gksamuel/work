package work.objects;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Company;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Status.class)
public class Status_ { 

    public static volatile SingularAttribute<Status, Integer> id;
    public static volatile SingularAttribute<Status, String> description;
    public static volatile CollectionAttribute<Status, Seekers> seekersCollection;
    public static volatile CollectionAttribute<Status, Company> companyCollection;

}