package io.helixhealth.emr.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/encounters")
public class EncounterController {

    @GetMapping({"", "/"})
    public String encounterList(Model model) {
        model.addAttribute("pageTitle", "Encounters – HelixEMR");
        model.addAttribute("activePage", "encounters");
        return "encounter/encounterList";
    }
}
