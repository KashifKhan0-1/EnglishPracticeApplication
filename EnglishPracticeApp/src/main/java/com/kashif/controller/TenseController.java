package com.kashif.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TenseController {

	@GetMapping("/tenses/details")
    public String showTenses(@RequestParam("mainTense") String mainTense, Model model) {
        model.addAttribute("mainTense", mainTense);
        return "tenses"; // resolves to /WEB-INF/views/tenses.jsp
    }
}
