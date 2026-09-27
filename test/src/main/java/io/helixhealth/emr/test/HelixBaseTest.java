/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.test;

import io.helixhealth.emr.api.context.ServiceContext;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Base class for HelixEMR unit tests.
 *
 * <p>Resets the {@link ServiceContext} singleton before/after each test to prevent state leakage.
 */
public abstract class HelixBaseTest {

    protected final Logger log = LoggerFactory.getLogger(getClass());

    @BeforeEach
    public void setUp() throws Exception {
        ServiceContext.destroyInstance();
        initializeTestContext();
    }

    @AfterEach
    public void tearDown() {
        ServiceContext.destroyInstance();
    }

    /** Override to configure test-specific service wiring. */
    protected void initializeTestContext() throws Exception {}
}
