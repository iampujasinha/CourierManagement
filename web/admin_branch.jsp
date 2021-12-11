<%-- 
    Document   : admin_branch
    Created on : 6 Jul, 2021, 11:54:00 PM
    Author     : Dell
--%>

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
        <!--<meta http-equiv="X-UA-Compatible" content="ie=edge" />-->
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
        <header>
            <div class="container-fluid p-0">
                <!--p-0 to remove padding -- to use class just type .cls and enter(tag auto appears)-->
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">E-Courier/View Customers</a>
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
            <a href="admin_branch.jsp" class="nav-link text-dark bg-light">
                <i class="fa fa-cubes mr-3 text-primary fa-fw"></i>
                Branch
            </a>
        </li>
        <li class="nav-item">
            <a href="admin_staff.jsp" class="nav-link text-dark">
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
        <div class="col-md-4">
            <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
                <i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold"></small>
            </button></div>        
    </div>
    <div class="row">
        <div class="col-md-4 text-left">
            <a href="admin_branch_add.jsp" class="btn btn-primary">Register Branch</a>            
        </div>
        <div class="col-md-4">
            <form action="" method="get">
                <input title="Type and Press Enter" type="text" class="form-control" name="q" placeholder="Search Here...">
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
    <p></p>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">ID</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Name</th>
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
        <form action="admin_branch_edit.jsp">
            <tbody>
                <%

                    try {
                        Connection con=CommonUtility.getCon();
                        Statement st = con.createStatement();
                        ResultSet res;
                        String qry = request.getParameter("q");
                        String data;
                        if (qry != null) {
                            data = "select b_id,b_name,b_state,b_district,b_city,b_address,b_pin,b_email,b_mob,b_isactive from branch where b_id='" + qry + "' or b_name='" + qry + "' or b_state='" + qry + "' or b_district='" + qry + "' or b_city='" + qry + "' or b_address='" + qry + "' or b_pin='" + qry + "' or b_email='" + qry + "' or b_mob='" + qry + "' or b_isactive='" + qry + "'";
                        } else {
                            data = "select b_id,b_name,b_state,b_district,b_city,b_address,b_pin,b_email,b_mob,b_isactive from branch";
                        }
                        res = st.executeQuery(data);
                        while (res.next()) {
                %>

                <tr>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("b_id")%></td>
                    <td class="col-md-2 col-lg-2 col-xl-2 text-center"><%=res.getString("b_name")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("b_state")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("b_district")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("b_city")%></td>  
                    <td class="col-md-3 col-lg-3 col-xl-3 text-center"><%=res.getString("b_address")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("b_pin")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("b_email")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("b_mob")%></td>
                    <%String p;
                        int a = res.getInt("b_isactive");
                        if (a == 1) {
                            p = "Yes";
                        } else {
                            p = "No";
                        }
                    %>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=p%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center">                    
                        <!--<button type="submit" name="btnedit" class="btn btn-warning" data-toggle="modal" data-target="#editModal" onclick=" editRecord(<//%=res.getString(1)%>);request.setAttribute("name","shriya"); >Edit</button>-->
                        <a href='admin_branch_edit.jsp?b_id=<%=res.getString("b_id")%>' class="btn btn-warning">Edit</a>

                        <!--<button type="submit" class="btn btn-primary" name="btndeletebranch">Delete</button>-->
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