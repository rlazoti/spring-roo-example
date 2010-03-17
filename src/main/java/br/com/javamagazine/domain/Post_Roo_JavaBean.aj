package br.com.javamagazine.domain;

import br.com.javamagazine.domain.Author;
import java.lang.String;
import java.util.Date;

privileged aspect Post_Roo_JavaBean {
    
    public String Post.getTitle() {    
        return this.title;        
    }    
    
    public void Post.setTitle(String title) {    
        this.title = title;        
    }    
    
    public String Post.getBody() {    
        return this.body;        
    }    
    
    public void Post.setBody(String body) {    
        this.body = body;        
    }    
    
    public Author Post.getAuthor() {    
        return this.author;        
    }    
    
    public void Post.setAuthor(Author author) {    
        this.author = author;        
    }    
    
    public Date Post.getPublished_at() {    
        return this.published_at;        
    }    
    
    public void Post.setPublished_at(Date published_at) {    
        this.published_at = published_at;        
    }    
    
}
