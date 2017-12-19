package pkg.web.se;
import flexjson.JSONDeserializer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import pkg.domain.Plant;

@RequestMapping("/se/plant")
@Controller
@RooWebScaffold(path = "se/plant", formBackingObject = Plant.class, create = false, update = false, delete = false)
public class PlantSEController {

	@RequestMapping(value = "/{id}", produces = "text/html")
	public String show(@PathVariable("id") Long id, Model uiModel) {
		uiModel.addAttribute("plant", Plant.findPlant(id));
		uiModel.addAttribute("itemId", id);
		return "se/plant/show";
	}

	@RequestMapping(value = "/search", produces = "text/html")
	public String search() {
		return "se/plant/search";
	}
	@RequestMapping(value = "/checkp", produces = "text/html")
	public String checkp(HttpServletRequest request) {
		String id = request.getParameter("plant_id");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		System.out.println(id);
		return "se/plant/checkresult";
	}
	@RequestMapping(value = "/checkplant", produces = "text/html")
	public String check() {
		return "se/plant/checkplant";
	}
	

	@RequestMapping
	public String list(Model uiModel) {
		final String uri = "http://localhost:8080/Rentit-Server/plants/json";
		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.getForObject(uri, String.class);
		List<Plant> plants =   (List<Plant>) new JSONDeserializer().deserialize(result);
		uiModel.addAttribute("plants", plants);
		return "se/plant/list";
	}
}
