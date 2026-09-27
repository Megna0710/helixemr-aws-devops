/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api.context;

import io.helixhealth.emr.api.AdministrationService;
import io.helixhealth.emr.api.CohortService;
import io.helixhealth.emr.api.ConceptService;
import io.helixhealth.emr.api.ConditionService;
import io.helixhealth.emr.api.DiagnosisService;
import io.helixhealth.emr.api.EncounterService;
import io.helixhealth.emr.api.FormService;
import io.helixhealth.emr.api.LocationService;
import io.helixhealth.emr.api.MedicationDispenseService;
import io.helixhealth.emr.api.NotificationService;
import io.helixhealth.emr.api.ObsService;
import io.helixhealth.emr.api.OrderService;
import io.helixhealth.emr.api.PatientService;
import io.helixhealth.emr.api.PersonService;
import io.helixhealth.emr.api.ProgramWorkflowService;
import io.helixhealth.emr.api.ProviderService;
import io.helixhealth.emr.api.ReportingService;
import io.helixhealth.emr.api.SchedulerService;
import io.helixhealth.emr.api.UserService;
import io.helixhealth.emr.api.VisitService;

/**
 * Static facade for accessing HelixEMR services.
 *
 * <p>Primary entry point for application code to retrieve services. Thread-safety is delegated to
 * the underlying {@link ServiceContext}.
 *
 * <pre>{@code
 * Patient p = Context.getPatientService().getPatient(id);
 * }</pre>
 */
public class Context {

    private Context() {}

    private static ServiceContext ctx() {
        return ServiceContext.getInstance();
    }

    public static PatientService getPatientService() {
        return ctx().getPatientService();
    }

    public static PersonService getPersonService() {
        return ctx().getPersonService();
    }

    public static ConceptService getConceptService() {
        return ctx().getConceptService();
    }

    public static EncounterService getEncounterService() {
        return ctx().getEncounterService();
    }

    public static ObsService getObsService() {
        return ctx().getObsService();
    }

    public static OrderService getOrderService() {
        return ctx().getOrderService();
    }

    public static UserService getUserService() {
        return ctx().getUserService();
    }

    public static LocationService getLocationService() {
        return ctx().getLocationService();
    }

    public static VisitService getVisitService() {
        return ctx().getVisitService();
    }

    public static ProviderService getProviderService() {
        return ctx().getProviderService();
    }

    public static ConditionService getConditionService() {
        return ctx().getConditionService();
    }

    public static DiagnosisService getDiagnosisService() {
        return ctx().getDiagnosisService();
    }

    public static MedicationDispenseService getMedicationDispenseService() {
        return ctx().getMedicationDispenseService();
    }

    public static CohortService getCohortService() {
        return ctx().getCohortService();
    }

    public static FormService getFormService() {
        return ctx().getFormService();
    }

    public static ProgramWorkflowService getProgramWorkflowService() {
        return ctx().getProgramWorkflowService();
    }

    public static AdministrationService getAdministrationService() {
        return ctx().getAdministrationService();
    }

    public static SchedulerService getSchedulerService() {
        return ctx().getSchedulerService();
    }

    public static NotificationService getNotificationService() {
        return ctx().getNotificationService();
    }

    public static ReportingService getReportingService() {
        return ctx().getReportingService();
    }
}
