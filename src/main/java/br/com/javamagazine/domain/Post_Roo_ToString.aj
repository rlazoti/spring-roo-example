package br.com.javamagazine.domain;

import java.lang.String;

privileged aspect Post_Roo_ToString {
    
    public String Post.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Title: ").append(getTitle()).append(", ");        
        sb.append("Body: ").append(getBody()).append(", ");        
        sb.append("Author: ").append(getAuthor()).append(", ");        
        sb.append("Published_at: ").append(getPublished_at());        
        return sb.toString();        
    }    
    
}
