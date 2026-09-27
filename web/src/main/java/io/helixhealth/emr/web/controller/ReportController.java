package io.helixhealth.emr.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reports")
public class ReportController {

    @GetMapping({"", "/"})
    public String reportList(Model model) {
        model.addAttribute("pageTitle", "Reports – HelixEMR");
        model.addAttribute("activePage", "reports");
        return "report/reportList";
    }
}
