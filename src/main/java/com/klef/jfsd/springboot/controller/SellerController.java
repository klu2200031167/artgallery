package com.klef.jfsd.springboot.controller;

import com.klef.jfsd.springboot.model.Seller;
import com.klef.jfsd.springboot.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SellerController {

    @Autowired
    private SellerService sellerService;

    @GetMapping("/sellerRegister")
    public String showSellerRegistrationForm() {
        return "sellerRegister"; // JSP file for seller registration
    }

    @PostMapping("/registerSeller")
    public String registerSeller(@ModelAttribute Seller seller, Model model) {
        try {
            seller.setSellerstatus(true); // Correct method to set status
            sellerService.registerSeller(seller);
            model.addAttribute("successMessage", "Seller registration successful!");
            return "sellerLogin"; // Redirect to seller login page
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "sellerRegister";
        }
    }

    @GetMapping("/sellerLogin")
    public String showSellerLoginForm() {
        return "sellerLogin"; // JSP file for seller login
    }

    @PostMapping("/authenticateSeller")
    public String authenticateSeller(
        @RequestParam String email,
        @RequestParam String password,
        Model model
    ) {
        try {
            Seller seller = sellerService.authenticateSeller(email, password);
            model.addAttribute("seller", seller);
            return "sellerDashboard"; // Redirect to seller dashboard
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "sellerLogin";
        }
    }
}
