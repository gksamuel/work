package work.objects;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Formanswers;
import work.objects.Forms;
import work.objects.Questiontypes;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Formquestions.class)
public class Formquestions_ { 

    public static volatile SingularAttribute<Formquestions, Integer> id;
    public static volatile CollectionAttribute<Formquestions, Formanswers> formanswersCollection;
    public static volatile SingularAttribute<Formquestions, Questiontypes> questiontypeid;
    public static volatile SingularAttribute<Formquestions, String> question;
    public static volatile SingularAttribute<Formquestions, Forms> formid;

}