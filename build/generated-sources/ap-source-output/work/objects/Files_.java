package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Filecategory;
import work.objects.Seekers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Files.class)
public class Files_ { 

    public static volatile SingularAttribute<Files, Integer> id;
    public static volatile SingularAttribute<Files, Integer> filesize;
    public static volatile SingularAttribute<Files, Boolean> viewable;
    public static volatile SingularAttribute<Files, Seekers> seekerid;
    public static volatile SingularAttribute<Files, String> originalfilename;
    public static volatile SingularAttribute<Files, String> description;
    public static volatile SingularAttribute<Files, String> filename;
    public static volatile SingularAttribute<Files, String> filetype;
    public static volatile SingularAttribute<Files, Date> datemodified;
    public static volatile SingularAttribute<Files, Filecategory> filecategoryid;
    public static volatile SingularAttribute<Files, String> metadata;

}