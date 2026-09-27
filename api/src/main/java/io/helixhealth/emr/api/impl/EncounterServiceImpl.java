/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api.impl;

import io.helixhealth.emr.api.EncounterService;
import io.helixhealth.emr.encounter.Encounter;
import io.helixhealth.emr.patient.Patient;
import java.time.LocalDateTime;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

/** Default HelixEMR implementation of {@link EncounterService}. */
@Transactional
public class EncounterServiceImpl implements EncounterService {

    private static final Logger log = LoggerFactory.getLogger(EncounterServiceImpl.class);

    @Override
    public Encounter saveEncounter(Encounter encounter) {
        if (encounter == null) {
            throw new IllegalArgumentException("Encounter cannot be null");
        }
        log.debug("Saving encounter: {}", encounter);
        throw new UnsupportedOperationException("EncounterDAO not yet wired");
    }

    @Override
    @Transactional(readOnly = true)
    public Encounter getEncounter(Integer encounterId) {
        throw new UnsupportedOperationException("EncounterDAO not yet wired");
    }

    @Override
    @Transactional(readOnly = true)
    public Encounter getEncounterByUuid(String uuid) {
        throw new UnsupportedOperationException("EncounterDAO not yet wired");
    }

    @Override
    @Transactional(readOnly = true)
    public List<Encounter> getEncountersByPatient(Patient patient) {
        throw new UnsupportedOperationException("EncounterDAO not yet wired");
    }

    @Override
    @Transactional(readOnly = true)
    public List<Encounter> getEncounters(Patient patient, LocalDateTime from, LocalDateTime to) {
        throw new UnsupportedOperationException("EncounterDAO not yet wired");
    }

    @Override
    @Transactional(readOnly = true)
    public List<Encounter> getEncounters(String query) {
        throw new UnsupportedOperationException("EncounterDAO not yet wired");
    }

    @Override
    public void voidEncounter(Encounter encounter, String reason) {
        if (encounter == null) {
            throw new IllegalArgumentException("Encounter cannot be null");
        }
        log.info("Voiding encounter. Reason: {}", reason);
        throw new UnsupportedOperationException("EncounterDAO not yet wired");
    }

    @Override
    public void unvoidEncounter(Encounter encounter) {
        if (encounter == null) {
            throw new IllegalArgumentException("Encounter cannot be null");
        }
        throw new UnsupportedOperationException("EncounterDAO not yet wired");
    }

    @Override
    public void purgeEncounter(Encounter encounter) {
        if (encounter == null) {
            throw new IllegalArgumentException("Encounter cannot be null");
        }
        log.warn("Purging encounter permanently");
        throw new UnsupportedOperationException("EncounterDAO not yet wired");
    }
}
