package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public Customer registerCustomer(Customer customer) {
        if (customerRepository.findByEmail(customer.getEmail()) != null) {
            throw new RuntimeException("Email already exists!");
        }
        return customerRepository.save(customer);
    }

    @Override
    public Customer authenticateCustomer(String email, String password) {
        Customer customer = customerRepository.findByEmail(email);
        if (customer == null || !customer.getPassword().equals(password)) {
            throw new RuntimeException("Invalid email or password!");
        }
        return customer;
    }

    @Override
    public Customer findCustomerByEmail(String email) {
        Customer customer = customerRepository.findByEmail(email);
        if (customer == null) {
            throw new RuntimeException("Customer not found!");
        }
        return customer;
    }
}