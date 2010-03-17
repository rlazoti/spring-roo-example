package br.com.javamagazine.web;

import br.com.javamagazine.domain.Author;
import br.com.javamagazine.domain.Post;
import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect PostController_Roo_Controller {
    
    @RequestMapping(value = "/post", method = RequestMethod.POST)    
    public String PostController.create(@Valid Post post, BindingResult result, ModelMap modelMap) {    
        if (post == null) throw new IllegalArgumentException("A post is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("post", post);            
            modelMap.addAttribute("authors", Author.findAllAuthors());            
            modelMap.addAttribute("post_published_at_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            return "post/create";            
        }        
        post.persist();        
        return "redirect:/post/" + post.getId();        
    }    
    
    @RequestMapping(value = "/post/form", method = RequestMethod.GET)    
    public String PostController.createForm(ModelMap modelMap) {    
        modelMap.addAttribute("post", new Post());        
        modelMap.addAttribute("authors", Author.findAllAuthors());        
        modelMap.addAttribute("post_published_at_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "post/create";        
    }    
    
    @RequestMapping(value = "/post/{id}", method = RequestMethod.GET)    
    public String PostController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("post_published_at_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        modelMap.addAttribute("post", Post.findPost(id));        
        return "post/show";        
    }    
    
    @RequestMapping(value = "/post", method = RequestMethod.GET)    
    public String PostController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("posts", Post.findPostEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) Post.countPosts() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("posts", Post.findAllPosts());            
        }        
        modelMap.addAttribute("post_published_at_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "post/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String PostController.update(@Valid Post post, BindingResult result, ModelMap modelMap) {    
        if (post == null) throw new IllegalArgumentException("A post is required");        
        if (result.hasErrors()) {        
            modelMap.addAttribute("post", post);            
            modelMap.addAttribute("authors", Author.findAllAuthors());            
            modelMap.addAttribute("post_published_at_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));            
            return "post/update";            
        }        
        post.merge();        
        return "redirect:/post/" + post.getId();        
    }    
    
    @RequestMapping(value = "/post/{id}/form", method = RequestMethod.GET)    
    public String PostController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("post", Post.findPost(id));        
        modelMap.addAttribute("authors", Author.findAllAuthors());        
        modelMap.addAttribute("post_published_at_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));        
        return "post/update";        
    }    
    
    @RequestMapping(value = "/post/{id}", method = RequestMethod.DELETE)    
    public String PostController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        Post.findPost(id).remove();        
        return "redirect:/post?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
}
