package pkg.security;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "assignments")
public class Assignments {

    /**
     */
    @ManyToOne
    private Users userBuildIt;

    /**
     */
    @ManyToOne
    private Authorities authority;
}
