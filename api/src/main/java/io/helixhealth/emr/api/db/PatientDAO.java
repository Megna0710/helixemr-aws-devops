/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api.db;

import io.helixhealth.emr.patient.Patient;
import java.util.List;

/** DAO interface for patient persistence operations. */
public interface PatientDAO {

    Patient saveOrUpdate(Patient patient);

    Patient getPatient(Integer patientId);

    Patient getPatientByUuid(String uuid);

    Patient getPatientByMedicalRecordNumber(String medicalRecordNumber);

    List<Patient> getAllPatients(boolean includeVoided);

    List<Patient> getPatients(String query, int start, int length);

    long countPatients(String query);

    void delete(Patient patient);
}
