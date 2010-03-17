package br.com.javamagazine.domain;


@javax.persistence.Entity
@org.springframework.roo.addon.javabean.RooJavaBean
@org.springframework.roo.addon.tostring.RooToString
@org.springframework.roo.addon.entity.RooEntity
public class Author {

    @javax.validation.constraints.NotNull
    @javax.validation.constraints.Size(min = 3, max = 150)
    private String name;

    @javax.validation.constraints.Size(min = 10)
    private String email;
}
