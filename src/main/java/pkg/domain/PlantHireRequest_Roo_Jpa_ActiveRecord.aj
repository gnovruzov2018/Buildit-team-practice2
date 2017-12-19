// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pkg.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pkg.domain.PlantHireRequest;

privileged aspect PlantHireRequest_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PlantHireRequest.entityManager;
    
    public static final List<String> PlantHireRequest.fieldNames4OrderClauseFilter = java.util.Arrays.asList("plantHRef", "status", "siteEngineer", "worksEngineer", "startDate", "endDate");
    
    public static final EntityManager PlantHireRequest.entityManager() {
        EntityManager em = new PlantHireRequest().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PlantHireRequest.countPlantHireRequests() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PlantHireRequest o", Long.class).getSingleResult();
    }
    
    public static List<PlantHireRequest> PlantHireRequest.findAllPlantHireRequests() {
        return entityManager().createQuery("SELECT o FROM PlantHireRequest o", PlantHireRequest.class).getResultList();
    }
    
    public static List<PlantHireRequest> PlantHireRequest.findAllPlantHireRequests(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PlantHireRequest o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PlantHireRequest.class).getResultList();
    }
    
    public static PlantHireRequest PlantHireRequest.findPlantHireRequest(Long id) {
        if (id == null) return null;
        return entityManager().find(PlantHireRequest.class, id);
    }
    
    public static List<PlantHireRequest> PlantHireRequest.findPlantHireRequestEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PlantHireRequest o", PlantHireRequest.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<PlantHireRequest> PlantHireRequest.findPlantHireRequestEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PlantHireRequest o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PlantHireRequest.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PlantHireRequest.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PlantHireRequest.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PlantHireRequest attached = PlantHireRequest.findPlantHireRequest(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PlantHireRequest.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PlantHireRequest.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PlantHireRequest PlantHireRequest.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PlantHireRequest merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
