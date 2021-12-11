/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.dao;

import com.puja.customer.models.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CustomerDao {
    private Connection conn;

    public CustomerDao(Connection conn) {
        this.conn = conn;
    }
    
    public Customer getCustomer(String customer_id){
        Customer customer = null;
        try {
            String query = "select * from customer where c_id='"+customer_id+"'";
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
 
            if(resultSet.next()){
                customer = new Customer(resultSet.getString("c_id"),resultSet.getString("c_name"),resultSet.getString("c_state"),
                        resultSet.getString("c_district"),resultSet.getString("c_city"),resultSet.getString("c_address"),resultSet.getString("c_pin"),
                        resultSet.getString("c_email"),resultSet.getString("c_mob"),resultSet.getString("c_gender"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("com.puja.customer.dao.CustomerDao.getCustomer()"+customer.getC_city());
        return customer;
    }
    
    public boolean updateProfile(String c_name, String c_state, String c_district, String c_city, String c_address, String c_pin, String c_email, String c_mob, String c_gender,String c_id){
        boolean check = false;
        String query = "Update customer set c_name=? ,`c_state`=?,`c_district`=?,`c_city`=?,`c_address`=?,`c_pin`=?,`c_email`=?,`c_mob`=?,`c_gender`=? WHERE c_id=?";
        try {
            PreparedStatement statement = DB.getConnection().prepareStatement(query);
            statement.setString(1, c_name);
            statement.setString(2, c_state);
            statement.setString(3, c_district);
            statement.setString(4, c_city);
            statement.setString(5, c_address);
            statement.setString(6, c_pin);
            statement.setString(7, c_email);
            statement.setString(8, c_mob);
            statement.setString(9, c_gender);
            statement.setString(10, c_id);
            statement.executeUpdate();
            statement.close();
            check= true;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return check;
    }
}
