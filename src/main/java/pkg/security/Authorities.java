package pkg.security;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "authorities")
public class Authorities {

    /**
     */
    @NotNull
    @Size(min = 8, max = 50)
    @Pattern(regexp = "^ROLE_[A-Z]*")
    private String authority;
}
