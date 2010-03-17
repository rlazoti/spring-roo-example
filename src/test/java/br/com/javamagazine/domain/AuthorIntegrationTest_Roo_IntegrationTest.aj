package br.com.javamagazine.domain;

import br.com.javamagazine.domain.AuthorDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AuthorIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AuthorIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);    
    
    declare @type: AuthorIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");    
    
    @Autowired    
    private AuthorDataOnDemand AuthorIntegrationTest.dod;    
    
    @Test    
    public void AuthorIntegrationTest.testCountAuthors() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());        
        long count = br.com.javamagazine.domain.Author.countAuthors();        
        org.junit.Assert.assertTrue("Counter for 'Author' incorrectly reported there were no entries", count > 0);        
    }    
    
    @Test    
    public void AuthorIntegrationTest.testFindAuthor() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());        
        java.lang.Long id = dod.getRandomAuthor().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to provide an identifier", id);        
        br.com.javamagazine.domain.Author obj = br.com.javamagazine.domain.Author.findAuthor(id);        
        org.junit.Assert.assertNotNull("Find method for 'Author' illegally returned null for id '" + id + "'", obj);        
        org.junit.Assert.assertEquals("Find method for 'Author' returned the incorrect identifier", id, obj.getId());        
    }    
    
    @Test    
    public void AuthorIntegrationTest.testFindAllAuthors() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());        
        long count = br.com.javamagazine.domain.Author.countAuthors();        
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Author', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);        
        java.util.List<br.com.javamagazine.domain.Author> result = br.com.javamagazine.domain.Author.findAllAuthors();        
        org.junit.Assert.assertNotNull("Find all method for 'Author' illegally returned null", result);        
        org.junit.Assert.assertTrue("Find all method for 'Author' failed to return any data", result.size() > 0);        
    }    
    
    @Test    
    public void AuthorIntegrationTest.testFindAuthorEntries() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());        
        long count = br.com.javamagazine.domain.Author.countAuthors();        
        if (count > 20) count = 20;        
        java.util.List<br.com.javamagazine.domain.Author> result = br.com.javamagazine.domain.Author.findAuthorEntries(0, (int)count);        
        org.junit.Assert.assertNotNull("Find entries method for 'Author' illegally returned null", result);        
        org.junit.Assert.assertEquals("Find entries method for 'Author' returned an incorrect number of entries", count, result.size());        
    }    
    
    @Test    
    @Transactional    
    public void AuthorIntegrationTest.testFlush() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());        
        java.lang.Long id = dod.getRandomAuthor().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to provide an identifier", id);        
        br.com.javamagazine.domain.Author obj = br.com.javamagazine.domain.Author.findAuthor(id);        
        org.junit.Assert.assertNotNull("Find method for 'Author' illegally returned null for id '" + id + "'", obj);        
        boolean modified =  dod.modifyAuthor(obj);        
        java.lang.Integer currentVersion = obj.getVersion();        
        obj.flush();        
        org.junit.Assert.assertTrue("Version for 'Author' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);        
    }    
    
    @Test    
    @Transactional    
    public void AuthorIntegrationTest.testMerge() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());        
        java.lang.Long id = dod.getRandomAuthor().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to provide an identifier", id);        
        br.com.javamagazine.domain.Author obj = br.com.javamagazine.domain.Author.findAuthor(id);        
        org.junit.Assert.assertNotNull("Find method for 'Author' illegally returned null for id '" + id + "'", obj);        
        boolean modified =  dod.modifyAuthor(obj);        
        java.lang.Integer currentVersion = obj.getVersion();        
        obj.merge();        
        obj.flush();        
        org.junit.Assert.assertTrue("Version for 'Author' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);        
    }    
    
    @Test    
    @Transactional    
    public void AuthorIntegrationTest.testPersist() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());        
        br.com.javamagazine.domain.Author obj = dod.getNewTransientAuthor(Integer.MAX_VALUE);        
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to provide a new transient entity", obj);        
        org.junit.Assert.assertNull("Expected 'Author' identifier to be null", obj.getId());        
        obj.persist();        
        obj.flush();        
        org.junit.Assert.assertNotNull("Expected 'Author' identifier to no longer be null", obj.getId());        
    }    
    
    @Test    
    @Transactional    
    public void AuthorIntegrationTest.testRemove() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to initialize correctly", dod.getRandomAuthor());        
        java.lang.Long id = dod.getRandomAuthor().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Author' failed to provide an identifier", id);        
        br.com.javamagazine.domain.Author obj = br.com.javamagazine.domain.Author.findAuthor(id);        
        org.junit.Assert.assertNotNull("Find method for 'Author' illegally returned null for id '" + id + "'", obj);        
        obj.remove();        
        org.junit.Assert.assertNull("Failed to remove 'Author' with identifier '" + id + "'", br.com.javamagazine.domain.Author.findAuthor(id));        
    }    
    
}
