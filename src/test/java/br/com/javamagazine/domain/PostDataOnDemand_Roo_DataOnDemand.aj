package br.com.javamagazine.domain;

import br.com.javamagazine.domain.AuthorDataOnDemand;
import br.com.javamagazine.domain.Post;
import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PostDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PostDataOnDemand: @Component;    
    
    private Random PostDataOnDemand.rnd = new SecureRandom();    
    
    private List<Post> PostDataOnDemand.data;    
    
    @Autowired    
    private AuthorDataOnDemand PostDataOnDemand.authorDataOnDemand;    
    
    public Post PostDataOnDemand.getNewTransientPost(int index) {    
        br.com.javamagazine.domain.Post obj = new br.com.javamagazine.domain.Post();        
        obj.setAuthor(authorDataOnDemand.getRandomAuthor());        
        return obj;        
    }    
    
    public Post PostDataOnDemand.getRandomPost() {    
        init();        
        Post obj = data.get(rnd.nextInt(data.size()));        
        return Post.findPost(obj.getId());        
    }    
    
    public boolean PostDataOnDemand.modifyPost(Post obj) {    
        return false;        
    }    
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)    
    public void PostDataOnDemand.init() {    
        if (data != null) {        
            return;            
        }        
                
        data = br.com.javamagazine.domain.Post.findPostEntries(0, 10);        
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Post' illegally returned null");        
        if (data.size() > 0) {        
            return;            
        }        
                
        data = new java.util.ArrayList<br.com.javamagazine.domain.Post>();        
        for (int i = 0; i < 10; i++) {        
            br.com.javamagazine.domain.Post obj = getNewTransientPost(i);            
            obj.persist();            
            data.add(obj);            
        }        
    }    
    
}
