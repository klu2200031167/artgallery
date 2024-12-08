package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Admin;

public interface AdminService {
    Admin authenticateAdmin(String username, String password);
}
