<%-- 
    Document   : admin
    Created on : 21 Jun, 2021, 7:01:32 PM
    Author     : Dell
--%>

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

    </head>
    <body>
        <%String SuccessMessage = "";
            Boolean flag = false;
            String id1 = request.getParameter("id1");
            String pass1 = request.getParameter("pass1");
            if (id1 != null || pass1 != null) {

                try {
                    if (request.getParameter("btnsubmit") != null) {

                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "");
                        Statement st = conn.createStatement();

                        String qry = "select * from admin where a_id='" + id1 + "'";
                        //int j = st.executeUpdate("select * from users where userid='"+id1+"'");
                        ResultSet rs = st.executeQuery(qry);

                        if (rs.next()) {
                            SuccessMessage = "Admin ID already exists!";
                            flag = true;
                        } /*if(j>0){SuccessMessage = "Admin already exists, kindly choose new one";flag=true;}*/ else {
                            int i = st.executeUpdate("insert into admin(a_id,a_password)values('" + id1 + "','" + pass1 + "')");
                            if (i > 0) {
                                SuccessMessage = "Admin Successfully Registered!";
                                flag = true;
                            } else {
                                SuccessMessage = "Admin already exists, kindly choose new one";
                                flag = true;
                            }
                        }
                    }
                } catch (Exception e) {
                    System.out.print(e);
                    e.printStackTrace();
                }
            }
        %>
        
        <!-- Modal Registering Admin-->       
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <!--<center><h6 style="color:red">Register Successfullll</h6></center>-->
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Register New Admin</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" onsubmit="return checkpass()" action="admin_admin.jsp">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="admin-name" class="col-form-label">Name<span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="admin-name" maxlength="25" required>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="admin-state" class="col-form-label">State<span style="color:red;">*</span></label>                                        
                                    <select name="admin-state" class="form-control">
                                        <option value="Bihar">Bihar</option>
                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                        <option value="Jharkhand">Jharkhand</option>
                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="admin-district" class="col-form-label">District<span style="color:red;">*</span></label>                                        
                                    <select name="admin-district" class="form-control">
                                        <option value="Bihar">Bihar</option>
                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                        <option value="Jharkhand">Jharkhand</option>
                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="admin-city" class="col-form-label">City<span style="color:red;">*</span></label>                                        
                                    <select name="admin-city" class="form-control">
                                        <option value="Bihar">Bihar</option>
                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                        <option value="Jharkhand">Jharkhand</option>
                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="admin-address" class="col-form-label">Address<span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="admin-address" maxlength="100" required>
                            </div>
                            <div class="form-group">
                                <label for="admin-pin" class="col-form-label">Pin Code<span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="admin-pin" maxlength="6" required>
                            </div>
                            <div class="form-group">
                                <label for="admin-email" class="col-form-label">Email<span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="admin-email" maxlength="50" required>
                            </div>
                            <div class="form-group">
                                <label for="admin-mobile" class="col-form-label">Mobile<span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="admin-mobile" maxlength="10" required>
                            </div>
                            <div class="form-group">
                                    <label for="admin-gender" class="col-form-label">Gender<span style="color:red;">*</span></label>                                        
                                    <select name="admin-gender" class="form-control">
                                        <option value="female">Female</option>
                                        <option value="male">Male</option>
                                        <option value="other">Other</option>                                        
                                    </select>
                                </div>
                            <div class="form-group">                                
                                <center><h6 style="color:red"><%= SuccessMessage%></h6></center>
                            </div>                        
                        </div>
                        <div class="modal-footer">                            
                            <button type="submit" class="btn btn-primary" name="btnsubmit">Save</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <header>
            <div class="container-fluid p-0">
                <!--p-0 to remove padding -- to use class just type .cls and enter(tag auto appears)-->
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">E-Courier/Add Admin</a>
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
            <a href="admin_admin.jsp" class="nav-link text-dark bg-light">
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
        <div>
            <center><h6 style="color:red;z-index:1;"><%= SuccessMessage%></h6></center>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 text-left">
            <!--<a href="" class="btn btn-primary">Add New Data</a>-->
            <!--<button id="show-login" class="btn btn-primary">Add New Data</button>-->
            <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Add New Data</button>-->            
            <a href="admin_admin_add.jsp" class="btn btn-primary">Register Admin</a>
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
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Name</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">State</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">District</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">City</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Address</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Pin</th>
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Email</th>                
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Mobile</th>                
                <th class="col-md-1 col-lg-1 col-xl-1 text-center">Gender</th>                
            </tr>
        </thead>
        <form action="admin_admin.jsp">
            <tbody>
                <%

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "root");
                        Statement st = conn.createStatement();
                        ResultSet res;
                        String qry = request.getParameter("q");
                        String data;
                        if (qry != null) {
                            data = "select a_name,a_state,a_district,a_city,a_address,a_pin,a_email,a_mob,a_gender from admin where a_name='" + qry + "' or a_state='" + qry + "' or a_district='" + qry + "' or a_city='" + qry + "' or a_address='" + qry + "' or a_pin='" + qry + "' or a_email='" + qry + "' or a_mob='"+qry+"' or a_gender='"+qry+"'";
                        } else {
                            data = "select a_name,a_state,a_district,a_city,a_address,a_pin,a_email,a_mob,a_gender from admin";
                        }
                        res = st.executeQuery(data);
                        while (res.next()) {
                %>

                <tr>                    
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("a_name")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("a_state")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("a_district")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("a_city")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("a_address")%></td>  
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("a_pin")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("a_email")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("a_mob")%></td>
                    <td class="col-md-1 col-lg-1 col-xl-1 text-center"><%=res.getString("a_gender")%></td>                                        
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

<script type="text/javascript">
    function checkpass()
    {
        var pass1 = document.getElementById("inputPassword1").value;
        var pass2 = document.getElementById("inputPassword2").value;
        if (pass1 != pass2) {
            alert("Your password and retyped password do not match!");
            return false;
        }
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="main.js"></script>
</body>
</html>
