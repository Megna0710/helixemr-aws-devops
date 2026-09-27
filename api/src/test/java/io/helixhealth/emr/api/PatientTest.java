/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api;

import static org.assertj.core.api.Assertions.assertThat;

import io.helixhealth.emr.patient.Patient;
import java.time.LocalDate;
import java.util.UUID;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

@DisplayName("Patient domain model")
class PatientTest {

    @Test
    @DisplayName("default values are applied on construction")
    void defaultValues() {
        Patient p = new Patient();

        assertThat(p.getVoided()).isFalse();
        assertThat(p.getDateCreated()).isNotNull();
        assertThat(p.getUuid()).isNotBlank();
        assertThat(p.getDead()).isFalse();
    }

    @Test
    @DisplayName("UUID is unique per instance")
    void uuidIsUnique() {
        Patient p1 = new Patient();
        Patient p2 = new Patient();

        assertThat(p1.getUuid()).isNotEqualTo(p2.getUuid());
    }

    @Test
    @DisplayName("constructor with ID sets patientId")
    void idConstructor() {
        Patient p = new Patient(42);
        assertThat(p.getPatientId()).isEqualTo(42);
    }

    @Test
    @DisplayName("toString includes ID and MRN")
    void toStringFormat() {
        Patient p = new Patient(7);
        p.setMedicalRecordNumber("HX-00042");

        String s = p.toString();

        assertThat(s).contains("7").contains("HX-00042");
    }

    @Test
    @DisplayName("person fields are settable via inherited setters")
    void personFields() {
        Patient p = new Patient();
        p.setGender("M");
        p.setBirthdate(LocalDate.of(1990, 5, 15));
        p.setBirthdateEstimated(false);

        assertThat(p.getGender()).isEqualTo("M");
        assertThat(p.getBirthdate()).isEqualTo(LocalDate.of(1990, 5, 15));
        assertThat(p.getBirthdateEstimated()).isFalse();
    }

    @Test
    @DisplayName("explicit UUID can be set")
    void explicitUuid() {
        String uuid = UUID.randomUUID().toString();
        Patient p = new Patient();
        p.setUuid(uuid);

        assertThat(p.getUuid()).isEqualTo(uuid);
    }
}
