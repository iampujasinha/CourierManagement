<%-- 
    Document   : admin_staff_add
    Created on : 28 Sep, 2021, 6:01:12 PM
    Author     : Dell
--%>

<%@page import="java.text.SimpleDateFormat"%>
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
            String agender = request.getParameter("agender");
            String adob = request.getParameter("adob");
            
            String apass1=request.getParameter("apass1");
            if (adob != null) {
                /*SimpleDateFormat DATE_FORMAT=new SimpleDateFormat("dd-MM-yyyy");
            String dob=DATE_FORMAT.format(adob);
            Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(adob);  */
            }

            int aisa = 1;
            //out.println(aid + aname + astate + adistrict + acity + aaddress + apin + aemail + amob + agender + adob + aisa);
            if (aid != null || aname != null || astate != null || adistrict != null || acity != null || aaddress != null || apin != null || aemail != null || amob != null) {
                try {
                    if (request.getParameter("btnsubmit") != null) {

                        Connection con = CommonUtility.getCon();
                        Statement st = con.createStatement();
                        String qry = "select * from branch_staff where bs_email='" + aemail + "'";
                        ResultSet rs = st.executeQuery(qry);

                        if (rs.next()) {
                            SuccessMessage = "Email has already been in use!";
                            flag = true;
                        } else {
                            /*int i = st.executeUpdate("insert into branch_staff(bs_id,bs_name,bs_state,bs_district,bs_city,bs_address,bs_pin,bs_email,bs_mob,bs_gender,bs_dob,bs_isactive)values('" + aid + "','" + aname + "','" + astate + "','" + adistrict + "','" + acity + "','" + aaddress + "','" + apin + "','" + aemail + "','" + amob + "','" + agender + "','" + adob + "','" + aisa + "')");
                            int j = st.executeUpdate("insert into users(u_id,u_password,u_role)values('"+aid+"','"+apass1+"','staff')");
                            if (i > 0 && j > 0) {
                                SuccessMessage = "Branch Staff Successfully Registered!";
                                flag = true;
                            } else {
                                SuccessMessage = "Email already exists, kindly choose new one";
                                flag = true;
                            }*/
                            PreparedStatement ps = con.prepareStatement("insert into branch_staff values(?,?,?,?,?,?,?,?,?,?,?,?)");
                            ps.setString(1, aid);
                            ps.setString(2, aname);
                            ps.setString(3, astate);
                            ps.setString(4, adistrict);
                            ps.setString(5, acity);                            
                            ps.setString(6, apin);
                            ps.setString(7, aaddress);
                            ps.setString(8, aemail);
                            ps.setString(9, amob);
                            ps.setString(10, agender);
                            ps.setString(11, adob);
                            ps.setInt(12, aisa);
                            ps.executeUpdate();                            
                            
                            ps = con.prepareStatement("insert into users values(?,?,?)");
                            ps.setString(1, aid);
                            ps.setString(2, apass1);
                            ps.setString(3, "staff");
                            ps.executeUpdate();
                            SuccessMessage = "Branch Staff Successfully Registered!";
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
                        <a class="navbar-brand" href="#">E-Courier/Add Branch Staff</a>
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
            <a href="admin_profile" class="nav-link text-dark">
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
        <h5 class="col-sm-4 display-5 text-center" style="background-color: #accffe;padding:20px;">REGISTER STAFF</h5>
    </div>    
    <div>
        <center><h6 style="color:red;z-index:1;"><%= SuccessMessage%></h6></center>
    </div>
    <form method="post" onsubmit="return checkpass()" action="">
        <div style="background-color:#61CACC; align:center;overflow:hidden;"><br>                 
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">
                <label for="aid" class="col-sm-2 col-form-label" hidden="true">ID<span style="color:red;">*</span></label>                
                <div class="col-sm-4">
                    <%
                        String aaid = "";
                        int branchno = 0;
                        try {
                            Connection con = CommonUtility.getCon();
                            Statement st = con.createStatement();
                            ResultSet res;
                            String strQuery = "SELECT COUNT(*) FROM branch_staff";
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
                            aaid = "s" + Integer.toString(branchno);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    <input type="text" name="aid" class="form-control" hidden="true" value="<%=aaid%>" id="aid" maxlength="8" required readOnly="true">
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
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                <label for="agender" class="col-sm-2 col-form-label">Gender<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <select name="agender" class="form-control">
                        <option value="Female">Female</option>
                        <option value="Male">Male</option>
                        <option value="Other">Other</option>                        
                    </select>
                </div>
                <label for="dob" class="col-sm-2 col-form-label">Date of Birth<span style="color:red;">*</span></label>
                <div class="col-sm-4">                    
                    <input type="date" class="form-control" name="adob" id="adob" required>                    
                </div>                
            </div>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                <label for="apass1" class="col-sm-2 col-form-label">Password<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <input type="password" name="apass1" class="form-control" id="apass1" maxlength="15" placeholder="Enter Password" required>
                </div>
                <label for="apass2" class="col-sm-2 col-form-label">Retype Password<span style="color:red;">*</span></label>
                <div class="col-sm-4">
                    <input type="password" name="apass2" class="form-control" id="apass2" maxlength="15" placeholder="Retype Password" required>
                </div>
            </div>              
            <div class="form-group row">
                <div class="col-sm-12 text-center">
                    <button type="submit" class="btn btn-danger" name="btnsubmit">Add Branch</button>
                    <a href="admin_staff.jsp" class="btn btn-primary">Cancel</a>
                </div>
            </div>
        </div>
    </form>    
</div>                

<script type="text/javascript">
    function checkpass()
    {
        /*var a=document.getElementById("aid").value;
         alert("Your id is"+a);
         return false;*/
        var pass1 = document.getElementById("apass1").value;
        var pass2 = document.getElementById("apass2").value;
        if (pass1 != pass2) {
            alert("Your password and retyped password do not match!");
            return false;
        }
    }
</script>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->
<script src="main.js"></script>
</body>
</html>