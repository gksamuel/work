package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Tiprate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Tip.class)
public class Tip_ { 

    public static volatile SingularAttribute<Tip, Integer> id;
    public static volatile SingularAttribute<Tip, Date> datesubmited;
    public static volatile CollectionAttribute<Tip, Tiprate> tiprateCollection;
    public static volatile SingularAttribute<Tip, Integer> rate;
    public static volatile SingularAttribute<Tip, String> submittedby;
    public static volatile SingularAttribute<Tip, String> tip;

}