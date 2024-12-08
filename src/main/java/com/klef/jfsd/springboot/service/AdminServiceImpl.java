package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Override
    public Admin authenticateAdmin(String username, String password) {
        Admin admin = adminRepository.findByUsername(username);
        if (admin == null || !admin.getPassword().equals(password)) {
            throw new RuntimeException("Invalid username or password!");
        }
        return admin;
    }
}
