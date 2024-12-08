package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SellerRepository extends JpaRepository<Seller, Integer> {
    Seller findByEmail(String email);
}
