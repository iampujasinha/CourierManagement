<%-- 
    Document   : customerdashboard
    Created on : Sep 24, 2021, 3:30:04 PM
    Author     : Puja Sinha
    
--%>

<%@page import="com.puja.customer.utils.CustomerUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Courier Customer Dashboard</title>

        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/bootstrap.css")%>" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" >
        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/Style.css")%>" />
        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/mobile-style.css")%>">

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
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                    <form method="post" >
                        <div class="row">
                        <div class="col-md-6">
                        <div class="form-group">
                            <label>Name</label>
                            <input class="form-control" type="text" name="c_name" value="<%= customer.getC_name() %>" required="">
                        </div>
                        
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Email</label>
                            <input class="form-control" type="email" readonly="" name="c_email" value="<%= customer.getC_email()%>" required="">
                        </div>
                        
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Mobile</label>
                            <input class="form-control" type="text" maxlength="10" name="c_mob" value="<%= customer.getC_mob()%>" required="">
                        </div>
                        
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>State</label>
                            <input class="form-control" type="text" name="c_state" value="<%= customer.getC_state()%>" required="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>District</label>
                            <input class="form-control" type="text" name="c_district" value="<%= customer.getC_district()%>" required="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>City</label>
                            <input class="form-control" type="text" name="c_city" value="<%= customer.getC_city()%>" required="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Address</label>
                            <input class="form-control" type="text" name="c_address" value="<%= customer.getC_address()%>" required="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Pin Code</label>
                            <input class="form-control" type="text" name="c_pin" maxlength="6" value="<%= customer.getC_pin()%>" required="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>
                                <input class="form-radio-item" type="radio" name="c_gender" value="male" <% if(customer.getC_gender().equalsIgnoreCase("male")){ out.print("checked"); } %>> Male
                            </label>
                            <label>
                                <input class="form-radio-item" type="radio" name="c_gender" value="Female" <% if(customer.getC_gender().equalsIgnoreCase("Female")){ out.print("checked"); } %>> Female
                            </label>
                        </div>
                    </div>
                        <div class="col-md-6">
                            <input class="btn btn-primary" type="submit" value="submit" name="submit">
                        </div>
                        </div>
                    </form>
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
</body>
</html>
