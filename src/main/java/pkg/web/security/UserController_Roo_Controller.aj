// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pkg.web.security;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import pkg.security.Users;
import pkg.web.security.UserController;

privileged aspect UserController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UserController.create(@Valid Users users, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, users);
            return "security/users/create";
        }
        uiModel.asMap().clear();
        users.persist();
        return "redirect:/security/users/" + encodeUrlPathSegment(users.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UserController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Users());
        return "security/users/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String UserController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("users", Users.findUsers(id));
        uiModel.addAttribute("itemId", id);
        return "security/users/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("userses", Users.findUsersEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Users.countUserses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("userses", Users.findAllUserses(sortFieldName, sortOrder));
        }
        return "security/users/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UserController.update(@Valid Users users, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, users);
            return "security/users/update";
        }
        uiModel.asMap().clear();
        users.merge();
        return "redirect:/security/users/" + encodeUrlPathSegment(users.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String UserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Users.findUsers(id));
        return "security/users/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String UserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Users users = Users.findUsers(id);
        users.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/security/users";
    }
    
    void UserController.populateEditForm(Model uiModel, Users users) {
        uiModel.addAttribute("users", users);
    }
    
    String UserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
