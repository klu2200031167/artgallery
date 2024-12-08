package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Artist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArtistRepository extends JpaRepository<Artist, Integer> {
    Artist findByEmail(String email);
}