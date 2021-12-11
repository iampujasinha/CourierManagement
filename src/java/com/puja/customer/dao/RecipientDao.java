/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.dao;

import com.puja.customer.models.Reciepient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class RecipientDao {
    private Connection conn;

    public RecipientDao(Connection conn) {
        this.conn = conn;
    }
    
    public Reciepient getReciepient(String r_id){
        Reciepient reciepient = new Reciepient();
        try {
            String sql = "SELECT `id`, `name`, `mobile`, `state`, `district`, `city`, `pin`, `address`, `created_at` FROM `reciepient` where `id`= ?";
            
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, r_id);
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                reciepient.setId(result.getString("id"));
                reciepient.setName(result.getString("name"));
                reciepient.setMobile(result.getString("mobile"));
                reciepient.setState(result.getString("state"));
                reciepient.setDistrict(result.getString("district"));
                reciepient.setCity(result.getString("city"));
                reciepient.setPin(result.getString("pin"));
                reciepient.setAddress(result.getString("address"));
                reciepient.setCreated_at(result.getString("created_at"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("com.puja.customer.dao.CustomerDao.getCustomer()"+customer.getC_city());
        return reciepient;
    }
    
    public List<Reciepient> getAllReciepient(){
        List<Reciepient> listReciepient = new ArrayList();
        String query = "select * from reciepient";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Reciepient reciepient = new Reciepient();
                reciepient.setId(result.getString("id"));
                reciepient.setName(result.getString("name"));
                reciepient.setMobile(result.getString("mobile"));
                reciepient.setState(result.getString("state"));
                reciepient.setDistrict(result.getString("district"));
                reciepient.setCity(result.getString("city"));
                reciepient.setPin(result.getString("pin"));
                reciepient.setAddress(result.getString("address"));
                reciepient.setCreated_at(result.getString("created_at"));
                listReciepient.add(reciepient);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RecipientDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listReciepient;
    }
}
