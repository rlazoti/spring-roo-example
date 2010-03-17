package br.com.javamagazine.domain;

import br.com.javamagazine.domain.Author;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Author_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Author.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long Author.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer Author.version;    
    
    public Long Author.getId() {    
        return this.id;        
    }    
    
    public void Author.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer Author.getVersion() {    
        return this.version;        
    }    
    
    public void Author.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Author.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Author.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Author attached = this.entityManager.find(Author.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Author.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Author.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Author merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Author.entityManager() {    
        EntityManager em = new Author().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Author.countAuthors() {    
        return (Long) entityManager().createQuery("select count(o) from Author o").getSingleResult();        
    }    
    
    public static List<Author> Author.findAllAuthors() {    
        return entityManager().createQuery("select o from Author o").getResultList();        
    }    
    
    public static Author Author.findAuthor(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Author");        
        return entityManager().find(Author.class, id);        
    }    
    
    public static List<Author> Author.findAuthorEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from Author o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
