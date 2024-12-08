package com.klef.jfsd.springboot.controller;

import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    // Registration Page
    @GetMapping("/register")
    public String showRegistrationForm() {
        return "register"; // JSP for registration
    }

    @PostMapping("/registerCustomer")
    public String registerCustomer(@ModelAttribute Customer customer, Model model) {
        try {
            customer.setActive(true); // Set default active status
            customerService.registerCustomer(customer);
            model.addAttribute("successMessage", "Registration successful!");
            return "login"; // Redirect to login page
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "register";
        }
    }

    // Login Page
    @GetMapping("/login")
    public String showLoginForm() {
        return "login"; // JSP for login
    }

    @PostMapping("/authenticateCustomer")
    public String authenticateCustomer(
            @RequestParam String email,
            @RequestParam String password,
            Model model
    ) {
        try {
            Customer customer = customerService.authenticateCustomer(email, password);
            model.addAttribute("customer", customer);
            // Redirect to the dashboard after successful login
            return "customerDashboard"; 
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "login";
        }
    }

    // Profile Page
    @GetMapping("/profile")
    public String showCustomerProfile(@RequestParam("email") String email, Model model) {
        try {
            Customer customer = customerService.findCustomerByEmail(email);
            model.addAttribute("customer", customer);
            return "cusprofile"; // JSP for profile
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "error"; // Error page
        }
    }

    // Paintings Page
    @GetMapping("/paintings")
    public String showPaintingsPage() {
        return "paintings"; // JSP for paintings
    }

    // Dashboard Page
    @GetMapping("/dashboard")
    public String showCustomerDashboard(@RequestParam("email") String email, Model model) {
        try {
            Customer customer = customerService.findCustomerByEmail(email);
            model.addAttribute("customer", customer);
            return "customerDashboard"; // JSP for dashboard
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "error"; // Error page
        }
    }
}