package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;

@Entity
@Table(name = "arts_table")
public class Arts {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "art_id")
    private int id;

    @Column(name = "art_name", nullable = false, length = 50)
    private String artname;

    @Column(name = "art_location", nullable = false, length = 50)
    private String location;

    @Column(name = "art_price", nullable = false, length = 50)
    private String artprice;

    @Column(name = "image_link", nullable = false, length = 500)
    private String imglink;

    @ManyToOne
    @JoinColumn(name = "artist_id", nullable = false)
    private Artist artist;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getArtname() {
        return artname;
    }

    public void setArtname(String artname) {
        this.artname = artname;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getArtprice() {
        return artprice;
    }

    public void setArtprice(String artprice) {
        this.artprice = artprice;
    }

    public String getImglink() {
        return imglink;
    }

    public void setImglink(String imglink) {
        this.imglink = imglink;
    }

    public Artist getArtist() {
        return artist;
    }

    public void setArtist(Artist artist) {
        this.artist = artist;
    }

    @Override
    public String toString() {
        return "Arts [id=" + id + ", artname=" + artname + ", location=" + location + 
               ", artprice=" + artprice + ", imglink=" + imglink + ", artist=" + artist.getName() + "]";
    }
}