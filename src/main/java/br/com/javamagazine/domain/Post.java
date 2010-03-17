package br.com.javamagazine.domain;


@javax.persistence.Entity
@org.springframework.roo.addon.javabean.RooJavaBean
@org.springframework.roo.addon.tostring.RooToString
@org.springframework.roo.addon.entity.RooEntity
public class Post {

    @javax.validation.constraints.Size(min = 10, max = 100)
    private String title;

    @javax.validation.constraints.Size(max = 10000)
    private String body;

    @javax.validation.constraints.NotNull
    @javax.persistence.ManyToOne(targetEntity = br.com.javamagazine.domain.Author.class)
    @javax.persistence.JoinColumn
    private br.com.javamagazine.domain.Author author;

    @javax.persistence.Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @org.springframework.format.annotation.DateTimeFormat(style = "S-")
    private java.util.Date published_at;
}
