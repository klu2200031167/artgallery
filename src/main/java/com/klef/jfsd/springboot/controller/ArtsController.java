package com.klef.jfsd.springboot.controller;

import com.klef.jfsd.springboot.model.Arts;
import com.klef.jfsd.springboot.service.ArtsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class ArtsController {

    @Autowired
    private ArtsService artsService;

    // Add Art Page
    @GetMapping("/addArt")
    public String showAddArtForm() {
        return "addart"; // JSP file for adding art
    }

    @PostMapping("/registerArt")
    public String registerArt(@ModelAttribute Arts arts, Model model) {
        try {
            artsService.addArt(arts);
            model.addAttribute("successMessage", "Art added successfully!");
            return "artDashboard"; // Redirect to arts dashboard
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "addart";
        }
    }

    // View Art Details
    @GetMapping("/viewArts")
    public String viewArts(Model model) {
        model.addAttribute("artsList", artsService.getAllArts());
        return "viewArts"; // JSP file for viewing arts
    }
}