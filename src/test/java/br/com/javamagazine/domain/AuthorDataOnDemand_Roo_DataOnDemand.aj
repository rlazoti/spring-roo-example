package br.com.javamagazine.domain;

import br.com.javamagazine.domain.Author;
import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AuthorDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AuthorDataOnDemand: @Component;    
    
    private Random AuthorDataOnDemand.rnd = new SecureRandom();    
    
    private List<Author> AuthorDataOnDemand.data;    
    
    public Author AuthorDataOnDemand.getNewTransientAuthor(int index) {    
        br.com.javamagazine.domain.Author obj = new br.com.javamagazine.domain.Author();        
        obj.setName("name_" + index);        
        return obj;        
    }    
    
    public Author AuthorDataOnDemand.getRandomAuthor() {    
        init();        
        Author obj = data.get(rnd.nextInt(data.size()));        
        return Author.findAuthor(obj.getId());        
    }    
    
    public boolean AuthorDataOnDemand.modifyAuthor(Author obj) {    
        return false;        
    }    
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)    
    public void AuthorDataOnDemand.init() {    
        if (data != null) {        
            return;            
        }        
                
        data = br.com.javamagazine.domain.Author.findAuthorEntries(0, 10);        
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Author' illegally returned null");        
        if (data.size() > 0) {        
            return;            
        }        
                
        data = new java.util.ArrayList<br.com.javamagazine.domain.Author>();        
        for (int i = 0; i < 10; i++) {        
            br.com.javamagazine.domain.Author obj = getNewTransientAuthor(i);            
            obj.persist();            
            data.add(obj);            
        }        
    }    
    
}
