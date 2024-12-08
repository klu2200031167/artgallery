package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "seller_table")
public class Seller {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name="customer_id")
  private int id;
  @Column(name="seller_fname",nullable=false,length = 50)
  private String Firstname;
  @Column(name="seller_lname",nullable=false,length = 50)
  private String Lastname;
  @Column(name="seller_email",nullable=false,unique = true,length = 30)
  private String email;
  @Column(name="seller_location",nullable=false,length = 50)
  private String Location;
  @Column(name="seller_password",nullable=false,length = 30)
  private String password;
  @Column(name="seller_contact",nullable=false)
  private String contact;
  @Column(name="sellerstatus",nullable=false)
  private boolean sellerstatus;
  
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public String getFirstname() {
    return Firstname;
  }
  public void setFirstname(String firstname) {
    Firstname = firstname;
  }
  public String getLastname() {
    return Lastname;
  }
  public void setLastname(String lastname) {
    Lastname = lastname;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getLocation() {
    return Location;
  }
  public void setLocation(String location) {
    Location = location;
  }
  public String getContact() {
    return contact;
  }
  public void setContact(String contact) {
    this.contact = contact;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
public boolean isSellerstatus() {
	return sellerstatus;
}
public void setSellerstatus(boolean sellerstatus) {
	this.sellerstatus = sellerstatus;
}

@Override
public String toString() {
	return "Seller [id=" + id + ", Firstname=" + Firstname + ", Lastname=" + Lastname + ", email=" + email
			+ ", Location=" + Location + ", password=" + password + ", contact=" + contact + ", sellerstatus="
			+ sellerstatus + "]";
}

  
  
  
  
  
}