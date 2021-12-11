/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.utils;


public class Delivery {
    private double parcel;
    private double delivery;

    public Delivery(double parcel, double delivery) {
        this.parcel = parcel;
        this.delivery = delivery;
    }

    public double getParcel() {
        return parcel;
    }

    public void setParcel(double parcel) {
        this.parcel = parcel;
    }

    public double getDelivery() {
        return delivery;
    }

    public void setDelivery(double delivery) {
        this.delivery = delivery;
    }
    
}
