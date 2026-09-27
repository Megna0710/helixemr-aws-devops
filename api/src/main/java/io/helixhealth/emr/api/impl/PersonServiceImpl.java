/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api.impl;

import io.helixhealth.emr.api.PersonService;
import io.helixhealth.emr.person.Person;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

/** Default HelixEMR implementation of {@link PersonService}. */
@Transactional
public class PersonServiceImpl implements PersonService {

    private static final Logger log = LoggerFactory.getLogger(PersonServiceImpl.class);

    @Override
    public Person savePerson(Person person) {
        if (person == null) {
            throw new IllegalArgumentException("Person cannot be null");
        }
        log.debug("Saving person: {}", person);
        throw new UnsupportedOperationException("PersonDAO not yet wired");
    }

    @Override
    @Transactional(readOnly = true)
    public Person getPerson(Integer personId) {
        throw new UnsupportedOperationException("PersonDAO not yet wired");
    }

    @Override
    @Transactional(readOnly = true)
    public Person getPersonByUuid(String uuid) {
        throw new UnsupportedOperationException("PersonDAO not yet wired");
    }

    @Override
    @Transactional(readOnly = true)
    public List<Person> getPeople(String searchPhrase, Boolean dead) {
        throw new UnsupportedOperationException("PersonDAO not yet wired");
    }

    @Override
    public void voidPerson(Person person, String reason) {
        if (person == null) {
            throw new IllegalArgumentException("Person cannot be null");
        }
        log.info("Voiding person. Reason: {}", reason);
        throw new UnsupportedOperationException("PersonDAO not yet wired");
    }

    @Override
    public void unvoidPerson(Person person) {
        if (person == null) {
            throw new IllegalArgumentException("Person cannot be null");
        }
        throw new UnsupportedOperationException("PersonDAO not yet wired");
    }

    @Override
    public void purgePerson(Person person) {
        if (person == null) {
            throw new IllegalArgumentException("Person cannot be null");
        }
        log.warn("Purging person permanently");
        throw new UnsupportedOperationException("PersonDAO not yet wired");
    }
}
