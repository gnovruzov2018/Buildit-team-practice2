package pkg.web.security;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pkg.security.Users;

@RequestMapping("/security/users")
@Controller
@RooWebScaffold(path = "security/users", formBackingObject = Users.class)
public class UserController {
}
