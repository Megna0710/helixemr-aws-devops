/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api.context;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;

import io.helixhealth.emr.api.PatientService;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

@DisplayName("ServiceContext")
class ServiceContextTest {

    @BeforeEach
    @AfterEach
    void resetSingleton() {
        ServiceContext.destroyInstance();
    }

    @Test
    @DisplayName("getInstance() returns singleton")
    void returnsSingleton() {
        ServiceContext ctx1 = ServiceContext.getInstance();
        ServiceContext ctx2 = ServiceContext.getInstance();

        assertThat(ctx1).isSameAs(ctx2);
    }

    @Test
    @DisplayName("destroyInstance() resets singleton")
    void destroyResetsInstance() {
        ServiceContext ctx1 = ServiceContext.getInstance();
        ServiceContext.destroyInstance();
        ServiceContext ctx2 = ServiceContext.getInstance();

        assertThat(ctx1).isNotSameAs(ctx2);
    }

    @Test
    @DisplayName("setPatientService() stores and returns service")
    void storesPatientService() {
        PatientService mockService = mock(PatientService.class);
        ServiceContext ctx = ServiceContext.getInstance();

        ctx.setPatientService(mockService);

        assertThat(ctx.getPatientService()).isSameAs(mockService);
    }

    @Test
    @DisplayName("Context facade delegates to ServiceContext")
    void contextFacadeWorks() {
        PatientService mockService = mock(PatientService.class);
        ServiceContext.getInstance().setPatientService(mockService);

        assertThat(Context.getPatientService()).isSameAs(mockService);
    }
}
