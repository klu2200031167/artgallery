package com.klef.jfsd.springboot.controller;

import com.klef.jfsd.springboot.model.Artist;
import com.klef.jfsd.springboot.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class ArtistController {

    @Autowired
    private ArtistService artistService;

    @GetMapping("/registerArtist")
    public String showArtistRegistrationForm() {
        return "registerArtist"; // JSP for artist registration
    }

    @PostMapping("/registerArtist")
    public String registerArtist(@ModelAttribute Artist artist, Model model) {
        try {
            artistService.registerArtist(artist);
            model.addAttribute("successMessage", "Registration successful!");
            return "artistlogin"; // Redirect to artist login page
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "registerArtist";
        }
    }

    @GetMapping("/artistLogin")
    public String showArtistLoginForm() {
        return "artistLogin"; // JSP for artist login
    }

    @PostMapping("/authenticateArtist")
    public String authenticateArtist(
        @RequestParam String email,
        @RequestParam String password,
        Model model
    ) {
        try {
            Artist artist = artistService.authenticateArtist(email, password);
            model.addAttribute("artist", artist);
            return "artistDashboard"; // Redirect to artist dashboard
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "artistLogin";
        }
    }

}