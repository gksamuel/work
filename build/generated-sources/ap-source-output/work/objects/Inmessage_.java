package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Mpesa;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Inmessage.class)
public class Inmessage_ { 

    public static volatile SingularAttribute<Inmessage, Integer> id;
    public static volatile SingularAttribute<Inmessage, String> message;
    public static volatile SingularAttribute<Inmessage, String> source;
    public static volatile SingularAttribute<Inmessage, Date> datecreated;
    public static volatile CollectionAttribute<Inmessage, Mpesa> mpesaCollection;

}