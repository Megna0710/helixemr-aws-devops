package io.helixhealth.emr.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/visits")
public class VisitController {

    @GetMapping({"", "/"})
    public String visitList(Model model) {
        model.addAttribute("pageTitle", "Active Visits – HelixEMR");
        model.addAttribute("activePage", "visits");
        return "visit/visitList";
    }
}
