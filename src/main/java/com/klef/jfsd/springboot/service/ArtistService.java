package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Artist;

public interface ArtistService {
    Artist registerArtist(Artist artist);
    Artist authenticateArtist(String email, String password);
}