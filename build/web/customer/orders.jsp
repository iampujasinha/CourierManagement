<%-- 
    Document   : customerdashboard
    Created on : Sep 24, 2021, 3:30:04 PM
    Author     : Puja Sinha
     
--%>

<%@page import="com.puja.customer.models.Reciepient"%>
<%@page import="com.puja.customer.dao.DB"%>
<%@page import="com.puja.customer.dao.CustomerDao"%>
<%@page import="com.puja.customer.dao.RecipientDao"%>
<%@page import="com.puja.customer.models.Parcel"%>
<%@page import="java.util.List"%>
<%@page import="com.puja.customer.utils.CustomerUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Courier Customer Place Order</title>

        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/bootstrap.css")%>" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" >
        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/Style.css")%>" />
        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/mobile-style.css")%>">
        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/dataTables.min.css")%>" />
    </head>
    <body class="body-gradient">
        
        <%@include file="header.jsp" %>
        <%@include file="sidebar.jsp" %> 
         

        <div class="page-content p-5" id="content">
            <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
                <i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold"></small>
            </button>
            <div class="container">
                <%@include file="message.jsp" %>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-bordered" id="parcelTable">
                                <thead>
                                    <tr>
                                    <th>ID</th>
                                    <th>Customer Name</th>
                                    <th>Recipient Name</th>
                                    <th>Order Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        List<Parcel> parcels = (List<Parcel>)request.getAttribute("parcels");
                                        for(int i=0;i<parcels.size();i++){ %>
                                        <tr>
                                            <td><%= parcels.get(i).getId() %></td>
                                            <td><%=parcels.get(i).getSender_name()%></td>
                                            <td><%=parcels.get(i).getReciepient_name()%></td>
                                            <td><%= CustomerUtil.getDatefromDateTime(parcels.get(i).getRegistered_date())%></td>
                                            <td><%=parcels.get(i).getStatus()  %></td>
                                            <td>
                                                <a href="<%= Constants.orderShow+parcels.get(i).getId() %>" class="btn btn-info">Show</a>
                                            </td>
                                        </tr>
                                    <%    }
                                    %>
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<script src="<%=CustomerUtil.assets("js/jquery.js")%>"></script>
<script src="<%=CustomerUtil.assets("js/popper.js")%>">
</script>
<script src="<%=CustomerUtil.assets("js/bootstrap.js")%>">
</script>
<script src="<%=CustomerUtil.assets("js/main.js")%>"></script>
<script src="<%=CustomerUtil.assets("js/dataTables.min.js")%>"></script>
<script src="<%=CustomerUtil.assets("js/bootstrapDataTable.js")%>"></script>
<script>
    $(document).ready(function(){
        $("#parcelTable").DataTable();
    })
</script>
</body>
</html>
