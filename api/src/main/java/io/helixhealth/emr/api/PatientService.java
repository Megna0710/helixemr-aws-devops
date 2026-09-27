/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api;

import io.helixhealth.emr.patient.Patient;
import java.util.List;

/** Service interface for patient management operations in HelixEMR. */
public interface PatientService {

    Patient savePatient(Patient patient);

    Patient getPatient(Integer patientId);

    Patient getPatientByUuid(String uuid);

    Patient getPatientByMedicalRecordNumber(String medicalRecordNumber);

    List<Patient> getAllPatients();

    List<Patient> getAllPatients(boolean includeVoided);

    List<Patient> getPatients(String query);

    List<Patient> getPatients(String query, int start, int length);

    long countPatients(String query);

    void voidPatient(Patient patient, String reason);

    void unvoidPatient(Patient patient);

    void purgePatient(Patient patient);
}
