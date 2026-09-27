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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Central registry for all HelixEMR services.
 *
 * <p>Provides a singleton access point to all platform services. Application code should obtain
 * services via {@link Context} rather than using this class directly.
 */
public class ServiceContext {

    private static final Logger log = LoggerFactory.getLogger(ServiceContext.class);

    private static ServiceContext instance;

    private PatientService patientService;
    private PersonService personService;
    private ConceptService conceptService;
    private EncounterService encounterService;
    private ObsService obsService;
    private OrderService orderService;
    private UserService userService;
    private LocationService locationService;
    private VisitService visitService;
    private ProviderService providerService;
    private ConditionService conditionService;
    private DiagnosisService diagnosisService;
    private MedicationDispenseService medicationDispenseService;
    private CohortService cohortService;
    private FormService formService;
    private ProgramWorkflowService programWorkflowService;
    private AdministrationService administrationService;
    private SchedulerService schedulerService;
    private NotificationService notificationService;
    private ReportingService reportingService;

    private ServiceContext() {}

    public static ServiceContext getInstance() {
        if (instance == null) {
            synchronized (ServiceContext.class) {
                if (instance == null) {
                    instance = new ServiceContext();
                    log.info("HelixEMR ServiceContext initialized");
                }
            }
        }
        return instance;
    }

    /** Destroy singleton — for testing and graceful shutdown only. */
    public static void destroyInstance() {
        instance = null;
    }

    // ----------------------------------------------------------------
    //  Getters / Setters
    // ----------------------------------------------------------------

    public PatientService getPatientService() {
        return patientService;
    }

    public void setPatientService(PatientService patientService) {
        this.patientService = patientService;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public ConceptService getConceptService() {
        return conceptService;
    }

    public void setConceptService(ConceptService conceptService) {
        this.conceptService = conceptService;
    }

    public EncounterService getEncounterService() {
        return encounterService;
    }

    public void setEncounterService(EncounterService encounterService) {
        this.encounterService = encounterService;
    }

    public ObsService getObsService() {
        return obsService;
    }

    public void setObsService(ObsService obsService) {
        this.obsService = obsService;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public LocationService getLocationService() {
        return locationService;
    }

    public void setLocationService(LocationService locationService) {
        this.locationService = locationService;
    }

    public VisitService getVisitService() {
        return visitService;
    }

    public void setVisitService(VisitService visitService) {
        this.visitService = visitService;
    }

    public ProviderService getProviderService() {
        return providerService;
    }

    public void setProviderService(ProviderService providerService) {
        this.providerService = providerService;
    }

    public ConditionService getConditionService() {
        return conditionService;
    }

    public void setConditionService(ConditionService conditionService) {
        this.conditionService = conditionService;
    }

    public DiagnosisService getDiagnosisService() {
        return diagnosisService;
    }

    public void setDiagnosisService(DiagnosisService diagnosisService) {
        this.diagnosisService = diagnosisService;
    }

    public MedicationDispenseService getMedicationDispenseService() {
        return medicationDispenseService;
    }

    public void setMedicationDispenseService(MedicationDispenseService medicationDispenseService) {
        this.medicationDispenseService = medicationDispenseService;
    }

    public CohortService getCohortService() {
        return cohortService;
    }

    public void setCohortService(CohortService cohortService) {
        this.cohortService = cohortService;
    }

    public FormService getFormService() {
        return formService;
    }

    public void setFormService(FormService formService) {
        this.formService = formService;
    }

    public ProgramWorkflowService getProgramWorkflowService() {
        return programWorkflowService;
    }

    public void setProgramWorkflowService(ProgramWorkflowService programWorkflowService) {
        this.programWorkflowService = programWorkflowService;
    }

    public AdministrationService getAdministrationService() {
        return administrationService;
    }

    public void setAdministrationService(AdministrationService administrationService) {
        this.administrationService = administrationService;
    }

    public SchedulerService getSchedulerService() {
        return schedulerService;
    }

    public void setSchedulerService(SchedulerService schedulerService) {
        this.schedulerService = schedulerService;
    }

    public NotificationService getNotificationService() {
        return notificationService;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public ReportingService getReportingService() {
        return reportingService;
    }

    public void setReportingService(ReportingService reportingService) {
        this.reportingService = reportingService;
    }
}
