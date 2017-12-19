package pkg.security;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "users")
public class Users {

    /**
     */
    @NotNull
    @Size(min = 3, max = 50)
    private String username;

    /**
     */
    @NotNull
    @Size(min = 3, max = 50)
    private String password;

    /**
     */
    private Boolean enabled;
}
