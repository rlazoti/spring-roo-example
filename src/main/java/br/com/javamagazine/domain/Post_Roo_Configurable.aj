package br.com.javamagazine.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Post_Roo_Configurable {
    
    declare @type: Post: @Configurable;    
    
}
