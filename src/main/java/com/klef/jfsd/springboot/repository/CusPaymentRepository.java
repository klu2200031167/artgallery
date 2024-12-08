package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.CusPayment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CusPaymentRepository extends JpaRepository<CusPayment, Integer> {
    // Additional custom query methods if needed
}