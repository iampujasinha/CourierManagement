<%-- 
    Document   : login
    Created on : 10 Oct, 2021, 10:14:14 PM
    Author     : Dell
--%>

<%@page import="com.puja.customer.dao.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <meta charset="utf-8">
        <title>CMS Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- LINEARICONS -->
        <link rel="stylesheet" href="./login/fonts/linearicons/style.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="./login/css/style.css">
        <style>
            #captchaBackground {
                height: 70px;
                width: 250px;
                background-color: #2d3748;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
            }
        </style>
    </head>
    <body>
        <%
            String admin_email = request.getParameter("l_id");
            String admin_pass = request.getParameter("l_pass");
            String textBox = request.getParameter("textBox");
            if (admin_email != null && admin_pass != null && textBox != null) {
                try {
                    if (request.getParameter("btnlogin") != null) {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DB.getConnection();
                        Statement st = conn.createStatement();
                        String qry = "select * from users where u_email='" + admin_email + "' and u_password='" + admin_pass + "'";
                        System.out.println("SimplifiedJSPServlet.mergedScriptlets()"+qry);
                        ResultSet rs = st.executeQuery(qry);
                        if (rs.next()) {
                            String uid = rs.getString("u_id");
                            HttpSession ses = request.getSession();
                            ses.setAttribute("user_id", uid);
                            String urole = rs.getString("u_role");
                            ses.setAttribute("user_role", urole);                            
                            if (urole.equals("admin")) {
                                response.sendRedirect("admin.jsp");
                            }
                            else if(urole.equals("staff")){                                
                                response.sendRedirect("staff.jsp");
                            }
                            else{
                                response.sendRedirect("customer");
                            }
                        } else {
                            out.println("Invalid Credentials!!");
                        }
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
            }else{
                System.out.println("Apoorv");
            }
        %>
        <div class="wrapper">
            <div class="inner">
                <img src="./login/images/image-1.png" alt="" class="image-1" style="width:245px;">
<!--                <form action="" method="post" onsubmit="return checkcap()">-->
<form action="" method="post" onsubmit="return checkcap()">                    
<h3>Login</h3>
                    <div class="form-holder">
                        <span class="lnr lnr-user"></span>
                        <input type="text" value="" class="form-control" name="l_id" id="l_id" placeholder="User ID" required>
                    </div>
                    <!--div class="form-holder">
                        <span class="lnr lnr-phone-handset"></span>
                        <input type="text" class="form-control" placeholder="Phone Number">
                    </div>
                    <div class="form-holder">
                        <span class="lnr lnr-envelope"></span>
                        <input type="text" class="form-control" placeholder="Mail">
                    </div>-->
                    <div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <input type="password" value="" class="form-control" name="l_pass" id="l_pass" placeholder="Password" required>
                    </div>
                    <!--<div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <input type="password" class="form-control" placeholder="Confirm Password">
                    </div>-->


                    <!--<canvas id="captcha">captcha text</canvas>-->
                    <div id="captchaBackground" class="form-holder">
                        <i><canvas id="captcha">captcha text</canvas></i>
                        <b><span id="refreshButton" type="submit" style="background-color: grey;left:280px;cursor:pointer;"><span class="lnr lnr-redo"></span></span></b>
                    </div>
                    <div class="form-holder">
                        <input id="textBox" name="textBox" type="text" name="text" class="form-control" placeholder="Type Above Text" required>                        
                    </div>
                    <span id="output" style="background-color:pink;"></span>
                    <button type="submit" name="btnlogin" id="submitButton">LOGIN
                        <!--<span>Register</span>-->

                        <!--<span><input id="submitButton" type="submit" style=""></span>-->
                        <!--<span id="submitButton">LOGIN</span>-->
                    </button>
                </form>
                <img src="./login/images/image-2.png" alt="" class="image-2">
            </div>

        </div>

        <script src="./login/js/jquery-3.3.1.min.js"></script>
        <!--<script src="./login/js/main.js"></script>-->
        <!--<script src="./captcha/script.js"></script>-->
        <script type="text/javascript">
                    // document.querySelector() is used to select an element from the document using its ID
                    let captchaText = document.querySelector('#captcha');
                    var ctx = captchaText.getContext("2d");
                    ctx.font = "30px Roboto";
                    ctx.fillStyle = "#08e5ff";

                    let userText = document.querySelector('#textBox');
                    let submitButton = document.querySelector('#submitButton');
                    let output = document.querySelector('#output');
                    let refreshButton = document.querySelector('#refreshButton');

// alphaNums contains the characters with which you want to create the CAPTCHA
                    let alphaNums = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
                    let emptyArr = [];
// This loop generates a random string of 7 characters using alphaNums
// Further this string is displayed as a CAPTCHA
                    for (let i = 1; i <= 7; i++) {
                        emptyArr.push(alphaNums[Math.floor(Math.random() * alphaNums.length)]);
                    }
                    var c = emptyArr.join('');
                    ctx.fillText(emptyArr.join(''), captchaText.width / 4, captchaText.height / 2);

// This event listener is stimulated whenever the user press the "Enter" button
// "Correct!" or "Incorrect, please try again" message is
// displayed after validating the input text with CAPTCHA                        
                    function checkcap() {
                        /*    userText.addEventListener('keyup', function (e) {*/
                        // Key Code Value of "Enter" Button is 13
                        /*if (e.keyCode === 13) {
                         if (userText.value === c) {
                         output.classList.add("correctCaptcha");
                         output.innerHTML = "Correct!";
                         return true;
                         } else {
                         output.classList.add("incorrectCaptcha");
                         output.innerHTML = "Incorrect, please try again";
                         alert("Incorrect captcha");
                         return false;
                         }
                         }
                         });*/
// This event listener is stimulated whenever the user clicks the "Submit" button
// "Correct!" or "Incorrect, please try again" message is
// displayed after validating the input text with CAPTCHA
                        //submitButton.addEventListener('click', function () {
                        if (userText.value === c) {
                            //output.classList.add("correctCaptcha");
                            //output.innerHTML = "Correct!";
                            return true;
                        } else {
                            output.classList.add("incorrectCaptcha");
                            output.innerHTML = "Incorrect Captcha, please try again";
                            alert("Incorrect captcha");
                            return false;
                        }
                        //});
                    }
// This event listener is stimulated whenever the user press the "Refresh" button
// A new random CAPTCHA is generated and displayed after the user clicks the "Refresh" button
                    refreshButton.addEventListener('click', function () {
                        userText.value = "";
                        let refreshArr = [];
                        for (let j = 1; j <= 7; j++) {
                            refreshArr.push(alphaNums[Math.floor(Math.random() * alphaNums.length)]);
                        }
                        ctx.clearRect(0, 0, captchaText.width, captchaText.height);
                        c = refreshArr.join('');
                        ctx.fillText(refreshArr.join(''), captchaText.width / 4, captchaText.height / 2);
                        output.innerHTML = "";
                    }
                    );
        </script>
    </body>
</html>
