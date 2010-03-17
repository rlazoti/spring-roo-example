package br.com.javamagazine.domain;

import br.com.javamagazine.domain.PostDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PostIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PostIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);    
    
    declare @type: PostIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");    
    
    @Autowired    
    private PostDataOnDemand PostIntegrationTest.dod;    
    
    @Test    
    public void PostIntegrationTest.testCountPosts() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());        
        long count = br.com.javamagazine.domain.Post.countPosts();        
        org.junit.Assert.assertTrue("Counter for 'Post' incorrectly reported there were no entries", count > 0);        
    }    
    
    @Test    
    public void PostIntegrationTest.testFindPost() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());        
        java.lang.Long id = dod.getRandomPost().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to provide an identifier", id);        
        br.com.javamagazine.domain.Post obj = br.com.javamagazine.domain.Post.findPost(id);        
        org.junit.Assert.assertNotNull("Find method for 'Post' illegally returned null for id '" + id + "'", obj);        
        org.junit.Assert.assertEquals("Find method for 'Post' returned the incorrect identifier", id, obj.getId());        
    }    
    
    @Test    
    public void PostIntegrationTest.testFindAllPosts() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());        
        long count = br.com.javamagazine.domain.Post.countPosts();        
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Post', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);        
        java.util.List<br.com.javamagazine.domain.Post> result = br.com.javamagazine.domain.Post.findAllPosts();        
        org.junit.Assert.assertNotNull("Find all method for 'Post' illegally returned null", result);        
        org.junit.Assert.assertTrue("Find all method for 'Post' failed to return any data", result.size() > 0);        
    }    
    
    @Test    
    public void PostIntegrationTest.testFindPostEntries() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());        
        long count = br.com.javamagazine.domain.Post.countPosts();        
        if (count > 20) count = 20;        
        java.util.List<br.com.javamagazine.domain.Post> result = br.com.javamagazine.domain.Post.findPostEntries(0, (int)count);        
        org.junit.Assert.assertNotNull("Find entries method for 'Post' illegally returned null", result);        
        org.junit.Assert.assertEquals("Find entries method for 'Post' returned an incorrect number of entries", count, result.size());        
    }    
    
    @Test    
    @Transactional    
    public void PostIntegrationTest.testFlush() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());        
        java.lang.Long id = dod.getRandomPost().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to provide an identifier", id);        
        br.com.javamagazine.domain.Post obj = br.com.javamagazine.domain.Post.findPost(id);        
        org.junit.Assert.assertNotNull("Find method for 'Post' illegally returned null for id '" + id + "'", obj);        
        boolean modified =  dod.modifyPost(obj);        
        java.lang.Integer currentVersion = obj.getVersion();        
        obj.flush();        
        org.junit.Assert.assertTrue("Version for 'Post' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);        
    }    
    
    @Test    
    @Transactional    
    public void PostIntegrationTest.testMerge() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());        
        java.lang.Long id = dod.getRandomPost().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to provide an identifier", id);        
        br.com.javamagazine.domain.Post obj = br.com.javamagazine.domain.Post.findPost(id);        
        org.junit.Assert.assertNotNull("Find method for 'Post' illegally returned null for id '" + id + "'", obj);        
        boolean modified =  dod.modifyPost(obj);        
        java.lang.Integer currentVersion = obj.getVersion();        
        obj.merge();        
        obj.flush();        
        org.junit.Assert.assertTrue("Version for 'Post' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);        
    }    
    
    @Test    
    @Transactional    
    public void PostIntegrationTest.testPersist() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());        
        br.com.javamagazine.domain.Post obj = dod.getNewTransientPost(Integer.MAX_VALUE);        
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to provide a new transient entity", obj);        
        org.junit.Assert.assertNull("Expected 'Post' identifier to be null", obj.getId());        
        obj.persist();        
        obj.flush();        
        org.junit.Assert.assertNotNull("Expected 'Post' identifier to no longer be null", obj.getId());        
    }    
    
    @Test    
    @Transactional    
    public void PostIntegrationTest.testRemove() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());        
        java.lang.Long id = dod.getRandomPost().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Post' failed to provide an identifier", id);        
        br.com.javamagazine.domain.Post obj = br.com.javamagazine.domain.Post.findPost(id);        
        org.junit.Assert.assertNotNull("Find method for 'Post' illegally returned null for id '" + id + "'", obj);        
        obj.remove();        
        org.junit.Assert.assertNull("Failed to remove 'Post' with identifier '" + id + "'", br.com.javamagazine.domain.Post.findPost(id));        
    }    
    
}
