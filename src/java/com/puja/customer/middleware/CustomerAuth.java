/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.middleware;

import com.puja.customer.dao.CustomerDao;
import com.puja.customer.dao.DB;
import com.puja.customer.models.Customer;
import com.puja.customer.utils.Constants;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CustomerAuth implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig); //To change body of generated methods, choose Tools | Templates.
    }

    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpSession session = req.getSession();
        String role = (String)session.getAttribute("user_role");
        String user_id = (String)session.getAttribute("user_id");
        if(role!=null && user_id !=null && role.equalsIgnoreCase("customer")){
            CustomerDao customerDao = new CustomerDao(DB.getConnection());
            Customer customer = customerDao.getCustomer(user_id);
            request.setAttribute("customer", customer);
            chain.doFilter(request, response);
        }else{
            System.out.println("com.puja.customer.middleware.CustomerAuth.doFilter()"+role);
            System.out.println("com.puja.customer.middleware.CustomerAuth.doFilter()"+user_id);
            HttpServletResponse res = (HttpServletResponse)response;
            res.sendRedirect(Constants.base_url+"/login.jsp");
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy(); //To change body of generated methods, choose Tools | Templates.
    }
    
}
