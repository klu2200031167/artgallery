package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Artist;
import com.klef.jfsd.springboot.repository.ArtistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArtistServiceImpl implements ArtistService {

    @Autowired
    private ArtistRepository artistRepository;

    @Override
    public Artist registerArtist(Artist artist) {
        // Ensure unique email
        if (artistRepository.findByEmail(artist.getEmail()) != null) {
            throw new RuntimeException("Email already exists!");
        }
        return artistRepository.save(artist);
    }

    @Override
    public Artist authenticateArtist(String email, String password) {
        Artist artist = artistRepository.findByEmail(email);
        if (artist == null || !artist.getPassword().equals(password)) {
            throw new RuntimeException("Invalid email or password!");
        }
        return artist;
    }
}