/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.models;


public class Customer {
    public String c_id;
    public String c_name;
    public String c_state;
    public String c_district;
    public String c_city;
    public String c_address;
    public String c_pin;
    public String c_email;
    public String c_mob;
    public String c_gender;

    public Customer(String c_id, String c_name, String c_state, String c_district, String c_city, String c_address, String c_pin, String c_email, String c_mob, String c_gender) {
        this.c_id = c_id;
        this.c_name = c_name;
        this.c_state = c_state;
        this.c_district = c_district;
        this.c_city = c_city;
        this.c_address = c_address;
        this.c_pin = c_pin;
        this.c_email = c_email;
        this.c_mob = c_mob;
        this.c_gender = c_gender;
    }

   

    public Customer(String c_name, String c_state, String c_district, String c_city, String c_address, String c_pin, String c_email, String c_mob, String c_gender) {
        this.c_name = c_name;
        this.c_state = c_state;
        this.c_district = c_district;
        this.c_city = c_city;
        this.c_address = c_address;
        this.c_pin = c_pin;
        this.c_email = c_email;
        this.c_mob = c_mob;
        this.c_gender = c_gender;
    }

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getC_state() {
        return c_state;
    }

    public void setC_state(String c_state) {
        this.c_state = c_state;
    }

    public String getC_district() {
        return c_district;
    }

    public void setC_district(String c_district) {
        this.c_district = c_district;
    }

    public String getC_city() {
        return c_city;
    }

    public void setC_city(String c_city) {
        this.c_city = c_city;
    }

    public String getC_address() {
        return c_address;
    }

    public void setC_address(String c_address) {
        this.c_address = c_address;
    }

    public String getC_pin() {
        return c_pin;
    }

    public void setC_pin(String c_pin) {
        this.c_pin = c_pin;
    }

    public String getC_email() {
        return c_email;
    }

    public void setC_email(String c_email) {
        this.c_email = c_email;
    }

    public String getC_mob() {
        return c_mob;
    }

    public void setC_mob(String c_mob) {
        this.c_mob = c_mob;
    }

    public String getC_gender() {
        return c_gender;
    }

    public void setC_gender(String c_gender) {
        this.c_gender = c_gender;
    }
    
}
