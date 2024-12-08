package com.klef.jfsd.springboot.controller;

import com.klef.jfsd.springboot.model.CusPayment;
import com.klef.jfsd.springboot.service.CusPaymentService;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CusPaymentController {

    @Autowired
    private CusPaymentService cusPaymentService;

    @PostMapping("/processPayment")
    public String processPayment(@ModelAttribute CusPayment cusPayment, Model model) {
        try {
            // Set the current payment date
            cusPayment.setPaymentDate(LocalDate.now());
            
            // Save the payment to the database
            cusPaymentService.savePayment(cusPayment);

            // Add success message
            model.addAttribute("successMessage", "Payment Successful and Stored in Database");

            // Redirect to success page or show success message
            return "paymentSuccess"; 
        } catch (Exception ex) {
            model.addAttribute("errorMessage", "Error processing payment: " + ex.getMessage());
            return "paymentError"; // Handle error page
        }
    }
}