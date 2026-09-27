/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.encounter;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import java.util.UUID;

/** Represents a clinical encounter in HelixEMR. */
@Entity
@Table(name = "helix_encounter")
public class Encounter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "encounter_id")
    private Integer encounterId;

    @Column(name = "uuid", unique = true, nullable = false, length = 38)
    private String uuid = UUID.randomUUID().toString();

    @Column(name = "patient_id", nullable = false)
    private Integer patientId;

    @Column(name = "encounter_type")
    private Integer encounterType;

    @Column(name = "encounter_datetime", nullable = false)
    private LocalDateTime encounterDatetime;

    @Column(name = "location_id")
    private Integer locationId;

    @Column(name = "provider_id")
    private Integer providerId;

    @Column(name = "visit_id")
    private Integer visitId;

    @Column(name = "form_id")
    private Integer formId;

    @Column(name = "voided", nullable = false)
    private Boolean voided = false;

    @Column(name = "voided_by")
    private Integer voidedBy;

    @Column(name = "date_voided")
    private LocalDateTime dateVoided;

    @Column(name = "void_reason", length = 255)
    private String voidReason;

    @Column(name = "date_created", nullable = false)
    private LocalDateTime dateCreated = LocalDateTime.now();

    @Column(name = "creator")
    private Integer creator;

    @Column(name = "date_changed")
    private LocalDateTime dateChanged;

    @Column(name = "changed_by")
    private Integer changedBy;

    public Encounter() {}

    public Integer getEncounterId() {
        return encounterId;
    }

    public void setEncounterId(Integer encounterId) {
        this.encounterId = encounterId;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public Integer getEncounterType() {
        return encounterType;
    }

    public void setEncounterType(Integer encounterType) {
        this.encounterType = encounterType;
    }

    public LocalDateTime getEncounterDatetime() {
        return encounterDatetime;
    }

    public void setEncounterDatetime(LocalDateTime encounterDatetime) {
        this.encounterDatetime = encounterDatetime;
    }

    public Integer getLocationId() {
        return locationId;
    }

    public void setLocationId(Integer locationId) {
        this.locationId = locationId;
    }

    public Integer getProviderId() {
        return providerId;
    }

    public void setProviderId(Integer providerId) {
        this.providerId = providerId;
    }

    public Integer getVisitId() {
        return visitId;
    }

    public void setVisitId(Integer visitId) {
        this.visitId = visitId;
    }

    public Boolean getVoided() {
        return voided;
    }

    public void setVoided(Boolean voided) {
        this.voided = voided;
    }

    public String getVoidReason() {
        return voidReason;
    }

    public void setVoidReason(String voidReason) {
        this.voidReason = voidReason;
    }

    public LocalDateTime getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(LocalDateTime dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }
}
