<%-- 
    Document   : sidebar
    Created on : Nov 3, 2021, 11:02:41 AM
    Author     : Puja Sinha
     
--%>
<%@page import="com.puja.customer.utils.CustomerUtil"%>
<%@page import="com.puja.customer.models.Customer"%>
<%@page import="com.puja.customer.utils.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="vertical-nav bg-white" id="sidebar">
    <div class="py-4 px-3 mb-4 bg-light">
        <div class="media d-flex align-items-center"><img src="<%=CustomerUtil.assets("img/user.png")%>"  width="90" height="100" class="mr-3 rounded-circle img-thumbnail shadow-sm">
            <div class="media-body">
                <% 
                    Customer customer = (Customer)request.getAttribute("customer");
                %>
                <h4 class="m-0"><% if(customer!=null){ out.print(customer.getC_name()); }else{ out.print("as"); } %></h4>
                <p class="font-weight-normal text-muted mb-0">Customer</p>
            </div>
        </div>
    </div>
    <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Dashboard</p>
    <ul class="nav flex-column bg-white mb-0">
        
        <li class="nav-item">
            <a href="<%= Constants.customer_url %>" class="nav-link text-dark">
                <i class="fa fa-address-card mr-3 text-primary fa-fw"></i>
                Dashboard
            </a>
        </li>
        <li class="nav-item">
            <a href="<%= Constants.orders %>" class="nav-link text-dark">
                <i class="fa fa-cubes mr-3 text-primary fa-fw"></i>
                Orders 
            </a>
        </li>
        <li class="nav-item">
            <a href="<%= Constants.orderCreate %>" class="nav-link text-dark">
                <i class="fas fa-people-carry mr-3 text-primary fa-fw"></i>
                Create order
            </a>
        </li>
        
    </ul>
    <p class="text-gray font-weight-bold text-uppercase px-3 small py-4 mb-0">PROFILE</p>
    <ul class="nav flex-column bg-white mb-0">
        <li class="nav-item">
            <a href="<%= Constants.profileUrl %>" class="nav-link text-dark">
                <i class="fas fa-id-card mr-3 text-primary fa-fw"></i>
                Update Profile
            </a>
        </li>
        <li class="nav-item">
            <a href="<%= Constants.logout %>" class="nav-link text-dark">
                <i class="fas fa-sign-out-alt mr-3 text-primary fa-fw"></i>
                Logout
            </a>
        </li>                
    </ul>
</div>
