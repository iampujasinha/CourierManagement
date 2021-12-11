<%-- 
    Document   : admin_profile_pass
    Created on : 24 Oct, 2021, 6:06:06 PM
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
              crossorigin="anonymous">
    </head>
    <body>
        <header>
            <a href="#" class="logo">E-Courier</a>
            <ul>                
                <li><a href="admin_profile.jsp" class="active" style="margin-left: 970px;">Go Back</a></li>
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
            <form action="" method="post" onsubmit="return checkpass();">                
                <div style="background-color:#61CACC; align:center;overflow:hidden;"><br> 
                    <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                        <label for="apass1" class="col-sm-2 col-form-label">Current Password<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <input type="password" name="cpass1" class="form-control" id="cpass1" maxlength="15" placeholder="Enter Curent Password" required>
                        </div>
                        <label for="apass2" class="col-sm-2 col-form-label">Retype Password<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <input type="password" name="cpass2" class="form-control" id="cpass2" maxlength="15" placeholder="Retype Current Password" required>
                        </div>
                    </div>
                    <div class="form-group row" style="padding-left: 30px;padding-right: 30px;">                
                        <label for="apass1" class="col-sm-2 col-form-label">Password<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <input type="password" name="apass1" class="form-control" id="apass1" maxlength="15" placeholder="Enter New Password" required>
                        </div>
                        <label for="apass2" class="col-sm-2 col-form-label">Retype Password<span style="color:red;">*</span></label>
                        <div class="col-sm-4">
                            <input type="password" name="apass2" class="form-control" id="apass2" maxlength="15" placeholder="Retype New Password" required>
                        </div>
                    </div>              
                    <div class="form-group row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-2 text-center">
                            <a href="admin_profile_update.jsp" class="btn btn-danger" name="btnsubmit">Update Password</a>
                        </div><br>
                        <div class="col-sm-2 text-center">
                            <a href="admin_profile.jsp" class="btn btn-primary" name="btncancel">Cancel</a>
                        </div>
                    </div>
                </div>
            </form>
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