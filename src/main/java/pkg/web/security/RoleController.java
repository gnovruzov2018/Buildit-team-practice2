package pkg.web.security;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pkg.security.Authorities;

@RequestMapping("/security/authorities")
@Controller
@RooWebScaffold(path = "security/authorities", formBackingObject = Authorities.class)
public class RoleController {
}
