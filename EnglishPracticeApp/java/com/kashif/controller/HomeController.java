package com.kashif.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    // Landing page (index.jsp)
    @GetMapping("/")
    public String home() {
        return "index";   // maps to /WEB-INF/views/index.jsp
    }

    // Show tenses page (tense.jsp)
    @GetMapping("/tenses")
    public String showTenses(@RequestParam String mainTense, Model model) {
        model.addAttribute("mainTense", mainTense);
        return "tenses";   // maps to /WEB-INF/views/tense.jsp
    }
}
