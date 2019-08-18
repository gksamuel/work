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
@StaticMetamodel(Firstshortlist.class)
public class Firstshortlist_ { 

    public static volatile SingularAttribute<Firstshortlist, Integer> id;
    public static volatile SingularAttribute<Firstshortlist, Boolean> hired;
    public static volatile SingularAttribute<Firstshortlist, Seekers> seekerid;
    public static volatile SingularAttribute<Firstshortlist, Users> userid;
    public static volatile SingularAttribute<Firstshortlist, Date> datemodified;
    public static volatile SingularAttribute<Firstshortlist, String> seekercomment;
    public static volatile SingularAttribute<Firstshortlist, String> internalcomment;
    public static volatile SingularAttribute<Firstshortlist, String> publiccomment;
    public static volatile SingularAttribute<Firstshortlist, Jobs> jobid;
    public static volatile SingularAttribute<Firstshortlist, Applications> applicationid;

}