package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Jobs;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Abuse.class)
public class Abuse_ { 

    public static volatile SingularAttribute<Abuse, Integer> id;
    public static volatile SingularAttribute<Abuse, Seekers> seekerid;
    public static volatile SingularAttribute<Abuse, Date> datesubmitted;
    public static volatile SingularAttribute<Abuse, String> comment;
    public static volatile SingularAttribute<Abuse, Jobs> jobid;

}