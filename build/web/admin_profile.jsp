<%-- 
    Document   : admin_profile
    Created on : 10 Oct, 2021, 8:29:59 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <title>CMS</title>
        <link rel="stylesheet" type="text/css" href="./profile_para/style_profile.css">
        
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!--<meta http-equiv="X-UA-Compatible" content="ie=edge" />-->        

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous" />
    </head>
    <body>
        <header>
            <a href="#" class="logo">E-Courier</a>
            <ul>                
                <li><a href="admin.jsp" class="active" style="margin-left: 970px;">Go Back</a></li>
            </ul>
        </header>
        <section>
            <img src="./images/stars.png" id="stars">
            <img src="./images/moon.png" id="moon">
            <img src="./images/mountains_behind.png" id="mountains_behind">
            <h2 id="text">Name Here</h2>
            <a href="#" id="btn" style="margin-left:500px;">Admin</a>            
            <img src="./images/mountains_front.png" id="mountains_front">
        </section>
        <div class="sec" id="sec">
            <!--<h2>Parallax Scrolling Effects</h2>
            <p>This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.Tt.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.<br><br>This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.<br><br></p>-->
            <div style="background-color:#61CACC; align:center;overflow:hidden;"><br>                 
                <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">
                    <label for="aname" class="col-sm-2 col-form-label">Name<span style="color:red;">*</span></label>                
                    <div class="col-sm-4">
                        <input type="text" name="aname" class="form-control" id="aname" placeholder="Enter Name" readonly="true">
                    </div>
                    <label for="astate" class="col-sm-2 col-form-label">State<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="astate" class="form-control" id="astate" placeholder="State" readonly="true">
                    </div>
                </div>
                <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                    <label for="adistrict" class="col-sm-2 col-form-label">District<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="adistrict" class="form-control" id="adistrict" placeholder="District" readonly="true">
                    </div>
                    <label for="acity" class="col-sm-2 col-form-label">City<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="acity" class="form-control" id="acity" placeholder="City" readonly="true">
                    </div>
                </div>
                <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                    <label for="aaddress" class="col-sm-2 col-form-label">Address<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="aaddress" class="form-control" id="aaddress" placeholder="Enter Address"  readonly="true">
                    </div>
                    <label for="apin" class="col-sm-2 col-form-label">Pin Code<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="apin" class="form-control" id="apin" placeholder="Enter Pin Code"  readonly="true">
                    </div>
                </div>
                <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                    <label for="aemail" class="col-sm-2 col-form-label">Email<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="aemail" class="form-control" id="aemail" placeholder="Enter Email"  readonly="true">
                    </div>
                    <label for="amobile" class="col-sm-2 col-form-label">Mobile<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="amob" class="form-control" id="amob" placeholder="Enter Mobile"  readonly="true">
                    </div>
                </div>
                <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                    <label for="inputid1" class="col-sm-2 col-form-label">Gender<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="agender" class="form-control" id="agender" placeholder="Gender"  readonly="true">
                    </div>
                    <label for="arole" class="col-sm-2 col-form-label">Role<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="arole" class="form-control" id="arole" placeholder="Role"  readonly="true">
                    </div>
                </div>                
                <div class="form-group row">
                    <div class="col-sm-12 text-center">
                        <a href="admin_profile_update.jsp" class="btn btn-danger" name="btnsubmit">Update Profile?</a>
                    </div>
                </div>
            </div>
        </div>        
    </body>
    <script>
        let stars = document.getElementById('stars');
        let moon = document.getElementById('moon');
        let mountains_behind = document.getElementById('mountains_behind');
        let text = document.getElementById('text');
        let btn = document.getElementById('btn');
        let mountains_front = document.getElementById('mountains_front');
        let header = document.querySelector('header');

        window.addEventListener('scroll', function () {
            let value = window.scrollY;
            stars.style.left = value + 0.25 + 'px';
            moon.style.top = value + 1.05 + 'px';
            mountains_behind.style.top = value + 0.5 + 'px';
            mountains_front.style.top = value + 0 + 'px';
            text.style.marginRight = value + 4 + 'px';
            text.style.marginTop = value + 1.5 + 'px';
            btn.style.marginTop = value + 1.5 + 'px';
            header.style.top = value + 0.5 + 'px';
        })
    </script>
</html>
