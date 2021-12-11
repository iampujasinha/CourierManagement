<%-- 
    Document   : admin
    Created on : 21 Jun, 2021, 7:01:32 PM
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
        <%
            Boolean flag = false;
            String SuccessMessage = "";

            String b_id = request.getParameter("b_id");//id sended from edit a href of admin_branch.jsp!
            // When page refreshed this b_id disappears. So use below id for updation purpose.

            String id = request.getParameter("branch-id");
            String name = request.getParameter("branch-name");
            String mob=request.getParameter("branch-mob");
            String email=request.getParameter("branch-email");
            String state = request.getParameter("branch-state");
            String district = request.getParameter("branch-district");
            String city = request.getParameter("branch-city");
            String address = request.getParameter("branch-address");
            String pin = request.getParameter("branch-pin");
            String isactive = request.getParameter("branch-isactive");
            int isac;
            if (isactive == "yes") {
                isac = 1;
            } else {
                isac = 0;
            }
            if (id != null && name!=null && mob!=null && email!=null && state!=null && district!=null && city!=null && address!=null && pin!=null && isactive!=null) {
                try {
                    if (request.getParameter("btnupdate") != null) {
                        Connection con = CommonUtility.getCon();
                        Statement st = con.createStatement();
                        int i = st.executeUpdate("update branch set b_name='" + name + "',b_state='" + state + "',b_district='" + district + "',b_city='" + city + "',b_address='" + address + "',b_pin='" + pin + "',b_email='"+email+"',b_mob='"+mob+"',b_isactive='" + isac + "' where b_id='" + id + "'");
                        if (i > 0) {
                            SuccessMessage = "Branch Successfully Updated!";
                            flag = true;
                        } else {
                            SuccessMessage = "Branch Updation Failed!";
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
                        <a class="navbar-brand" href="#">E-Courier/Branch/Edit</a>
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
        <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
            <i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold"></small>
        </button>
        <div class="col-sm-3"></div>
        <h5 class="col-sm-4 display-5 text-center" style="background-color: #accffe;padding:20px;">REGISTER BRANCH</h5>
    </div>
    <div>
        <center><h6 style="color:red;z-index:1;"><%= SuccessMessage%></h6></center>
    </div>
    <form method="post" onsubmit="return checkpass();" action="admin_branch_edit.jsp">
        <div style="background-color:#61CACC; align:center;overflow:hidden;"><br>                 
            <%
                try {
                    Connection con = CommonUtility.getCon();
                    Statement st = con.createStatement();
                    ResultSet res;
                    String data;
                    data = "select * from branch where b_id='" + b_id + "'";
                    res = st.executeQuery(data);
                    while (res.next()) {
            %>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">      
                <div class="col-sm-4"></div>
                <div class="col-sm-3">
                    <label for="branch-id" class="col-form-label">BranchID<span style="color:red;">*</span></label>
                    <input type="text" name="branch-id" class="form-control" id="branch-id" maxlength="3" placeholder="Enter Admin ID" value='<%=res.getString("b_id")%>' readOnly="true" required>
                </div>
                <!--<div class="col-sm-3">
                    <label for="inputid1" class="col-sm-1 col-form-label">Name</label>
                    <input type="text" name="branch-name" class="form-control" id="branch-name" value='<%=res.getString("b_name")%>' placeholder="Enter Admin Name" required>
                </div>-->
            </div>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">
                <div class="col-sm-1"></div>
                <div class="form-group col-sm-3">
                    <label for="branch-name" class="col-form-label">Name<span style="color:red;">*</span></label>                                        
                    <input type="text" name="branch-name" class="form-control" id="branch-name" maxlength="25" value='<%=res.getString("b_name")%>' placeholder="Enter Name" required>
                </div>
                <div class="form-group col-sm-3">
                    <label for="branch-mob" class="col-form-label">Mobile<span style="color:red;">*</span></label>                                        
                    <input type="text" name="branch-mob" id="branch-mob" class="form-control" maxlength="10" id="branch-mob" value='<%=res.getString("b_mob")%>' placeholder="Enter Mobile" required>
                </div>
                <div class="form-group col-sm-3">
                    <label for="branch-email" class="col-form-label">Email<span style="color:red;">*</span></label>                                        
                    <input type="text" name="branch-email" id="branch-email" class="form-control" maxlength="50" id="branch-email" value='<%=res.getString("b_email")%>' placeholder="Enter Email" required>
                </div>
            </div>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">
                <div class="col-sm-1"></div>
                <div class="form-group col-sm-3">
                    <label for="branch-state" class="col-form-label">State<span style="color:red;">*</span></label>                       
                    <!--<input type="text" name="branch-state" class="form-control" id="branch-state" value='<%=res.getString("b_state")%>' placeholder="Enter State Name" required>-->
                    <select name="branch-state" class="form-control">
                        <%                            
                            if (res.getString("b_state").equals("Bihar")) {
                        %>
                        <option value="Bihar" selected="selected">Bihar</option>
                        <%
                        } else {
                        %>
                        <option value="Bihar">Bihar</option>
                        <%
                            }
                            if (res.getString("b_state").equals("Uttar Pradesh")) {
                        %>
                        <option value="Uttar Pradesh" selected="selected">Uttar Pradesh</option>
                        <%
                        } else {
                        %>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <%
                            }
                            if (res.getString("b_state").equals("Jharkhand")) {
                        %>        
                        <option value="Jharkhand" selected="selected">Jharkhand</option>
                        <%
                        } else {
                        %>
                        <option value="Jharkhand">Jharkhand</option>
                        <%
                            }
                            if (res.getString("b_state").equals("Madhya Pradesh")) {
                        %>        
                        <option value="Madhya Pradesh" selected="selected">Madhya Pradesh</option>
                        <%
                        } else {
                        %>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <%
                        }
                        %>                        
                    </select>
                </div>
                <div class="form-group col-sm-3">
                    <label for="branch-district" class="col-form-label">District<span style="color:red;">*</span></label>                                        
                    <!--<input type="text" name="branch-district" class="form-control" id="branch-district" value='<%=res.getString("b_district")%>' placeholder="Enter District Name" required>-->
                    <select name="branch-district" class="form-control">
                        <%                            
                            if (res.getString("b_district").equals("Bihar")) {
                        %>
                        <option value="Bihar" selected="selected">Bihar</option>
                        <%
                        } else {
                        %>
                        <option value="Bihar">Bihar</option>
                        <%
                            }
                            if (res.getString("b_district").equals("Uttar Pradesh")) {
                        %>
                        <option value="Uttar Pradesh" selected="selected">Uttar Pradesh</option>
                        <%
                        } else {
                        %>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <%
                            }
                            if (res.getString("b_district").equals("Jharkhand")) {
                        %>        
                        <option value="Jharkhand" selected="selected">Jharkhand</option>
                        <%
                        } else {
                        %>
                        <option value="Jharkhand">Jharkhand</option>
                        <%
                            }
                            if (res.getString("b_district").equals("Madhya Pradesh")) {
                        %>        
                        <option value="Madhya Pradesh" selected="selected">Madhya Pradesh</option>
                        <%
                        } else {
                        %>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <%
                        }
                        %>                        
                    </select>
                </div>
                <div class="form-group col-sm-3">
                    <label for="branch-city" class="col-form-label">City<span style="color:red;">*</span></label>                                        
                    <!--<input type="text" name="branch-city" class="form-control" id="branch-city" value='<%=res.getString("b_city")%>' placeholder="Enter City Name" required>-->
                    <select name="branch-city" class="form-control">
                        <%                            
                            if (res.getString("b_city").equals("Bihar")) {
                        %>
                        <option value="Bihar" selected="selected">Bihar</option>
                        <%
                        } else {
                        %>
                        <option value="Bihar">Bihar</option>
                        <%
                            }
                            if (res.getString("b_city").equals("Uttar Pradesh")) {
                        %>
                        <option value="Uttar Pradesh" selected="selected">Uttar Pradesh</option>
                        <%
                        } else {
                        %>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <%
                            }
                            if (res.getString("b_city").equals("Jharkhand")) {
                        %>        
                        <option value="Jharkhand" selected="selected">Jharkhand</option>
                        <%
                        } else {
                        %>
                        <option value="Jharkhand">Jharkhand</option>
                        <%
                            }
                            if (res.getString("b_city").equals("Madhya Pradesh")) {
                        %>        
                        <option value="Madhya Pradesh" selected="selected">Madhya Pradesh</option>
                        <%
                        } else {
                        %>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <%
                        }
                        %>                        
                    </select>
                </div>
            </div>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">
                <div class="col-sm-1"></div>
                <div class="col-sm-3">
                    <label for="branch-address" class="col-form-label">Address<span style="color:red;">*</span></label>
                    <input type="text" class="form-control" name="branch-address" id="branch-address" maxlength="100" value='<%=res.getString("b_address")%>' required>
                </div>
                <div class="col-sm-3">
                    <label for="branch-pin" class="col-form-label">Pin Code<span style="color:red;">*</span></label>
                    <input type="text" class="form-control" name="branch-pin" id="branch-pin" maxlength="6" value='<%=res.getString("b_pin")%>' required>
                </div>
                <div class="col-sm-3">
                    <label for="branch-isactive" class="col-form-label">Active Status<span style="color:red;">*</span></label>                                        
                    <select name="branch-isactive" class="form-control">
                        <%
                            if (res.getInt("b_isactive") == 1) {
                        %>
                        <option value="1" selected="selected">Yes</option>
                        <%
                        } else {
                        %>
                        <option value="1">Yes</option>
                        <%
                            }
                            if (res.getInt("b_isactive") == 0) {
                        %>
                        <option value="0" selected="selected">No</option>
                        <%
                        } else {
                        %>
                        <option value="0">No</option>
                        <%
                            }
                        %>
                    </select>
                </div>           
            </div>
            <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                <div class="col-sm-12 text-center">
                    <button type="submit" class="btn btn-danger" name="btnupdate">Update</button>
                    <a href="admin_branch.jsp" class="btn btn-secondary">Cancel</a>
                </div>
            </div>
            <center><h6 style="color:red"><%= SuccessMessage%></h6></center>
                <% }
                    }catch (Exception e) {
                        System.out.print(e);
                        e.printStackTrace();
                    }
                %>
        </div>
    </form>    
</div>                

<script type="text/javascript">
    function checkpass()
    {
        var apin = document.getElementById("branch-pin").value;
        var aemail = document.getElementById("branch-email").value;
        var amobile = document.getElementById("branch-mob").value;
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (isNaN(apin)) {
            alert("Enter only numeric value in pin code");
            document.getElementById("branch-pin").focus();
            return false;
        }
        if (apin.length < 6) {
            alert("Enter 6 digit pin code only");
            document.getElementById("branch-pin").focus();
            return false;
        }
        if (!filter.test(aemail)) {
            alert("Plz provide valid email address");
            document.getElementById("branch-email").focus();
            return false;
        }
        if(isNaN(amobile)){
            alert("Enter only numeric value in mobile no");
            document.getElementById("branch-mob").focus();
            return false;
        }
        if (amobile.length < 10) {
            alert("Enter 10 digit mobile no only");
            document.getElementById("branch-mob").focus();
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