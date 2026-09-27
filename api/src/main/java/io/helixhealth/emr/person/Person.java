/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.person;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import java.time.LocalDate;

/** Base class for any person record in the HelixEMR system. */
@MappedSuperclass
public class Person {

    @Column(name = "gender", length = 50)
    private String gender;

    @Column(name = "birthdate")
    private LocalDate birthdate;

    @Column(name = "birthdate_estimated")
    private Boolean birthdateEstimated = false;

    @Column(name = "dead", nullable = false)
    private Boolean dead = false;

    @Column(name = "death_date")
    private LocalDate deathDate;

    @Column(name = "cause_of_death")
    private Integer causeOfDeath;

    @Column(name = "death_date_estimated")
    private Boolean deathDateEstimated = false;

    public Person() {}

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public LocalDate getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(LocalDate birthdate) {
        this.birthdate = birthdate;
    }

    public Boolean getBirthdateEstimated() {
        return birthdateEstimated;
    }

    public void setBirthdateEstimated(Boolean birthdateEstimated) {
        this.birthdateEstimated = birthdateEstimated;
    }

    public Boolean getDead() {
        return dead;
    }

    public void setDead(Boolean dead) {
        this.dead = dead;
    }

    public LocalDate getDeathDate() {
        return deathDate;
    }

    public void setDeathDate(LocalDate deathDate) {
        this.deathDate = deathDate;
    }

    public Integer getCauseOfDeath() {
        return causeOfDeath;
    }

    public void setCauseOfDeath(Integer causeOfDeath) {
        this.causeOfDeath = causeOfDeath;
    }

    public Boolean getDeathDateEstimated() {
        return deathDateEstimated;
    }

    public void setDeathDateEstimated(Boolean deathDateEstimated) {
        this.deathDateEstimated = deathDateEstimated;
    }
}
