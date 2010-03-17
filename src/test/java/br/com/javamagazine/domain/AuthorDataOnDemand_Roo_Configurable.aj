package br.com.javamagazine.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect AuthorDataOnDemand_Roo_Configurable {
    
    declare @type: AuthorDataOnDemand: @Configurable;    
    
}
