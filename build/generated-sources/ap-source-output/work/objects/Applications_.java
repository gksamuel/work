package work.objects;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import work.objects.Firstshortlist;
import work.objects.Jobs;
import work.objects.Notes;
import work.objects.Secondshortlist;
import work.objects.Seekers;
import work.objects.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-21T11:20:37")
@StaticMetamodel(Applications.class)
public class Applications_ { 

    public static volatile SingularAttribute<Applications, Integer> id;
    public static volatile SingularAttribute<Applications, Date> commentdate;
    public static volatile CollectionAttribute<Applications, Firstshortlist> firstshortlistCollection;
    public static volatile SingularAttribute<Applications, Seekers> seekerid;
    public static volatile SingularAttribute<Applications, String> letter;
    public static volatile SingularAttribute<Applications, Users> userid;
    public static volatile SingularAttribute<Applications, Boolean> viewed;
    public static volatile SingularAttribute<Applications, Date> datemodified;
    public static volatile CollectionAttribute<Applications, Secondshortlist> secondshortlistCollection;
    public static volatile CollectionAttribute<Applications, Notes> notesCollection;
    public static volatile SingularAttribute<Applications, String> attachment;
    public static volatile SingularAttribute<Applications, String> comment;
    public static volatile SingularAttribute<Applications, Jobs> jobid;

}