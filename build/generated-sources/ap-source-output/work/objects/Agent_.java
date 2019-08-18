package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Outmessage;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Agent.class)
public class Agent_ { 

    public static volatile SingularAttribute<Agent, Date> lastmessage;
    public static volatile SingularAttribute<Agent, Date> accesstime;
    public static volatile SingularAttribute<Agent, String> mobile2;
    public static volatile SingularAttribute<Agent, String> agentname;
    public static volatile SingularAttribute<Agent, Integer> access;
    public static volatile SingularAttribute<Agent, String> email2;
    public static volatile SingularAttribute<Agent, String> contactperson;
    public static volatile SingularAttribute<Agent, Integer> id;
    public static volatile SingularAttribute<Agent, String> feedback;
    public static volatile SingularAttribute<Agent, String> email;
    public static volatile SingularAttribute<Agent, String> contactname;
    public static volatile SingularAttribute<Agent, Boolean> active;
    public static volatile SingularAttribute<Agent, Outmessage> messageid;
    public static volatile SingularAttribute<Agent, String> mobile;

}