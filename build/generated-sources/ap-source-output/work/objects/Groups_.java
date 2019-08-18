package work.objects;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Registration;
import work.objects.Seekers;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Groups.class)
public class Groups_ { 

    public static volatile SingularAttribute<Groups, Integer> id;
    public static volatile CollectionAttribute<Groups, Seekers> seekersCollection;
    public static volatile SingularAttribute<Groups, String> name;
    public static volatile CollectionAttribute<Groups, Users> usersCollection;
    public static volatile CollectionAttribute<Groups, Registration> registrationCollection;

}