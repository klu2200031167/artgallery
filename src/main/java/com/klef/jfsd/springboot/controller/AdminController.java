package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
	private JavaMailSender mailSender;

    // Admin Login Page
    @GetMapping("/adminLogin")
    public String showAdminLoginForm() {
        return "adminlogin"; // JSP for admin login
    }

    @PostMapping("sendemail") 
	   public ModelAndView sendEmailbystudent(HttpServletRequest request) throws Exception  
	   { 
	       String name = request.getParameter("name"); 
	       String toemail = request.getParameter("email"); 
	       String subject = request.getParameter("subject"); 
	       String msg = request.getParameter("message"); 
	 
	        MimeMessage mimeMessage = mailSender.createMimeMessage(); 
	        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true); 
	         
	        int otp = (int)(Math.random() * 99999); // random number generation         
	 
	        helper.setTo(toemail); 
	        helper.setSubject(subject); 
	        helper.setFrom("dedeepyapasumarthi3@gmail.com"); 
	 
	        String htmlContent =  
	                   "<h3>Contact Form Details</h3>" + 
	                   "<p><strong>Name:</strong> " + name + "</p>" + 
	                   "<p><strong>Email:</strong> " + toemail + "</p>" + 
	                   "<p><strong>Subject:</strong> " + subject + "</p>" + 
	                   "<p><strong>Message:</strong> " + msg + "</p>" + 
	                   "<p><strong>OTP:</strong> " + otp + "</p>"; 
	 
	 
	           helper.setText(htmlContent, true); 
	           mailSender.send(mimeMessage); 
	          
	           ModelAndView mv = new ModelAndView("mailsuccess"); 
	           mv.addObject("message", "Email Sent Successfully"); 
	 
	           return mv; 
	   }
    @PostMapping("/authenticateAdmin")
    public String authenticateAdmin(
        @RequestParam String username,
        @RequestParam String password,
        Model model
    ) {
        try {
            Admin admin = adminService.authenticateAdmin(username, password);
            model.addAttribute("admin", admin);
            return "adminDashboard"; // Redirect to admin dashboard
        } catch (RuntimeException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "adminlogin";
        }
    }
}
