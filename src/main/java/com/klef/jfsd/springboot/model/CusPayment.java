package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "payment_table")
public class CusPayment 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-generated primary key
	@Column(name = "payment_id")
	private int id;

    @Column(name = "full_name", nullable = false, length = 50)
    private String full_name;

    @Column(name = "email", nullable = false, unique = true, length = 30)
    private String email;

    @Column(name = "address", nullable = false, length = 100)
    private String address;

    @Column(name = "city", nullable = false, length = 50)
    private String city;

    @Column(name = "state", nullable = false, length = 50)
    private String state;

    @Column(name = "zip", nullable = false, length = 10)
    private String zip;

    @Column(name = "card_name", nullable = false, length = 50)
    private String card_name;

    @Column(name = "card_number", nullable = false, length = 16, unique = true)
    private String card_number;

    @Column(name = "exp_month", nullable = false, length = 2)
    private String exp_month;

    @Column(name = "exp_year", nullable = false, length = 4)
    private String exp_year;

    @Column(name = "cvv", nullable = false, length = 3)
    private String cvv;

    @Column(name = "total_amount", nullable = false)
    private Double total_amount;

    @Column(name = "payment_date", nullable = false)
    private LocalDate payment_date;

    // Getters and Setters
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return full_name;
    }

    public void setFullName(String fullName) {
        this.full_name = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCardName() {
        return card_name;
    }

    public void setCardName(String cardName) {
        this.card_name = cardName;
    }

    public String getCardNumber() {
        return card_number;
    }

    public void setCardNumber(String cardNumber) {
        this.card_number = cardNumber;
    }

    public String getExpMonth() {
        return exp_month;
    }

    public void setExpMonth(String expMonth) {
        this.exp_month = expMonth;
    }

    public String getExpYear() {
        return exp_year;
    }

    public void setExpYear(String expYear) {
        this.exp_year = expYear;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public Double getTotalAmount() {
        return total_amount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.total_amount = totalAmount;
    }

    public LocalDate getPaymentDate() {
        return payment_date;
    }

    public void setPaymentDate(LocalDate paymentDate) {
        this.payment_date = paymentDate;
    }

    @Override
    public String toString() {
        return "Payment [id=" + id + ", fullName=" + full_name + ", email=" + email + ", address=" + address
                + ", city=" + city + ", state=" + state + ", zip=" + zip + ", cardName=" + card_name
                + ", cardNumber=" + card_number + ", expMonth=" + exp_month + ", expYear=" + exp_year + ", cvv=" + cvv
                + ", totalAmount=" + total_amount + ", paymentDate=" + payment_date + "]";
    }
}