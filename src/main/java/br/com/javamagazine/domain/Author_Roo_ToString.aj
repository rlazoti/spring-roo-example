package br.com.javamagazine.domain;

import java.lang.String;

privileged aspect Author_Roo_ToString {
    
    public String Author.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Name: ").append(getName()).append(", ");        
        sb.append("Email: ").append(getEmail());        
        return sb.toString();        
    }    
    
}
