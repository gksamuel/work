package work.objects;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Agent;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Outmessage.class)
public class Outmessage_ { 

    public static volatile SingularAttribute<Outmessage, Integer> id;
    public static volatile SingularAttribute<Outmessage, String> textmessage;
    public static volatile SingularAttribute<Outmessage, String> htmlmessage;
    public static volatile CollectionAttribute<Outmessage, Agent> agentCollection;

}