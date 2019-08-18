package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Applications;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Notes.class)
public class Notes_ { 

    public static volatile SingularAttribute<Notes, Integer> id;
    public static volatile SingularAttribute<Notes, Users> userid;
    public static volatile SingularAttribute<Notes, Integer> parent;
    public static volatile SingularAttribute<Notes, Date> datecreated;
    public static volatile SingularAttribute<Notes, Date> datemodified;
    public static volatile SingularAttribute<Notes, String> comment;
    public static volatile SingularAttribute<Notes, String> stage;
    public static volatile SingularAttribute<Notes, Applications> applicationid;

}