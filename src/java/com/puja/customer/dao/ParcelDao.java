/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.dao;

import com.puja.customer.models.Feedback;
import com.puja.customer.models.Parcel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ParcelDao {
    private Connection conn;

    public ParcelDao(Connection conn) {
        this.conn = conn;
    }
    
    public boolean updatePayment(String parcel_id,String payment_id){
        boolean check = false;
        String query = "UPDATE `parcels` SET `payment_details`=? WHERE `id`=? ";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, payment_id);
            statement.setString(2, parcel_id);
            int ab = statement.executeUpdate();
            if(ab!= -1){
                check = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
    public boolean insert(String customer_id,String sender_name,String sender_mobile,String sender_email,String sender_address,String reciepient_name,String reciepient_mobile,String reciepient_address,String registered_date,
            double transport_cost,double parcel_cost,double delivery_charge,String payment_mode,String parcel_id,String transport_medium){
        boolean check = false;
        String query = "INSERT INTO `parcels`(`customer_id`,`sender_name`, `sender_mobile`, `sender_email`, `sender_address`,`reciepient_name`, `reciepient_mobile`, `reciepient_address`, `registered_date`, `transport_cost`, `parcel_cost`, `delivery_charge`, `payment_mode`,id,transport_medium) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, customer_id);
            statement.setString(2, sender_name);
            statement.setString(3, sender_mobile);
            statement.setString(4, sender_email);
            statement.setString(5, sender_address);
            statement.setString(6, reciepient_name);
            statement.setString(7, reciepient_mobile);
            statement.setString(8, reciepient_address);
            statement.setString(9, registered_date);
            statement.setDouble(10, transport_cost);
            statement.setDouble(11, parcel_cost);
            statement.setDouble(12, delivery_charge);
            statement.setString(13, payment_mode);
            statement.setString(14, parcel_id);
            statement.setString(15, transport_medium);
            int ab = statement.executeUpdate();
            if(ab!= -1){
                check = true;
            }
            System.out.println("com.puja.customer.dao.ParcelDao.insert()"+ab);
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
    public boolean cancelParcel(String id,String reason){
        boolean check = false;
        String sql = "update `parcels` SET `cancel_reason`=?, `status`=? where `id`=?";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, reason);
            preparedStatement.setString(2, "cancelled");
            preparedStatement.setString(3, id);
            int ab = preparedStatement.executeUpdate();
            if(ab != -1){
                check = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
    public String LastId(){
        String id = "";
        String query = ("SELECT * FROM parcels ORDER BY id DESC LIMIT 1");
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                id = resultSet.getString("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public boolean insertParcelItem(String parcel_id,double weight,double length,double height,double width){
        boolean check = false;
        String query = "INSERT INTO `parcel_items`( `parcel_id`, `weight`, `length`, `height`, `width`) VALUES (?,?,?,?,?)";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, parcel_id);
            statement.setDouble(2, weight);
            statement.setDouble(3, length);
            statement.setDouble(4, height);
            statement.setDouble(5, width);
            check = statement.execute();
            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return check;
    }
    
    public Parcel getParcel(String id){
        Parcel parcel = new Parcel();
        try {
            String sql = "SELECT * from parcels where `id`= ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                parcel.setId(result.getString("id"));
                parcel.setConsignment_no(result.getString("consignment_no"));
                parcel.setCustomer_id(result.getString("customer_id"));
                parcel.setSender_address(result.getString("sender_address"));
                parcel.setReciepient_address(result.getString("reciepient_address"));
                
                parcel.setRegistered_date(result.getString("registered_date"));
                parcel.setStatus(result.getString("status"));
                
                parcel.setApprove_date(result.getString("approve_date"));
                parcel.setPicked_date(result.getString("picked_date"));
                parcel.setInstock_date(result.getString("instock_date"));
                parcel.setOut_of_delivery_date(result.getString("out_of_delivery_date"));
                parcel.setDate_to_reach(result.getString("date_to_reach"));
                parcel.setReached_date(result.getString("reached_date"));
                parcel.setTransport_medium(result.getString("transport_medium"));
                
                parcel.setTransport_cost(result.getInt("transport_cost"));
                parcel.setParcel_cost(result.getInt("parcel_cost"));
                parcel.setDelivery_charge(result.getInt("delivery_charge"));
                parcel.setPayment_mode(result.getString("payment_mode"));
                parcel.setPayment_details(result.getString("payment_details"));
                parcel.setReceipt_no(result.getString("receipt_no"));
                parcel.setCancel_reason(result.getString("cancel_reason"));
                
                parcel.setCreated_at(result.getString("created_at"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return parcel;
    }
    
    public List<Parcel> getAllParcel(){
        List<Parcel> listParcel = new ArrayList();
        String query = "select * from parcels order by id asc";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Parcel parcel = new Parcel();
                parcel.setId(result.getString("id"));
                parcel.setSender_name(result.getString("sender_name"));
                parcel.setReciepient_name(result.getString("reciepient_name"));
                parcel.setRegistered_date(result.getString("registered_date"));
                parcel.setStatus(result.getString("status"));
                parcel.setCreated_at(result.getString("created_at"));
                listParcel.add(parcel);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RecipientDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listParcel;
    }
    
    public boolean isnertFeedback(Feedback feedback){
        boolean check = false;
        String sql = "INSERT INTO `feedbacks`(`parcel_id`, `customer_id`, `feedback`, `rating`) VALUES (?,?,?,?)";
        try {
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, feedback.getParcel_id());
            statement.setString(2, feedback.getCustomer_id());
            statement.setString(3, feedback.getFeedback());
            statement.setInt(4, feedback.getRating());
            int ab = statement.executeUpdate();
            if(ab != -1){
                check = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
}
