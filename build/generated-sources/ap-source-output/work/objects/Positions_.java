package work.objects;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Jobs;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Positions.class)
public class Positions_ { 

    public static volatile SingularAttribute<Positions, Integer> id;
    public static volatile CollectionAttribute<Positions, Jobs> jobsCollection;
    public static volatile SingularAttribute<Positions, String> noofpositions;

}