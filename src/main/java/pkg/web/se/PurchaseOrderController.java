package pkg.web.se;
import java.util.List;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import flexjson.JSONDeserializer;
import pkg.domain.PurchaseOrder;

@RequestMapping("/se/po")
@Controller
@RooWebScaffold(path = "se/po", formBackingObject = PurchaseOrder.class, update = false, create = false, delete = false)
public class PurchaseOrderController {
	
	@RequestMapping
	public String list(Model uiModel) {
		final String uri = "https://rentit-team-practice2.herokuapp.com/purchaseorders/json";
		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.getForObject(uri, String.class);
		List<PurchaseOrder> purchaseorders =   (List<PurchaseOrder>) new JSONDeserializer().deserialize(result);
		for(int i = 0; i<purchaseorders.size();i++) {
			System.out.println(purchaseorders.get(i));
		}
		System.out.println("sadasd");
		System.out.println(purchaseorders.size());
		uiModel.addAttribute("purchaseorders", purchaseorders);
		return "se/po/list";
	}
}
