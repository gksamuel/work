package work.objects;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Formquestions;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Questiontypes.class)
public class Questiontypes_ { 

    public static volatile SingularAttribute<Questiontypes, Integer> id;
    public static volatile SingularAttribute<Questiontypes, String> questiontype;
    public static volatile CollectionAttribute<Questiontypes, Formquestions> formquestionsCollection;

}