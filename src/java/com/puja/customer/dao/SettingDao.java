/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.dao;

import com.puja.customer.utils.Constants;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class SettingDao {
    private Connection conn;

    public SettingDao(Connection conn) {
        this.conn = conn;
    }
    
    public String getDeliveryCost(){
        String deliveryCost = "";
        String query = "select * from settings where setting_key=?";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, Constants.delivery_charge);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                deliveryCost = resultSet.getString("setting_value");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deliveryCost;
    }
    
    public String getTransportCost(){
        String transport_cost = "";
        String query = "select * from settings where setting_key=?";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, Constants.transport_cost);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                transport_cost = resultSet.getString("setting_value");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return transport_cost;
    }
    
    public String getParcelCost(){
        String parcel_cost = "";
        String query = "select * from settings where setting_key=?";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, Constants.parcel_cost);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                parcel_cost = resultSet.getString("setting_value");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return parcel_cost;
    }
}
