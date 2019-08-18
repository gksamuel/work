package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Groups;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Registration.class)
public class Registration_ { 

    public static volatile SingularAttribute<Registration, Integer> id;
    public static volatile SingularAttribute<Registration, String> username;
    public static volatile SingularAttribute<Registration, String> passphrase;
    public static volatile SingularAttribute<Registration, String> email;
    public static volatile SingularAttribute<Registration, Date> createdate;
    public static volatile SingularAttribute<Registration, String> code;
    public static volatile SingularAttribute<Registration, Groups> groupid;
    public static volatile SingularAttribute<Registration, String> password;

}