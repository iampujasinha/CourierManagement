/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.controller;

import com.puja.customer.dao.CustomerDao;
import com.puja.customer.dao.DB;
import com.puja.customer.models.Customer;
import com.puja.customer.utils.Constants;
import com.puja.customer.utils.CustomerUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ProfileController extends HttpServlet {

    
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        CustomerDao customerDao = new CustomerDao(DB.getConnection()); 
        HttpSession session = request.getSession();
        String user_id = (String)session.getAttribute("user_id");
        Customer customer = customerDao.getCustomer(user_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher(CustomerUtil.getJsp("profile"));
        dispatcher.forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer customer = (Customer)request.getAttribute("customer");
        String name = request.getParameter("c_name");
        String c_email = request.getParameter("c_email");
        String mobile = request.getParameter("c_mob");
        String c_state = request.getParameter("c_state");
        String c_district = request.getParameter("c_district");
        String c_city = request.getParameter("c_city");
        String c_address = request.getParameter("c_address");
        String c_pin = request.getParameter("c_pin");
        String c_gender = request.getParameter("c_gender");
        CustomerDao customerDao = new CustomerDao(DB.getConnection());
        HttpSession regSession = request.getSession();
        if(customerDao.updateProfile(name, c_state, c_district, c_city, c_address, c_pin, c_email, mobile, c_gender, customer.getC_id())){
            regSession.setAttribute("success", "Update Successful");
            response.sendRedirect(Constants.profileUrl); 
        }else{
            regSession.setAttribute("error", "Something went wrong");
            response.sendRedirect(Constants.profileUrl); 
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
