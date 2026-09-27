/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.api;

import io.helixhealth.emr.person.Person;
import java.util.List;

/** Service interface for person management. */
public interface PersonService {

    Person savePerson(Person person);

    Person getPerson(Integer personId);

    Person getPersonByUuid(String uuid);

    List<Person> getPeople(String searchPhrase, Boolean dead);

    void voidPerson(Person person, String reason);

    void unvoidPerson(Person person);

    void purgePerson(Person person);
}
