package pkg.web.we;

import org.springframework.context.annotation.Scope;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pkg.domain.PlantHireRequest;

@RequestMapping("/we/phrs")
@Controller
@Scope("session")
@RooWebScaffold(path = "we/phrs", formBackingObject = PlantHireRequest.class, create = false, delete = false)
public class PlantHireRequestWEController {

}
