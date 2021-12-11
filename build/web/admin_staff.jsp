<%-- 
    Document   : admin_staff
    Created on : 28 Sep, 2021, 11:57:18 AM
    Author     : Dell
--%>

<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="commonutility.CommonUtility"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.sql.Connection,java.sql.Driver,java.sql.DriverManager,java.lang.AbstractMethodError.*,java.util.logging.Level,java.util.logging.Logger,java.lang.*"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Random"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />        
        <title>CMS</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
              crossorigin="anonymous">
        <link rel="stylesheet" href="Style.css" />
        <link rel="stylesheet" href="./mobile-style.css">
        <style>            
        </style>            
    </head>
    <body>
        <%
            String SuccessMessage = "";
            String bs_id = request.getParameter("bs_id");
            String bs_id1 = request.getParameter("bs_id1");
        %>

        <%
            if (bs_id != null) {
                Connection con = CommonUtility.getCon();
                PreparedStatement ps = con.prepareStatement("update branch_staff set bs_isactive=? where bs_id=?");
                ps.setInt(1, 1);
                ps.setString(2, bs_id);
                ps.executeUpdate();
                SuccessMessage = "Staff activated Successfully!";                
            }
            if (bs_id1 != null) {
                Connection con = CommonUtility.getCon();
                PreparedStatement ps = con.prepareStatement("update branch_staff set bs_isactive=? where bs_id=?");
                ps.setInt(1, 0);
                ps.setString(2, bs_id1);
                ps.executeUpdate();
                SuccessMessage = "Staff inactivated Successfully!";                
            }
        %>

        <header>
            <div class="container-fluid p-0">
                <!--p-0 to remove padding -- to use class just type .cls and enter(tag auto appears)-->
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">E-Courier/View Staff</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <div class="mr-auto"></div>
                            <ul class="navbar-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="admin.jsp">Home
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Help</a>
                                </li>                                                        
                                <li class="nav-item">
                                    <a class="nav-link" href="#">LogOut<i class="fas fa-sign-out-alt"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
            </div>
        </nav>
    </div>     
</header>

<!--vertical navbar-->
<div class="vertical-nav bg-white" id="sidebar">
    <div class="py-4 px-3 mb-4 bg-light">
        <div class="media d-flex align-items-center"><img src="images/admin.png" alt="" width="80" height="80" class="mr-3 rounded-circle img-thumbnail shadow-sm">
            <div class="media-body">
                <h4 class="m-0">Name Here</h4>
                <p class="font-weight-normal text-muted mb-0">Admin</p>
            </div>
        </div>
    </div>
    <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Dashboard</p>
    <ul class="nav flex-column bg-white mb-0">
        <li class="nav-item">
            <a href="admin_admin.jsp" class="nav-link text-dark">
                <i class="fas fa-user-shield mr-3 text-primary fa-fw"></i>
                Admin
            </a>
        </li>
        <li class="nav-item">
            <a href="admin_customer.jsp" class="nav-link text-dark">
                <i class="fa fa-address-card mr-3 text-primary fa-fw"></i>
                Customer
            </a>
        </li>
        <li class="nav-item">
            <a href="admin_branch.jsp" class="nav-link text-dark">
                <i class="fa fa-cubes mr-3 text-primary fa-fw"></i>
                Branch
            </a>
        </li>
        <li class="nav-item">
            <a href="admin_staff.jsp" class="nav-link text-dark bg-light">
                <i class="fas fa-people-carry mr-3 text-primary fa-fw"></i>
                Branch Staff
            </a>
        </li>
        <li class="nav-item">
            <a href="admin_parcel.jsp" class="nav-link text-dark">
                <i class="fas fa-gift mr-3 text-primary fa-fw"></i>
                Parcel
            </a>
        </li>
        <li class="nav-item">
            <a href="admin_feedback.jsp" class="nav-link text-dark">
                <i class="fas fa-gift mr-3 text-primary fa-fw"></i>
                View Feedbacks
            </a>
        </li>
    </ul>
    <p class="text-gray font-weight-bold text-uppercase px-3 small py-4 mb-0">PROFILE</p>
    <ul class="nav flex-column bg-white mb-0">
        <li class="nav-item">
            <a href="admin_profile.jsp" class="nav-link text-dark">
                <i class="fas fa-id-card mr-3 text-primary fa-fw"></i>
                Update Profile
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link text-dark">
                <i class="fas fa-sign-out-alt mr-3 text-primary fa-fw"></i>
                Logout
            </a>
        </li>                
    </ul>
