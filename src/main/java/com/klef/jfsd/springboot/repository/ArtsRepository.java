package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Arts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ArtsRepository extends JpaRepository<Arts, Integer> {
    // Additional query methods can be added here if needed
}