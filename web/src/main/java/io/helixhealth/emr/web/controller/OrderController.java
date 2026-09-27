package io.helixhealth.emr.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @GetMapping({"", "/"})
    public String orderList(Model model) {
        model.addAttribute("pageTitle", "Orders – HelixEMR");
        model.addAttribute("activePage", "orders");
        return "order/orderList";
    }
}
