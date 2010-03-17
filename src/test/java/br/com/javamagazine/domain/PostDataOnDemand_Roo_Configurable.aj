package br.com.javamagazine.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect PostDataOnDemand_Roo_Configurable {
    
    declare @type: PostDataOnDemand: @Configurable;    
    
}