</div>

<div class="page-content p-5" id="content">
    <div class="row">
        <div class="col-md-1">
            <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
                <i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold"></small>
            </button>
        </div>          
        <div class="col-md-9 text-center">
            <center><h6 style="color:red;z-index:1;"><%= SuccessMessage%>                
                </h6>
            </center>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 text-left">
            <a href="admin_staff_add.jsp" class="btn btn-primary">Register Staff</a>            
        </div>        
        <div class="col-md-4">
            <form action="" method="get">
                <input title="Type and Press Enter" type="text" class="form-control" name="q" placeholder="Search Here...">
            </form>
        </div>        
    </div>    
    <p></p>
    <table class="table table-bordered table-hover" style="overflow-x:scroll;overflow-y: scroll;">
        <thead>
            <tr>                
                <th class="col-md-1 col-lg-1 col-xl-1 text-center" hidden="true">ID</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Name</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Gender</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Date of Birth</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">State</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">District</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">City</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Address</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Pin</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Email</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Mobile</th>                
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Active?</th>                
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Action</th>                
            </tr>
        </thead>
        <form action="" method="post">
            <tbody>
                <%
                    try {
                        Connection con = CommonUtility.getCon();
                        Statement st = con.createStatement();
                        ResultSet res;
                        String qry = request.getParameter("q");
                        String data;
                        if (qry != null) {
                            data = "select bs_id,bs_name,bs_gender,bs_dob,bs_state,bs_district,bs_city,bs_address,bs_pin,bs_email,bs_mob,bs_isactive from branch_staff where bs_id='" + qry + "' or bs_name='" + qry + "' or bs_gender='" + qry + "' or bs_state='" + qry + "' or bs_district='" + qry + "' or bs_city='" + qry + "' or bs_address='" + qry + "' or bs_pin='" + qry + "' or bs_email='" + qry + "' or bs_mob='" + qry + "'";
                        } else {
                            data = "select bs_id,bs_name,bs_gender,bs_dob,bs_state,bs_district,bs_city,bs_address,bs_pin,bs_email,bs_mob,bs_isactive from branch_staff";
                        }
                        res = st.executeQuery(data);
                        while (res.next()) {
                %>

                <tr>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center" hidden="true"><%=res.getString("bs_id")%></td>
                    <td class="col-md-2 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_name")%></td>
                    <td class="col-md-2 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_gender")%></td>
                    <td class="col-md-2 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_dob")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_state")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_district")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_city")%></td>  
                    <td class="col-md-3 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_address")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_pin")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_email")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("bs_mob")%></td>
                    <%
                        String p;
                        int a = res.getInt("bs_isactive");
                        if (a == 1) {
                            p = "Yes";
                        } else {
                            p = "No";
                        }
                    %>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=p%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center">
                        <!--<button type="submit" class="btn btn-warning" name="btnstaffdel">Inactivate</button>-->                        
                        <a href='admin_staff.jsp?bs_id=<%=res.getString("bs_id")%>' class="btn btn-primary" name="btnstaffdel2" style="margin-bottom: 5px">&nbsp; Activate</a>
                        <a href='admin_staff.jsp?bs_id1=<%=res.getString("bs_id")%>' class="btn btn-warning" name="btnstaffdel">Inactivate</a>
                    </td>                    
                </tr>

                <%
                        }
                    } catch (Exception e) {
                        System.out.print(e);
                        e.printStackTrace();
                    }
                %>
            </tbody>  
        </form>
    </table>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="main.js"></script>
<script type="text/javascript">
            function checkpass()
            {
                return true;
            }
            function editRecord(id) {
                var f = document.form;
                f.method = "post";
                f.action = 'admin_branch_edit?id=' + id;
                f.submit();
            }
</script>
</body>
</html>