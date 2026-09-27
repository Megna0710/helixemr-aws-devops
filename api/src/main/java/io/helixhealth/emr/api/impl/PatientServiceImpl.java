/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api.impl;

import io.helixhealth.emr.api.PatientService;
import io.helixhealth.emr.api.db.PatientDAO;
import io.helixhealth.emr.patient.Patient;
import java.time.LocalDateTime;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

/** Default implementation of {@link PatientService}. */
@Transactional
public class PatientServiceImpl implements PatientService {

    private static final Logger log = LoggerFactory.getLogger(PatientServiceImpl.class);

    private PatientDAO patientDao;

    public void setPatientDao(PatientDAO patientDao) {
        this.patientDao = patientDao;
    }

    @Override
    public Patient savePatient(Patient patient) {
        if (patient == null) {
            throw new IllegalArgumentException("Patient cannot be null");
        }
        log.debug("Saving patient: {}", patient);
        return patientDao.saveOrUpdate(patient);
    }

    @Override
    @Transactional(readOnly = true)
    public Patient getPatient(Integer patientId) {
        if (patientId == null) {
            return null;
        }
        return patientDao.getPatient(patientId);
    }

    @Override
    @Transactional(readOnly = true)
    public Patient getPatientByUuid(String uuid) {
        if (uuid == null || uuid.isBlank()) {
            return null;
        }
        return patientDao.getPatientByUuid(uuid);
    }

    @Override
    @Transactional(readOnly = true)
    public Patient getPatientByMedicalRecordNumber(String medicalRecordNumber) {
        if (medicalRecordNumber == null || medicalRecordNumber.isBlank()) {
            return null;
        }
        return patientDao.getPatientByMedicalRecordNumber(medicalRecordNumber);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Patient> getAllPatients() {
        return patientDao.getAllPatients(false);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Patient> getAllPatients(boolean includeVoided) {
        return patientDao.getAllPatients(includeVoided);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Patient> getPatients(String query) {
        return patientDao.getPatients(query, 0, Integer.MAX_VALUE);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Patient> getPatients(String query, int start, int length) {
        return patientDao.getPatients(query, start, length);
    }

    @Override
    @Transactional(readOnly = true)
    public long countPatients(String query) {
        return patientDao.countPatients(query);
    }

    @Override
    public void voidPatient(Patient patient, String reason) {
        if (patient == null) {
            throw new IllegalArgumentException("Patient cannot be null");
        }
        patient.setVoided(true);
        patient.setVoidReason(reason);
        patient.setDateVoided(LocalDateTime.now());
        patientDao.saveOrUpdate(patient);
        log.info("Patient {} voided. Reason: {}", patient.getPatientId(), reason);
    }

    @Override
    public void unvoidPatient(Patient patient) {
        if (patient == null) {
            throw new IllegalArgumentException("Patient cannot be null");
        }
        patient.setVoided(false);
        patient.setVoidReason(null);
        patient.setDateVoided(null);
        patient.setVoidedBy(null);
        patientDao.saveOrUpdate(patient);
        log.info("Patient {} unvoided", patient.getPatientId());
    }

    @Override
    public void purgePatient(Patient patient) {
        if (patient == null) {
            throw new IllegalArgumentException("Patient cannot be null");
        }
        log.warn("Purging patient {} permanently", patient.getPatientId());
        patientDao.delete(patient);
    }
}
