package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Jobs;
import work.objects.Seekers;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Thirdshortlist.class)
public class Thirdshortlist_ { 

    public static volatile SingularAttribute<Thirdshortlist, Integer> id;
    public static volatile SingularAttribute<Thirdshortlist, Boolean> hired;
    public static volatile SingularAttribute<Thirdshortlist, Seekers> seekerid;
    public static volatile SingularAttribute<Thirdshortlist, Users> userid;
    public static volatile SingularAttribute<Thirdshortlist, Date> datemodified;
    public static volatile SingularAttribute<Thirdshortlist, String> seekercomment;
    public static volatile SingularAttribute<Thirdshortlist, String> internalcomment;
    public static volatile SingularAttribute<Thirdshortlist, String> publiccomment;
    public static volatile SingularAttribute<Thirdshortlist, Jobs> jobid;

}