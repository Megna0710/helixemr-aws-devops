/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api.impl;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

import io.helixhealth.emr.api.db.PatientDAO;
import io.helixhealth.emr.patient.Patient;
import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/**
 * Unit tests for {@link PatientServiceImpl}.
 *
 * <p>All DAO calls are mocked; no database required.
 */
@ExtendWith(MockitoExtension.class)
@DisplayName("PatientServiceImpl")
class PatientServiceImplTest {

    @Mock private PatientDAO patientDao;

    private PatientServiceImpl service;

    @BeforeEach
    void setUp() {
        service = new PatientServiceImpl();
        service.setPatientDao(patientDao);
    }

    // ----------------------------------------------------------------
    //  savePatient
    // ----------------------------------------------------------------

    @Nested
    @DisplayName("savePatient()")
    class SavePatient {

        @Test
        @DisplayName("persists and returns saved patient")
        void savesPatient() {
            Patient patient = newPatient("MRN-001");
            when(patientDao.saveOrUpdate(patient)).thenReturn(patient);

            Patient saved = service.savePatient(patient);

            assertThat(saved).isSameAs(patient);
            verify(patientDao).saveOrUpdate(patient);
        }

        @Test
        @DisplayName("throws IllegalArgumentException when patient is null")
        void throwsOnNullPatient() {
            assertThatThrownBy(() -> service.savePatient(null))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("cannot be null");
        }
    }

    // ----------------------------------------------------------------
    //  getPatient
    // ----------------------------------------------------------------

    @Nested
    @DisplayName("getPatient()")
    class GetPatient {

        @Test
        @DisplayName("returns patient for valid ID")
        void returnsPatient() {
            Patient patient = newPatient("MRN-002");
            patient.setPatientId(42);
            when(patientDao.getPatient(42)).thenReturn(patient);

            Patient result = service.getPatient(42);

            assertThat(result).isNotNull();
            assertThat(result.getMedicalRecordNumber()).isEqualTo("MRN-002");
        }

        @Test
        @DisplayName("returns null for null ID without hitting DAO")
        void returnsNullForNullId() {
            Patient result = service.getPatient(null);

            assertThat(result).isNull();
            verifyNoInteractions(patientDao);
        }
    }

    // ----------------------------------------------------------------
    //  getPatientByUuid
    // ----------------------------------------------------------------

    @Nested
    @DisplayName("getPatientByUuid()")
    class GetPatientByUuid {

        @Test
        @DisplayName("returns patient for valid UUID")
        void returnsPatient() {
            String uuid = UUID.randomUUID().toString();
            Patient patient = newPatient("MRN-003");
            when(patientDao.getPatientByUuid(uuid)).thenReturn(patient);

            Patient result = service.getPatientByUuid(uuid);

            assertThat(result).isSameAs(patient);
        }

        @Test
        @DisplayName("returns null for blank UUID")
        void returnsNullForBlank() {
            assertThat(service.getPatientByUuid("  ")).isNull();
            assertThat(service.getPatientByUuid(null)).isNull();
            verifyNoInteractions(patientDao);
        }
    }

    // ----------------------------------------------------------------
    //  getAllPatients
    // ----------------------------------------------------------------

    @Nested
    @DisplayName("getAllPatients()")
    class GetAllPatients {

        @Test
        @DisplayName("returns non-voided patients by default")
        void returnsActivePatients() {
            Patient p1 = newPatient("MRN-010");
            Patient p2 = newPatient("MRN-011");
            when(patientDao.getAllPatients(false)).thenReturn(List.of(p1, p2));

            List<Patient> results = service.getAllPatients();

            assertThat(results).hasSize(2);
            verify(patientDao).getAllPatients(false);
        }

        @Test
        @DisplayName("includes voided patients when flag is true")
        void includesVoidedWhenRequested() {
            when(patientDao.getAllPatients(true)).thenReturn(List.of());

            service.getAllPatients(true);

            verify(patientDao).getAllPatients(true);
        }
    }

    // ----------------------------------------------------------------
    //  getPatients (search)
    // ----------------------------------------------------------------

    @Nested
    @DisplayName("getPatients(query)")
    class SearchPatients {

        @Test
        @DisplayName("delegates to DAO with correct parameters")
        void delegatesToDao() {
            when(patientDao.getPatients(eq("John"), eq(0), eq(Integer.MAX_VALUE)))
                    .thenReturn(List.of());

            service.getPatients("John");

            verify(patientDao).getPatients("John", 0, Integer.MAX_VALUE);
        }

        @Test
        @DisplayName("passes start and length through for paginated search")
        void paginatedSearch() {
            when(patientDao.getPatients("Jane", 10, 25)).thenReturn(List.of());

            service.getPatients("Jane", 10, 25);

            verify(patientDao).getPatients("Jane", 10, 25);
        }
    }

    // ----------------------------------------------------------------
    //  voidPatient
    // ----------------------------------------------------------------

    @Nested
    @DisplayName("voidPatient()")
    class VoidPatient {

        @Test
        @DisplayName("marks patient as voided with reason")
        void voidsPatient() {
            Patient patient = newPatient("MRN-020");
            patient.setPatientId(99);
            when(patientDao.saveOrUpdate(patient)).thenReturn(patient);

            service.voidPatient(patient, "Duplicate record");

            assertThat(patient.getVoided()).isTrue();
            assertThat(patient.getVoidReason()).isEqualTo("Duplicate record");
            assertThat(patient.getDateVoided()).isNotNull();
            verify(patientDao).saveOrUpdate(patient);
        }

        @Test
        @DisplayName("throws IllegalArgumentException for null patient")
        void throwsForNull() {
            assertThatThrownBy(() -> service.voidPatient(null, "test"))
                    .isInstanceOf(IllegalArgumentException.class);
        }
    }

    // ----------------------------------------------------------------
    //  unvoidPatient
    // ----------------------------------------------------------------

    @Nested
    @DisplayName("unvoidPatient()")
    class UnvoidPatient {

        @Test
        @DisplayName("clears voided flag and related fields")
        void unvoidsPatient() {
            Patient patient = newPatient("MRN-021");
            patient.setVoided(true);
            patient.setVoidReason("test");
            patient.setVoidedBy(1);
            when(patientDao.saveOrUpdate(patient)).thenReturn(patient);

            service.unvoidPatient(patient);

            assertThat(patient.getVoided()).isFalse();
            assertThat(patient.getVoidReason()).isNull();
            assertThat(patient.getVoidedBy()).isNull();
            assertThat(patient.getDateVoided()).isNull();
        }
    }

    // ----------------------------------------------------------------
    //  purgePatient
    // ----------------------------------------------------------------

    @Nested
    @DisplayName("purgePatient()")
    class PurgePatient {

        @Test
        @DisplayName("calls DAO delete")
        void deletesFromDatabase() {
            Patient patient = newPatient("MRN-030");

            service.purgePatient(patient);

            verify(patientDao).delete(patient);
        }

        @Test
        @DisplayName("throws for null patient")
        void throwsForNull() {
            assertThatThrownBy(() -> service.purgePatient(null))
                    .isInstanceOf(IllegalArgumentException.class);
        }
    }

    // ----------------------------------------------------------------
    //  Helpers
    // ----------------------------------------------------------------

    private Patient newPatient(String mrn) {
        Patient p = new Patient();
        p.setMedicalRecordNumber(mrn);
        return p;
    }
}
