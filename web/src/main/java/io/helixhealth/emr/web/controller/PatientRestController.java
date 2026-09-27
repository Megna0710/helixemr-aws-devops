/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.web.controller;

import io.helixhealth.emr.api.context.Context;
import io.helixhealth.emr.patient.Patient;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/** REST API endpoints for patient data (JSON). Separate from the MVC PatientController. */
@RestController
@RequestMapping("/api/patients")
public class PatientRestController {

    @GetMapping("/search")
    public ResponseEntity<List<Patient>> searchPatients(
            @RequestParam("q") String query,
            @RequestParam(defaultValue = "0") int start,
            @RequestParam(defaultValue = "25") int size) {
        List<Patient> results = Context.getPatientService().getPatients(query, start, size);
        return ResponseEntity.ok(results);
    }

    @GetMapping("/{patientId}")
    public ResponseEntity<Patient> getPatient(@PathVariable("patientId") Integer patientId) {
        Patient patient = Context.getPatientService().getPatient(patientId);
        if (patient == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(patient);
    }
}
