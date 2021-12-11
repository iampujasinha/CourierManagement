<%-- 
    Document   : registration_customer
    Created on : 12 Oct, 2021, 8:17:35 PM
    Author     : Dell
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="commonutility.CommonUtility"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>CMS Registration</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fontaw/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
              crossorigin="anonymous">
        <link rel="stylesheet" href="./reg/fonts/material-icon/css/material-design-iconic-font.min.css">        

        <!-- Main css -->
        <link rel="stylesheet" href="./reg/css/style.css">
    </head>
    <!--<body style="background: #599fd9;
          background-image: linear-gradient(135.9deg,rgba(109,25,252,1)16.4%,rgba(125,31,101)56.1%);">-->
    <body style="background-color: #accffe;">
        <%String SuccessMessage = "";
//        System.out.println("a1");
            Boolean flag = false;
            int acustno;
            String acustid = "";
            String apass1 = request.getParameter("apass");
            String aname = request.getParameter("aname");
            String astate = request.getParameter("astate");
            String adistrict = request.getParameter("adistrict");
            String acity = request.getParameter("acity");
            String aaddress = request.getParameter("aaddress");
            String apin = request.getParameter("apin");
            String aemail = request.getParameter("aemail");
            String amob = request.getParameter("amob");
            String agender = request.getParameter("agender");            
            //out.println(acustid+apass1+aname+astate+adistrict+acity+aaddress+apin+aemail+amob+agender);
            if (apass1 != null && aname != null && astate != null && adistrict != null && acity != null && aaddress != null && apin != null && aemail != null && amob != null && agender != null) {
                try {
                    if (request.getParameter("submit") != null) {

                        Connection con = CommonUtility.getCon();
                        Statement st = con.createStatement();

                        String strQuery = "SELECT COUNT(*) FROM customer";
                        ResultSet rs = st.executeQuery(strQuery);
                        String Countrow = "";
                        while (rs.next()) {
                            Countrow = rs.getString(1);
                            //out.println(Countrow);
                        }
                        String data = Countrow.toString();
                        acustno = Integer.valueOf(Countrow);
                        if (acustno == 0) {
                            acustno = 1;
                        } else {
                            acustno++;
                        }
                        acustid = "c" + Integer.toString(acustno);
                        //out.println(adminid);

                        String qry = "select * from customer where c_email='" + aemail + "'";
                        //int j = st.executeUpdate("select * from users where userid='"+id1+"'");
                        rs = st.executeQuery(qry);

                        if (rs.next()) {
                            SuccessMessage = "Email has already been in use!";
                            flag = true;
                        } else {
                            PreparedStatement ps = con.prepareStatement("insert into users(u_id,u_password,u_role,u_email) values(?,?,?,?)");
                            ps.setString(1, acustid);
                            ps.setString(2, apass1);
                            ps.setString(3, "customer");
                            ps.setString(4, aemail);
                            ps.executeUpdate();
                            ps.close();
                            ps = con.prepareStatement("insert into customer(c_id,c_name,c_state,c_district,c_city,c_address,c_pin,c_email,c_mob,c_gender) values(?,?,?,?,?,?,?,?,?,?)");
                            ps.setString(1, acustid);
                            ps.setString(2, aname);
                            ps.setString(3, astate);
                            ps.setString(4, adistrict);
                            ps.setString(5, acity);
                            ps.setString(6, aaddress);
                            ps.setString(7, apin);
                            ps.setString(8, aemail);
                            ps.setString(9, amob);
                            ps.setString(10, agender);
                            ps.executeUpdate();
                            ps.close();
                            rs.close();
                            st.close();
                            con.close();
                            SuccessMessage = "Customer Successfully Registered!";
                        }
                    }
                } catch (Exception e) {
                    System.out.print(e);
                    e.printStackTrace();
                }
            }
        %>
        <div class="main">
            <div>
                <center><h4 style="color:red;z-index:1;"><%= SuccessMessage%></h4></center>
            </div>
            <div class="container">
                <div class="signup-content">                                        
                    <div class="signup-img" style="background-color:purple;">
                        <!--<img src="./reg/images/signup-img.jpg" alt="">-->
                        <img src="./login/images/image-1.png" style="margin-top: 100px;">
                    </div>                    
                    <!--<a href='' style="text-decoration: none;left:60px;"><span aria-hidden="true" style="left:60px;height:10px;width:10px;">&times;</span></a>-->
                    <div class="signup-form">
                        <form method="POST" class="register-form" id="register-form" action="registration_customer.jsp">
                            <center><h1>REGISTRATION</h1></center><hr>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="aname" id="aname" required/>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="state">State</label>
                                    <select name="astate" class="form-control">
                                        <option value="Bihar">Bihar</option>
                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                        <option value="Jharkhand">Jharkhand</option>
                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="district">District</label>
                                    <select name="adistrict" class="form-control">
                                        <option value="Bihar">Bihar</option>
                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                        <option value="Jharkhand">Jharkhand</option>
                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <select name="acity" class="form-control">
                                        <option value="Bihar">Bihar</option>
                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                        <option value="Jharkhand">Jharkhand</option>
                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" name="aaddress" id="aaddress" required/>
                            </div>
                            <div class="form-group">
                                <label for="pin">Pincode</label>
                                <input type="text" name="apin" id="apin" required>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="email">Email ID</label>
                                    <input type="email" name="aemail" id="aemail" required/>
                                </div>
                                <div class="form-group">
                                    <label for="mobile">Mobile</label>
                                    <input type="mobile" name="amob" id="amob" required/>
                                </div>
                            </div>
                            <div class="form-radio">
                                <label for="gender" class="radio-label">Gender</label>
                                <div class="form-radio-item">
                                    <input type="radio" name="agender" id="female" value="Female" checked>
                                    <label for="female">Female</label>
                                    <span class="check"></span>
                                </div>
                                <div class="form-radio-item">
                                    <input type="radio" name="agender" id="male" value="Male">
                                    <label for="male">Male</label>
                                    <span class="check"></span>
                                </div>                                
                                <div class="form-radio-item">
                                    <input type="radio" name="agender" id="other" value="Other">
                                    <label for="other">Other</label>
                                    <span class="check"></span>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name="apass" id="apass" required/>
                                </div>
                                <div class="form-group">
                                    <label for="password1">Confirm Password</label>
                                    <input type="password" name="apass1" id="apass1" required/>
                                </div>
                            </div>
                            <!--
                            send otp on phone label
                            button
                            text box                            
                            -->
                            <div class="form-group">
                                <label for="email">Send OTP on registered mobile</label>                                
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <input type="button" onclick="return checkmob()" name="otp" id="otp" value="Send OTP" style="background-color:pink;cursor: pointer;"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="aotp" id="aotp" placeholder="Enter OTP.." />
                                </div>
                            </div>
                            <div class="form-submit">
                                <a href="" id="reset" class="reset" name="reset">Back</a>
                                <!--<input type="submit" value="Reset All" class="submit" name="reset" id="reset" />-->
                                <button type="submit" class="submit" name="submit" id="submit">Submit Form</button>
                            </div>
                            <div class="text-center p-t-136">
                                <a class="txt2" href="login.jsp" style="text-decoration: none;cursor:pointer;font-family: Poppins-Regular;font-size: 20px;  line-height: 1.5;color: #666666;">
                                    For SignIn Click Here                                    
                                    <i class="fas fa-long-arrow-alt-right text-primary fa-fw"></i>
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <!-- JS -->
        <script src="./reg/vendor/jquery/jquery.min.js"></script>
        <script src="./reg/js/main.js"></script>
        <script type="text/javascript">
                                        function checkmob() {
                                            let amobi = "";
                                            amobi = document.getElementById("amobile").value;
                                            if (amobi === "") {
                                                alert("Plz enter valid mobile number!!");
                                                return false;
                                            } else {
                                                return true;
                                            }
                                        }
        </script>
    </body>
</html>