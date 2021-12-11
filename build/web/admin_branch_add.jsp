<%-- 
    Document   : admin_branch_add
    Created on : 27 Sep, 2021, 9:16:39 PM
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

    </head>
    <body>
        <%String SuccessMessage = "";
            Boolean flag = false;
            String aid = request.getParameter("aid");
            String aname = request.getParameter("aname");
            String astate = request.getParameter("astate");
            String adistrict = request.getParameter("adistrict");
            String acity = request.getParameter("acity");
            String aaddress = request.getParameter("aaddress");
            String apin = request.getParameter("apin");
            String aemail = request.getParameter("aemail");
            String amob = request.getParameter("amob");
            int aisa = 1;
            //out.println(aid+aname+astate+adistrict+acity+aaddress+apin+aemail+amob+aisa);
            if (aid != null || aname != null || astate != null || adistrict != null || acity != null || aaddress != null || apin != null || aemail != null || amob != null) {
                try {
                    if (request.getParameter("btnsubmit") != null) {

                        Connection con = CommonUtility.getCon();
                        Statement st = con.createStatement();
                        String qry = "select * from branch where b_email='" + aemail + "'";
                        ResultSet rs = st.executeQuery(qry);

                        if (rs.next()) {
                            SuccessMessage = "Email has already been in use!";
                            flag = true;
                        } else {
                            /*int j = st.executeUpdate("insert into branch(b_id,b_name,b_state,b_district,b_city,b_address,b_pin,b_email,b_mob,b_isactive)values('" + aid + "','" + aname + "','" + astate + "','" + adistrict + "','" + acity + "','" + aaddress + "','" + apin + "','" + aemail + "','" + amob + "','"+aisa+"')");
                            if (j > 0) {
                                SuccessMessage = "Branch Successfully Registered!";
                                flag = true;
                            } else {
                                SuccessMessage = "Email already exists, kindly choose new one";
                                flag = true;
                            }*/                            
                            PreparedStatement ps = con.prepareStatement("insert into branch values(?,?,?,?,?,?,?,?,?,?)");
                            ps.setString(1, aid);
                            ps.setString(2, aname);
                            ps.setString(3, astate);
                            ps.setString(4, adistrict);
                            ps.setString(5, acity);
                            ps.setString(6, aaddress);
                            ps.setString(7, apin);
                            ps.setString(8, aemail);
                            ps.setString(9, amob);
                            ps.setInt(10, aisa);
                            ps.executeUpdate();
                            SuccessMessage = "Branch Successfully Registered!";
                        }
                    }
                } catch (Exception e) {
                    System.out.print(e);
                    e.printStackTrace();
                }
            }
        %>

        <header>
            <div class="container-fluid p-0">
                <!--p-0 to remove padding -- to use class just type .cls and enter(tag auto appears)-->
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">E-Courier/Add Branch</a>
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
        <button id="sidebarCollapse" type="button" class="col-sm-1 btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
            <i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold"></small>
        </button>
        <div class="col-sm-3"></div>
        <h5 class="col-sm-4 display-5 text-center" style="background-color: #accffe;padding:20px;">REGISTER BRANCH</h5>
    </div>    
    <div>
        <center><h6 style="color:red;z-index:1;"><%= SuccessMessage%></h6></center>
    </div>
    <form method="post" onsubmit="return checkpass();" action="admin_branch_add.jsp">
        <div style="background-color:#61CACC; align:center;overflow:hidden;"><br>                 
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">
                <label for="aid" class="col-sm-2 col-form-label">ID<span style="color:red;">*</span></label>                
                <div class="col-sm-4">
                    <%
                        String aaid = "";
                        int branchno = 0;
                        try {
                            Connection con = CommonUtility.getCon();
                            Statement st = con.createStatement();
                            ResultSet res;
                            String strQuery = "SELECT COUNT(*) FROM branch";
                            ResultSet rs = st.executeQuery(strQuery);
                            String Countrow = "";
                            while (rs.next()) {
                                Countrow = rs.getString(1);
                            }
                            String data = Countrow.toString();
                            branchno = Integer.valueOf(Countrow);
                            if (branchno == 0) {
                                branchno = 1;
                            } else {
                                branchno++;
                            }
                            aaid = "b" + Integer.toString(branchno);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    <input type="text" name="aid" class="form-control" value="<%=aaid%>" id="aid" maxlength="3" required readOnly="true">
                    <!--<label for="aid1" class="col-form-label" value=""></label>-->
                </div>                
            </div>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">
                <label for="aname" class="col-sm-2 col-form-label">Name<span style="color:red;">*</span></label>                
                <div class="col-sm-4">
                    <input type="text" name="aname" class="form-control" id="aname" maxlength="25" placeholder="Enter Name" required>
                </div>
                <label for="astate" class="col-sm-2 col-form-label">State<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <select name="astate" name="astate" class="form-control">
                        <option value="Bihar">Bihar</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                    </select>
                </div>
            </div>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                <label for="adistrict" class="col-sm-2 col-form-label">District<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <select name="adistrict" name="adistrict" class="form-control">
                        <option value="Bihar">Bihar</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                    </select>
                </div>
                <label for="acity" class="col-sm-2 col-form-label">City<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <select name="acity" name="acity" class="form-control">
                        <option value="Bihar">Bihar</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                    </select>
                </div>
            </div>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                <label for="aaddress" class="col-sm-2 col-form-label">Address<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <input type="text" name="aaddress" class="form-control" id="aaddress" maxlength="100" placeholder="Enter Address" required>
                </div>
                <label for="apin" class="col-sm-2 col-form-label">Pin Code<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <input type="text" name="apin" class="form-control" id="apin" maxlength="6" placeholder="Enter Pin Code" required>
                </div>
            </div>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                <label for="aemail" class="col-sm-2 col-form-label">Email<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <input type="text" name="aemail" class="form-control" id="aemail" maxlength="50" placeholder="Enter Email" required>
                </div>
                <label for="amobile" class="col-sm-2 col-form-label">Mobile<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <input type="text" name="amob" class="form-control" id="amob" maxlength="10" placeholder="Enter Mobile" required>
                </div>
            </div>            
            <div class="form-group row">
                <div class="col-sm-12 text-center">
                    <button type="submit" class="btn btn-danger" name="btnsubmit">Add Branch</button>
                    <a href="admin_branch.jsp" class="btn btn-primary">Cancel</a>
                </div>
            </div>
        </div>
    </form>    
</div>                

<script type="text/javascript">
    function checkpass()
    {
        var apin = document.getElementById("apin").value;
        var aemail = document.getElementById("aemail").value;
        var amobile = document.getElementById("amob").value;
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (isNaN(apin)) {
            alert("Enter only numeric value in pin code");
            document.getElementById("apin").focus();
            return false;
        }
        if (apin.length < 6) {
            alert("Enter 6 digit pin code only");
            document.getElementById("apin").focus();
            return false;
        }
        if (!filter.test(aemail)) {
            alert("Plz provide valid email address");
            document.getElementById("aemail").focus();
            return false;
        }
        if(isNaN(amobile)){
            alert("Enter only numeric value in mobile no");
            document.getElementById("amob").focus();
            return false;
        }
        if (amobile.length < 10) {
            alert("Enter 10 digit mobile no only");
            document.getElementById("amob").focus();
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