package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Arts;
import com.klef.jfsd.springboot.repository.ArtsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArtsServiceImpl implements ArtsService {

    @Autowired
    private ArtsRepository artsRepository;

    @Override
    public Arts addArt(Arts arts) {
        return artsRepository.save(arts);
    }

    @Override
    public List<Arts> getAllArts() {
        return artsRepository.findAll();
    }

    @Override
    public Arts getArtById(int id) {
        return artsRepository.findById(id).orElseThrow(() -> new RuntimeException("Art not found with id: " + id));
    }

    @Override
    public void deleteArtById(int id) {
        artsRepository.deleteById(id);
    }
}