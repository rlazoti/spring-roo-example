package br.com.javamagazine.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Author_Roo_Configurable {
    
    declare @type: Author: @Configurable;    
    
}
