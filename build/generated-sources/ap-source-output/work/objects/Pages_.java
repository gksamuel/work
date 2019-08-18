package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Pages.class)
public class Pages_ { 

    public static volatile SingularAttribute<Pages, Integer> id;
    public static volatile SingularAttribute<Pages, String> content;
    public static volatile SingularAttribute<Pages, String> title;
    public static volatile SingularAttribute<Pages, Seekers> seekerid;
    public static volatile SingularAttribute<Pages, Date> datemodified;

}