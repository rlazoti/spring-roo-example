package br.com.javamagazine.domain;

import br.com.javamagazine.domain.Post;
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

privileged aspect Post_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Post.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long Post.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer Post.version;    
    
    public Long Post.getId() {    
        return this.id;        
    }    
    
    public void Post.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer Post.getVersion() {    
        return this.version;        
    }    
    
    public void Post.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Post.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Post.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Post attached = this.entityManager.find(Post.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Post.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Post.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Post merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Post.entityManager() {    
        EntityManager em = new Post().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Post.countPosts() {    
        return (Long) entityManager().createQuery("select count(o) from Post o").getSingleResult();        
    }    
    
    public static List<Post> Post.findAllPosts() {    
        return entityManager().createQuery("select o from Post o").getResultList();        
    }    
    
    public static Post Post.findPost(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Post");        
        return entityManager().find(Post.class, id);        
    }    
    
    public static List<Post> Post.findPostEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from Post o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
