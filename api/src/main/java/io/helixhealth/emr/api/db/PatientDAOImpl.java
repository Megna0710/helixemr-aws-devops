package io.helixhealth.emr.api.db;

import io.helixhealth.emr.patient.Patient;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.List;
import org.springframework.stereotype.Repository;

/** JPA implementation of {@link PatientDAO}. */
@Repository
public class PatientDAOImpl implements PatientDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Patient saveOrUpdate(Patient patient) {
        if (patient.getPatientId() == null) {
            em.persist(patient);
            return patient;
        }
        return em.merge(patient);
    }

    @Override
    public Patient getPatient(Integer patientId) {
        return em.find(Patient.class, patientId);
    }

    @Override
    public Patient getPatientByUuid(String uuid) {
        List<Patient> results = em.createQuery(
                "SELECT p FROM Patient p WHERE p.uuid = :uuid", Patient.class)
                .setParameter("uuid", uuid)
                .setMaxResults(1)
                .getResultList();
        return results.isEmpty() ? null : results.get(0);
    }

    @Override
    public Patient getPatientByMedicalRecordNumber(String mrn) {
        List<Patient> results = em.createQuery(
                "SELECT p FROM Patient p WHERE p.medicalRecordNumber = :mrn", Patient.class)
                .setParameter("mrn", mrn)
                .setMaxResults(1)
                .getResultList();
        return results.isEmpty() ? null : results.get(0);
    }

    @Override
    public List<Patient> getAllPatients(boolean includeVoided) {
        String jpql = includeVoided
                ? "SELECT p FROM Patient p ORDER BY p.dateCreated DESC"
                : "SELECT p FROM Patient p WHERE p.voided = false ORDER BY p.dateCreated DESC";
        return em.createQuery(jpql, Patient.class).getResultList();
    }

    @Override
    public List<Patient> getPatients(String query, int start, int length) {
        String q = "%" + query.toLowerCase() + "%";
        TypedQuery<Patient> tq = em.createQuery(
                "SELECT p FROM Patient p WHERE p.voided = false AND "
                + "(LOWER(p.medicalRecordNumber) LIKE :q) "
                + "ORDER BY p.dateCreated DESC", Patient.class)
                .setParameter("q", q)
                .setFirstResult(start)
                .setMaxResults(length);
        return tq.getResultList();
    }

    @Override
    public long countPatients(String query) {
        String q = "%" + query.toLowerCase() + "%";
        return em.createQuery(
                "SELECT COUNT(p) FROM Patient p WHERE p.voided = false AND "
                + "(LOWER(p.medicalRecordNumber) LIKE :q)", Long.class)
                .setParameter("q", q)
                .getSingleResult();
    }

    @Override
    public void delete(Patient patient) {
        Patient managed = em.contains(patient) ? patient : em.merge(patient);
        em.remove(managed);
    }
}
