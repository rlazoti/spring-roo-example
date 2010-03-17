package br.com.javamagazine.web;

import br.com.javamagazine.domain.Author;
import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect AuthorController_Roo_Controller {
    
    @RequestMapping(value = "/author", method = RequestMethod.POST)    
    public String AuthorController.create(@Valid Author author, BindingResult result, ModelMap modelMap) {    
        if (author == null) throw new IllegalArgumentException("A author is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("author", author);            
            return "author/create";            
        }        
        author.persist();        
        return "redirect:/author/" + author.getId();        
    }    
    
    @RequestMapping(value = "/author/form", method = RequestMethod.GET)    
    public String AuthorController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("author", new Author());        
        return "author/create";        
    }    
    
    @RequestMapping(value = "/author/{id}", method = RequestMethod.GET)    
    public String AuthorController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("author", Author.findAuthor(id));        
        return "author/show";        
    }    
    
    @RequestMapping(value = "/author", method = RequestMethod.GET)    
    public String AuthorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("authors", Author.findAuthorEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) Author.countAuthors() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("authors", Author.findAllAuthors());            
        }        
        return "author/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String AuthorController.update(@Valid Author author, BindingResult result, ModelMap modelMap) {    
        if (author == null) throw new IllegalArgumentException("A author is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("author", author);            
            return "author/update";            
        }        
        author.merge();        
        return "redirect:/author/" + author.getId();        
    }    
    
    @RequestMapping(value = "/author/{id}/form", method = RequestMethod.GET)    
    public String AuthorController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("author", Author.findAuthor(id));        
        return "author/update";        
    }    
    
    @RequestMapping(value = "/author/{id}", method = RequestMethod.DELETE)    
    public String AuthorController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        Author.findAuthor(id).remove();        
        return "redirect:/author?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
}
