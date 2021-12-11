<%-- 
    Document   : admin_profile_update
    Created on : 10 Oct, 2021, 8:49:35 PM
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
                <li><a href="staff_profile.jsp" class="active" style="margin-left: 970px;">Go Back</a></li>
            </ul>
        </header>
        <section>
            <img src="./images/stars.png" id="stars">
            <img src="./images/moon.png" id="moon">
            <img src="./images/mountains_behind.png" id="mountains_behind">
            <h2 id="text">Name Here</h2>
            <a href="#" id="btn" style="margin-left:450px;">Update Your Profile</a>            
            <img src="./images/mountains_front.png" id="mountains_front">
        </section>
        <div class="sec" id="sec">
            <!--<h2>Parallax Scrolling Effects</h2>
            <p>This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.Tt.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.<br><br>This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.This is that.<br><br></p>-->
            <div style="background-color:#61CACC; align:center;overflow:hidden;"><br>                 
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
                        <input type="text" name="aemail" class="form-control" id="aemail" maxlength="50" placeholder="Enter Email" readonly="true">
                    </div>
                    <label for="amobile" class="col-sm-2 col-form-label">Mobile<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="amob" class="form-control" id="amob" maxlength="10" placeholder="Enter Mobile" readonly="true">
                    </div>
                </div>
                <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                    <label for="inputid1" class="col-sm-2 col-form-label">Gender<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <select name="agender" class="form-control">
                            <option value="female">Female</option>
                            <option value="male">Male</option>                        
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <label for="arole" class="col-sm-2 col-form-label">Role<span style="color:red;">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" name="arole" class="form-control" id="arole" maxlength="10" placeholder="Enter Mobile" required>
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
                    <div class="col-sm-4"></div>
                    <div class="col-sm-2 text-center">
                        <a href="staff_profile_update.jsp" class="btn btn-danger" name="btnsubmit">Update Profile</a>
                    </div><br>
                    <div class="col-sm-2 text-center">
                        <a href="staff_profile.jsp" class="btn btn-primary" name="btncancel">Cancel</a>
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