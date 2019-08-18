package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Formquestions;
import work.objects.Forms;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Formanswers.class)
public class Formanswers_ { 

    public static volatile SingularAttribute<Formanswers, Integer> id;
    public static volatile SingularAttribute<Formanswers, Seekers> seekerid;
    public static volatile SingularAttribute<Formanswers, Formquestions> formquestionid;
    public static volatile SingularAttribute<Formanswers, String> answer;
    public static volatile SingularAttribute<Formanswers, Date> datemodified;
    public static volatile SingularAttribute<Formanswers, String> question;
    public static volatile SingularAttribute<Formanswers, Forms> formid;

}