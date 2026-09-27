/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api;

import io.helixhealth.emr.encounter.Encounter;
import io.helixhealth.emr.patient.Patient;
import java.time.LocalDateTime;
import java.util.List;

/** Service interface for clinical encounter management. */
public interface EncounterService {

    Encounter saveEncounter(Encounter encounter);

    Encounter getEncounter(Integer encounterId);

    Encounter getEncounterByUuid(String uuid);

    List<Encounter> getEncountersByPatient(Patient patient);

    List<Encounter> getEncounters(Patient patient, LocalDateTime from, LocalDateTime to);

    List<Encounter> getEncounters(String query);

    void voidEncounter(Encounter encounter, String reason);

    void unvoidEncounter(Encounter encounter);

    void purgeEncounter(Encounter encounter);
}
