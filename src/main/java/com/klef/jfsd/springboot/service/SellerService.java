package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Seller;

public interface SellerService {
    Seller registerSeller(Seller seller);
    Seller authenticateSeller(String email, String password);
}
