package work.objects;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Files;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Filecategory.class)
public class Filecategory_ { 

    public static volatile SingularAttribute<Filecategory, Integer> id;
    public static volatile CollectionAttribute<Filecategory, Files> filesCollection;
    public static volatile SingularAttribute<Filecategory, String> name;

}