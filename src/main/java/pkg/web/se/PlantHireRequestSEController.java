package pkg.web.se;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pkg.domain.PHRStatus;
import pkg.domain.PlantHireRequest;

@RequestMapping("/se/phrs")
@Controller
@RooWebScaffold(path = "se/phrs", formBackingObject = PlantHireRequest.class, delete = false)
public class PlantHireRequestSEController {
	@RequestMapping(value = "/cancel/{id}", produces = "text/html")
    public String cancelPhrs(@PathVariable("id") Long id, Model uiModel) {
        PlantHireRequest phrs = PlantHireRequest.findPlantHireRequest(id);
        if(phrs.getStatus()==PHRStatus.PENDING_CONFIRMATION) {
        	phrs.remove();
        	uiModel.addAttribute("status", "pending");
            return "se/phrs/status";
        }else if(phrs.getStatus()==PHRStatus.ACCEPTED) {
	        phrs.setStatus(PHRStatus.CANCELLED);
	        phrs.persist();
	        uiModel.addAttribute("status", "accepted");
	        uiModel.addAttribute("id", id);
	        return "se/phrs/status";
        }
        uiModel.addAttribute("status", "other");
        return "se/phrs/status";
    }
}
