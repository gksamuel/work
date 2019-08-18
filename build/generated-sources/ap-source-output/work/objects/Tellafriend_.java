package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Jobs;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Tellafriend.class)
public class Tellafriend_ { 

    public static volatile SingularAttribute<Tellafriend, Integer> id;
    public static volatile SingularAttribute<Tellafriend, Seekers> seekerid;
    public static volatile SingularAttribute<Tellafriend, String> name;
    public static volatile SingularAttribute<Tellafriend, Date> datecreated;
    public static volatile SingularAttribute<Tellafriend, String> friend;
    public static volatile SingularAttribute<Tellafriend, Jobs> jobid;

}