/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.web.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/** Handles application error pages referenced in web.xml error-page declarations. */
@Controller
@RequestMapping("/error")
public class ErrorController {

    @GetMapping("/404")
    public String notFound(HttpServletRequest request, Model model) {
        model.addAttribute("pageTitle", "Page Not Found – HelixEMR");
        model.addAttribute("errorCode", 404);
        model.addAttribute("errorMessage", "The page you requested could not be found.");
        model.addAttribute("requestUri", request.getAttribute("jakarta.servlet.error.request_uri"));
        return "error/error";
    }

    @GetMapping("/500")
    public String serverError(HttpServletRequest request, Model model) {
        model.addAttribute("pageTitle", "Server Error – HelixEMR");
        model.addAttribute("errorCode", 500);
        model.addAttribute("errorMessage", "An unexpected error occurred. Please try again.");
        Throwable cause = (Throwable) request.getAttribute("jakarta.servlet.error.exception");
        if (cause != null) {
            model.addAttribute("errorDetail", cause.getMessage());
        }
        return "error/error";
    }
}
