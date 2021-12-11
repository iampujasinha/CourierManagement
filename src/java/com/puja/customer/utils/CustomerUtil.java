/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.utils;

import com.puja.customer.models.Parcel;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CustomerUtil {
    public static String getJsp(String file){
        return "/customer/"+file+".jsp";
    }
       
    public static String assets(String file){
        return Constants.base_url+"/customer/assets/"+file;
    }
    
    public static String getKey(){
        String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
        return "p"+timeStamp;
    }
    
    public static String getCurrentDateTime(){
        String timeStamp = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
        return timeStamp;
    }
    
    public static String getDatefromDateTime(String dateTime){
        String timeStamp="";
        SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = dateParser.parse(dateTime);
            timeStamp = new SimpleDateFormat("yyyy-MM-dd").format(date);
        } catch (ParseException ex) {
            Logger.getLogger(CustomerUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return timeStamp;
    }
    
    
    
    public static boolean isParcelCancel(Parcel parcel){
        return parcel.getStatus().equalsIgnoreCase("placed") || parcel.getStatus().equalsIgnoreCase("confirm")
                || parcel.getStatus().equalsIgnoreCase("picked");
    }
    
    public static boolean isParcelCompleted(Parcel parcel){
        return parcel.getStatus().equalsIgnoreCase("completed");
    }
    
    public static Delivery getParcelCost(double weights[]){
        double parcel = 0;
        double delivery = 0;
        for(double weight: weights ){
            if(weight<50){
                parcel+= weight*Constants.parcel_cost_1;
                delivery+= weight*Constants.delivery_cost_1;
            }else if(weight>=50 && weight<150){
                parcel+= weight*Constants.parcel_cost_2;
                delivery+= weight*Constants.delivery_cost_2;
            }else{
                parcel+= weight*Constants.parcel_cost_3;
                delivery+= weight*Constants.delivery_cost_3;
            }
        }
        return new Delivery(parcel,delivery);
    }
    
    public static Transport getTransportCost(double distance){
        String mode = "road";
        double cost = 0;
        if(distance>4000){
            mode = "air";
            cost = distance*Constants.transport_cost_air;
        }else if(distance>1000 && distance<=4000){
            mode = "railway";
            cost = distance*Constants.transport_cost_railway;
        }else{
            mode = "road";
            cost = distance*Constants.transport_cost_road;
        }
        return new Transport(mode,cost);
    }
}
