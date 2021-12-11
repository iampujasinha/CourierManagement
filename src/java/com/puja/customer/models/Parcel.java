/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.models;


public class Parcel {
    private String id;
    private String consignment_no;
    private String customer_id;
    private String sender_name;
    private String sender_mobile;
    private String sender_email;
    
    private String sender_address;
    private String reciepient_name;
    private String reciepient_mobile;

    public String getSender_name() {
        return sender_name;
    }

    public void setSender_name(String sender_name) {
        this.sender_name = sender_name;
    }

    public String getSender_mobile() {
        return sender_mobile;
    }

    public void setSender_mobile(String sender_mobile) {
        this.sender_mobile = sender_mobile;
    }

    public String getSender_email() {
        return sender_email;
    }

    public void setSender_email(String sender_email) {
        this.sender_email = sender_email;
    }

    public String getReciepient_name() {
        return reciepient_name;
    }

    public void setReciepient_name(String reciepient_name) {
        this.reciepient_name = reciepient_name;
    }

    public String getReciepient_mobile() {
        return reciepient_mobile;
    }

    public void setReciepient_mobile(String reciepient_mobile) {
        this.reciepient_mobile = reciepient_mobile;
    }
    
    private String reciepient_address;

    public String getReciepient_address() {
        return reciepient_address;
    }

    public void setReciepient_address(String reciepient_address) {
        this.reciepient_address = reciepient_address;
    }
    private String registered_date;
    private String approve_date;
    private String picked_date;
    private String instock_date;
    private String out_of_delivery_date;
    private String date_to_reach;
    private String reached_date;
    private String transport_medium;
    private int transport_cost;
    private int parcel_cost;
    private int delivery_charge;
    private String payment_mode;
    private String receipt_no;
    private String status;
    private String payment_details;

    public String getPayment_details() {
        return payment_details;
    }

    public void setPayment_details(String payment_details) {
        this.payment_details = payment_details;
    }
    
    private String cancel_reason;
    private String created_at;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getConsignment_no() {
        return consignment_no;
    }

    public void setConsignment_no(String consignment_no) {
        this.consignment_no = consignment_no;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getSender_address() {
        return sender_address;
    }

    public void setSender_address(String sender_address) {
        this.sender_address = sender_address;
    }


    public String getRegistered_date() {
        return registered_date;
    }

    public void setRegistered_date(String registered_date) {
        this.registered_date = registered_date;
    }

    public String getApprove_date() {
        return approve_date;
    }

    public void setApprove_date(String approve_date) {
        this.approve_date = approve_date;
    }

    public String getPicked_date() {
        return picked_date;
    }

    public void setPicked_date(String picked_date) {
        this.picked_date = picked_date;
    }

    public String getInstock_date() {
        return instock_date;
    }

    public void setInstock_date(String instock_date) {
        this.instock_date = instock_date;
    }

    public String getOut_of_delivery_date() {
        return out_of_delivery_date;
    }

    public void setOut_of_delivery_date(String out_of_delivery_date) {
        this.out_of_delivery_date = out_of_delivery_date;
    }

    public String getDate_to_reach() {
        return date_to_reach;
    }

    public void setDate_to_reach(String date_to_reach) {
        this.date_to_reach = date_to_reach;
    }

    public String getReached_date() {
        return reached_date;
    }

    public void setReached_date(String reached_date) {
        this.reached_date = reached_date;
    }

    public String getTransport_medium() {
        return transport_medium;
    }

    public void setTransport_medium(String transport_medium) {
        this.transport_medium = transport_medium;
    }

    public int getTransport_cost() {
        return transport_cost;
    }

    public void setTransport_cost(int transport_cost) {
        this.transport_cost = transport_cost;
    }

    public int getParcel_cost() {
        return parcel_cost;
    }

    public void setParcel_cost(int parcel_cost) {
        this.parcel_cost = parcel_cost;
    }

    public int getDelivery_charge() {
        return delivery_charge;
    }

    public void setDelivery_charge(int delivery_charge) {
        this.delivery_charge = delivery_charge;
    }

    public String getPayment_mode() {
        return payment_mode;
    }

    public void setPayment_mode(String payment_mode) {
        this.payment_mode = payment_mode;
    }

    public String getReceipt_no() {
        return receipt_no;
    }

    public void setReceipt_no(String receipt_no) {
        this.receipt_no = receipt_no;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCancel_reason() {
        return cancel_reason;
    }

    public void setCancel_reason(String cancel_reason) {
        this.cancel_reason = cancel_reason;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
    
}
