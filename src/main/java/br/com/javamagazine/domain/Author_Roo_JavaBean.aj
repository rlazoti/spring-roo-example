package br.com.javamagazine.domain;

import java.lang.String;

privileged aspect Author_Roo_JavaBean {
    
    public String Author.getName() {    
        return this.name;        
    }    
    
    public void Author.setName(String name) {    
        this.name = name;        
    }    
    
    public String Author.getEmail() {    
        return this.email;        
    }    
    
    public void Author.setEmail(String email) {    
        this.email = email;        
    }    
    
}
