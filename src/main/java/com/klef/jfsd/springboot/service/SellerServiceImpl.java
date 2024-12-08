package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Seller;
import com.klef.jfsd.springboot.repository.SellerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerServiceImpl implements SellerService {

    @Autowired
    private SellerRepository sellerRepository;

    @Override
    public Seller registerSeller(Seller seller) {
        if (sellerRepository.findByEmail(seller.getEmail()) != null) {
            throw new RuntimeException("Email already exists!");
        }
        return sellerRepository.save(seller);
    }

    @Override
    public Seller authenticateSeller(String email, String password) {
        Seller seller = sellerRepository.findByEmail(email);
        if (seller == null || !seller.getPassword().equals(password)) {
            throw new RuntimeException("Invalid email or password!");
        }
        return seller;
    }
}
