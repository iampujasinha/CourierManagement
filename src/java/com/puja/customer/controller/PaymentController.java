/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.controller;

import com.puja.customer.dao.DB;
import com.puja.customer.dao.ParcelDao;
import com.puja.customer.models.Parcel;
import com.puja.customer.utils.Constants;
import com.puja.customer.utils.CustomerUtil;
import com.razorpay.Payment;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.puja.customer.dao.ParcelDao;
import javax.servlet.http.HttpSession;

public class PaymentController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            RazorpayClient razorpayClient = new RazorpayClient(Constants.payment_key, Constants.payment_secret);
            
        } catch (RazorpayException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaymentController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        String id = request.getParameter("id");
        ParcelDao parcelDao = new ParcelDao(DB.getConnection());
        Parcel parcel = parcelDao.getParcel(id);
        request.setAttribute("parcel", parcel);
        request.getRequestDispatcher(CustomerUtil.getJsp("payment")).forward(request, response);
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
        String path = request.getRequestURI().substring(request.getContextPath().length());
        try {
            RazorpayClient razorpayClient = new RazorpayClient(Constants.payment_key, Constants.payment_secret);
            
            if(path.contains("success")){
                String paymentId = request.getParameter("razorpay_payment_id");
                Payment payment = razorpayClient.Payments.fetch(paymentId);
                int amount = payment.get("amount");
                String id = payment.get("id");
                Date createdAt = payment.get("created_at");
                String order_id = request.getParameter("order_id");
                System.out.println("com.puja.customer.controller.PaymentController.doPost()");
                
                ParcelDao parcelDao = new ParcelDao(DB.getConnection());
                HttpSession regSession = request.getSession();
                if(parcelDao.updatePayment(order_id, id)){
                    regSession.setAttribute("success", "payment completed successfully");
                    response.sendRedirect(Constants.orders); 
                }else{
                    regSession.setAttribute("error", "Something went wrong");
                    response.sendRedirect(Constants.orderPayment+order_id); 
                }
                
             
            }else{
                System.out.println("com.puja.customer.controller.PaymentController.doPost()"+"Apoorv");
            }
        } catch (RazorpayException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
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
