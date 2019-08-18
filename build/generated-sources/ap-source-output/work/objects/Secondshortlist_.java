package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Applications;
import work.objects.Jobs;
import work.objects.Seekers;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Secondshortlist.class)
public class Secondshortlist_ { 

    public static volatile SingularAttribute<Secondshortlist, Integer> id;
    public static volatile SingularAttribute<Secondshortlist, Boolean> hired;
    public static volatile SingularAttribute<Secondshortlist, Seekers> seekerid;
    public static volatile SingularAttribute<Secondshortlist, Users> userid;
    public static volatile SingularAttribute<Secondshortlist, Date> datemodified;
    public static volatile SingularAttribute<Secondshortlist, String> seekercomment;
    public static volatile SingularAttribute<Secondshortlist, String> internalcomment;
    public static volatile SingularAttribute<Secondshortlist, String> publiccomment;
    public static volatile SingularAttribute<Secondshortlist, Jobs> jobid;
    public static volatile SingularAttribute<Secondshortlist, Applications> applicationid;

}