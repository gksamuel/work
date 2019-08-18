package work.objects;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Seekers;
import work.objects.Tip;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Tiprate.class)
public class Tiprate_ { 

    public static volatile SingularAttribute<Tiprate, Integer> id;
    public static volatile SingularAttribute<Tiprate, Integer> rate;
    public static volatile SingularAttribute<Tiprate, Seekers> seekerid;
    public static volatile SingularAttribute<Tiprate, Tip> tipid;
    public static volatile SingularAttribute<Tiprate, Users> userid;

}