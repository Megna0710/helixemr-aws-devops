/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.web.controller;

import io.helixhealth.emr.api.PatientService;
import io.helixhealth.emr.api.context.Context;
import io.helixhealth.emr.patient.Patient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

/** MVC controller for patient management views and REST endpoints in HelixEMR. */
@Controller
@RequestMapping("/patients")
public class PatientController {

    private static final Logger log = LoggerFactory.getLogger(PatientController.class);

    private PatientService patientService() {
        return Context.getPatientService();
    }

    @GetMapping
    public String patientList(
            @RequestParam(value = "q", required = false) String query,
            @RequestParam(value = "start", defaultValue = "0") int start,
            @RequestParam(value = "size", defaultValue = "25") int size,
            Model model) {
        List<Patient> patients = new java.util.ArrayList<>();
        long total = 0;
        try {
            if (query != null && !query.isBlank()) {
                patients = patientService().getPatients(query, start, size);
                total = patientService().countPatients(query);
            } else {
                patients = patientService().getAllPatients();
                total = patients.size();
            }
        } catch (Exception ignored) {
            // service not fully initialised yet
        }
        model.addAttribute("patients", patients);
        model.addAttribute("query", query);
        model.addAttribute("total", total);
        model.addAttribute("start", start);
        model.addAttribute("size", size);
        model.addAttribute("pageTitle", "Patients – HelixEMR");
        return "patient/patientList";
    }

    @GetMapping("/{patientId}")
    public String patientDashboard(@PathVariable("patientId") Integer patientId, Model model) {
        Patient patient = patientService().getPatient(patientId);
        if (patient == null) {
            return "redirect:/patients?error=notfound";
        }
        model.addAttribute("patient", patient);
        model.addAttribute("pageTitle", "Patient Dashboard – HelixEMR");
        return "patient/patientDashboard";
    }

    @GetMapping("/add")
    public String addPatientForm(Model model) {
        model.addAttribute("patient", new Patient());
        model.addAttribute("pageTitle", "Add Patient – HelixEMR");
        return "patient/editPatient";
    }

    @PostMapping("/save")
    public String savePatient(@ModelAttribute Patient patient, Model model) {
        try {
            patientService().savePatient(patient);
            log.info("Patient saved via web: {}", patient.getMedicalRecordNumber());
            if (patient.getPatientId() != null) {
                return "redirect:/patients/" + patient.getPatientId();
            }
        } catch (Exception e) {
            log.error("Failed to save patient", e);
            model.addAttribute("error", "Could not save patient: " + e.getMessage());
            model.addAttribute("pageTitle", "Register Patient – HelixEMR");
            return "patient/editPatient";
        }
        return "redirect:/patients";
    }

}
