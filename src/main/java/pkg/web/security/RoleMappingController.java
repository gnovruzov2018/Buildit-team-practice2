package pkg.web.security;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pkg.security.Assignments;

@RequestMapping("/security/assignments")
@Controller
@RooWebScaffold(path = "security/assignments", formBackingObject = Assignments.class)
public class RoleMappingController {
}
