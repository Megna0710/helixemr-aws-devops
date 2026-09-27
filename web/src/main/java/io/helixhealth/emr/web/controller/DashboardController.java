/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.web.controller;

import io.helixhealth.emr.api.context.Context;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.time.LocalDate;

/** HelixEMR main dashboard controller. */
@Controller
@RequestMapping("")
public class DashboardController {

    @GetMapping({"/", "/dashboard"})
    public String dashboard(Model model) {
        long totalPatients = 0;
        try {
            totalPatients = Context.getPatientService().getAllPatients().size();
        } catch (Exception ignored) {
            // service may not be initialized in embedded mode
        }

        model.addAttribute("pageTitle", "Dashboard – HelixEMR");
        model.addAttribute("totalPatients", totalPatients);
        model.addAttribute("today", LocalDate.now());
        model.addAttribute("applicationName", "HelixEMR");
        model.addAttribute("vendorName", "Helix Health");
        return "dashboard/index";
    }

    @GetMapping("/health/alive")
    public String healthAlive(Model model) {
        model.addAttribute("status", "UP");
        model.addAttribute("application", "HelixEMR");
        model.addAttribute("version", "1.0.0");
        return "health/alive";
    }

    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("pageTitle", "Sign In – HelixEMR");
        model.addAttribute("applicationName", "HelixEMR");
        return "auth/login";
    }
}
