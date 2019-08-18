package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Coverletters.class)
public class Coverletters_ { 

    public static volatile SingularAttribute<Coverletters, Integer> id;
    public static volatile SingularAttribute<Coverletters, Seekers> seekerid;
    public static volatile SingularAttribute<Coverletters, String> letter;
    public static volatile SingularAttribute<Coverletters, String> name;
    public static volatile SingularAttribute<Coverletters, Date> datemodified;

}