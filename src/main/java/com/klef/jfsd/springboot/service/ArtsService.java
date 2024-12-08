package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Arts;
import java.util.List;

public interface ArtsService {
    Arts addArt(Arts arts);
    List<Arts> getAllArts();
    Arts getArtById(int id);
    void deleteArtById(int id);
    public default void saveArtwork(Arts arts) {
        // Implement logic to save the artwork (e.g., to a database)
        // For now, you can print it out to check if it is working
        System.out.println("Saving artwork: " + arts.getArtist());
    }
}