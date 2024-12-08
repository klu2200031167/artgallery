package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Customer;

public interface CustomerService {
    Customer registerCustomer(Customer customer);
    Customer authenticateCustomer(String email, String password);
    Customer findCustomerByEmail(String email); // Add this method
}