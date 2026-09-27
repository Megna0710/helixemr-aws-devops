package io.helixhealth.emr.patient;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

/** Patient record — stored in helix_patient_simple (standalone, no person FK). */
@Entity
@Table(name = "helix_patient_simple")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "patient_id")
    private Integer patientId;

    @Column(name = "uuid", unique = true, nullable = false, length = 38)
    private String uuid = UUID.randomUUID().toString();

    @Column(name = "medical_record_number", unique = true, length = 50)
    private String medicalRecordNumber;

    @Column(name = "given_name", length = 100)
    private String givenName;

    @Column(name = "family_name", length = 100)
    private String familyName;

    @Column(name = "gender", length = 10)
    private String gender;

    @Column(name = "birthdate")
    private LocalDate birthdate;

    @Column(name = "birthdate_estimated")
    private Boolean birthdateEstimated = false;

    @Column(name = "dead", nullable = false)
    private Boolean dead = false;

    @Column(name = "allergy_status", length = 50)
    private String allergyStatus;

    @Column(name = "voided", nullable = false)
    private Boolean voided = false;

    @Column(name = "void_reason", length = 255)
    private String voidReason;

    @Column(name = "voided_by")
    private Integer voidedBy;

    @Column(name = "date_voided")
    private LocalDateTime dateVoided;

    @Column(name = "date_created", nullable = false)
    private LocalDateTime dateCreated = LocalDateTime.now();

    @Column(name = "date_changed")
    private LocalDateTime dateChanged;

    public Patient() {}

    public Patient(Integer patientId) {
        this.patientId = patientId;
    }

    // ── Getters / Setters ──────────────────────────────────────────

    public Integer getPatientId()                        { return patientId; }
    public void    setPatientId(Integer v)               { this.patientId = v; }

    public String  getUuid()                             { return uuid; }
    public void    setUuid(String v)                     { this.uuid = v; }

    public String  getMedicalRecordNumber()              { return medicalRecordNumber; }
    public void    setMedicalRecordNumber(String v)      { this.medicalRecordNumber = v; }

    public String  getGivenName()                        { return givenName; }
    public void    setGivenName(String v)                { this.givenName = v; }

    public String  getFamilyName()                       { return familyName; }
    public void    setFamilyName(String v)               { this.familyName = v; }

    public String  getGender()                           { return gender; }
    public void    setGender(String v)                   { this.gender = v; }

    public LocalDate getBirthdate()                      { return birthdate; }
    public void      setBirthdate(LocalDate v)           { this.birthdate = v; }

    public Boolean getBirthdateEstimated()               { return birthdateEstimated; }
    public void    setBirthdateEstimated(Boolean v)      { this.birthdateEstimated = v; }

    public Boolean getDead()                             { return dead; }
    public void    setDead(Boolean v)                    { this.dead = v; }

    public String  getAllergyStatus()                    { return allergyStatus; }
    public void    setAllergyStatus(String v)            { this.allergyStatus = v; }

    public Boolean getVoided()                           { return voided; }
    public void    setVoided(Boolean v)                  { this.voided = v; }

    public String  getVoidReason()                       { return voidReason; }
    public void    setVoidReason(String v)               { this.voidReason = v; }

    public Integer getVoidedBy()                         { return voidedBy; }
    public void    setVoidedBy(Integer v)                { this.voidedBy = v; }

    public LocalDateTime getDateVoided()                 { return dateVoided; }
    public void          setDateVoided(LocalDateTime v)  { this.dateVoided = v; }

    public LocalDateTime getDateCreated()                { return dateCreated; }
    public void          setDateCreated(LocalDateTime v) { this.dateCreated = v; }

    public LocalDateTime getDateChanged()                { return dateChanged; }
    public void          setDateChanged(LocalDateTime v) { this.dateChanged = v; }

    public String getDisplayName() {
        String name = (givenName != null ? givenName : "") + (familyName != null ? " " + familyName : "");
        return name.isBlank() ? (medicalRecordNumber != null ? medicalRecordNumber : "Patient#" + patientId) : name.trim();
    }

    @Override
    public String toString() {
        return "Patient[id=" + patientId + ", mrn=" + medicalRecordNumber + "]";
    }
}
