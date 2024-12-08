package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "artist_table")
public class Artist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "artist_id")
    private int id;

    @Column(name = "artist_name", nullable = false, length = 50)
    private String name;

    @Column(name = "artist_email", nullable = false, unique = true, length = 50)
    private String email;

    @Column(name = "artist_password", nullable = false, length = 50)
    private String password;

    @Column(name = "artist_location", nullable = false, length = 50)
    private String location;

    @OneToMany(mappedBy = "artist", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Arts> arts;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<Arts> getArts() {
        return arts;
    }

    public void setArts(List<Arts> arts) {
        this.arts = arts;
    }

    @Override
    public String toString() {
        return "Artist [id=" + id + ", name=" + name + ", email=" + email + ", location=" + location + "]";
    }
}