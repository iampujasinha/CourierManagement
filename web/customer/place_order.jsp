<%-- 
    Document   : customerdashboard
    Created on : Sep 24, 2021, 3:30:04 PM
    Author     : Puja Sinha
   
--%>

<%@page import="java.util.List"%>
<%@page import="com.puja.customer.models.Reciepient"%>
<%@page import="com.puja.customer.utils.CustomerUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Courier Customer Place Order Create</title>

        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/bootstrap.css")%>" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" >
        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/Style.css")%>" />
        <link rel="stylesheet" href="<%=CustomerUtil.assets("css/mobile-style.css")%>">

    </head>
    <body class="body-gradient">
        
        <%@include file="header.jsp" %>
        <%@include file="sidebar.jsp" %> 
         

        <div class="page-content p-5" id="content">
            <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
                <i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold"></small>
            </button>
            <div class="container">
                <%@include file="message.jsp" %>
            </div>
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <form class="" method="post" action="">
                            <input class="form-control" value="<%= customer.getC_id() %>" required hidden name="customer_id">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-label">Sender Name</label>
                                    <input class="form-control" value="" name="sender_name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label">Sender Mobile</label>
                                    <input class="form-control" value="" type="text" minlength="10" maxlength="10" name="sender_mobile" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label">Sender Email</label>
                                    <input class="form-control" value="" name="sender_email" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label">Sender Address</label>
                                    <input class="form-control" value="" name="sender_address" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label">Payment Mode</label>
                                    <select class="form-control" name="payment_mode" required>
                                        <option value="cod">COD</option>
                                        <option value="online">Online</option>
                                    </select>
                                </div>
                                
                                <div class="form-group col-md-6">
                                    <label class="form-label">Recipient Name</label>
                                    <input class="form-control" value="" name="reciepient_name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label">Recipient Mobile</label>
                                    <input class="form-control" value="" type="text" minlength="10" maxlength="10" name="reciepient_mobile" required>
                                </div>
                                
                                <div class="form-group col-md-6">
                                    <label class="form-label">Recipient Address</label>
                                    <input class="form-control" value="" name="reciepient_address" required>
                                </div>
                                
                                    <input class="form-control" value="200" hidden name="distance" type="number" min="1" required>
                                
                                    <table class="table table-bordered">
                                        <tr >
                                            <th>weight</th>
                                            <th>Length</th>
                                            <th>Width</th>
                                            <th>Height</th>
                                            <th>Action</th>
                                        </tr>
                                        <tbody id="parcel_item">
                                            
                                        </tbody>
                                    </table>
                                    <button type="button" class="btn btn-info" onclick="addParcel()">Add Parcel</button>
                                    <div class="d-flex justify-content-center w-100">
                                        <button type="submit" class="btn btn-primary" name="submit">Submit</button>
                                    </div>
                            </div>    
                            
                        </form>
                                    
                    </div>
                </div>
            </div>
        </div>
<script src="<%=CustomerUtil.assets("js/jquery.js")%>"></script>
<script src="<%=CustomerUtil.assets("js/popper.js")%>">
</script>
<script src="<%=CustomerUtil.assets("js/bootstrap.js")%>">
</script>
<script src="<%=CustomerUtil.assets("js/main.js")%>"></script>
<script>
    $(document).ready(function(){
        addParcel();
    })
    function addParcel(){
        console.log("Add parcel")
        let parcel = "<tr>";
        parcel+= "<td><input type='number' class='form-control' name='weight[]' required placeholder='enter weight'></td>";
        parcel+= "<td><input type='number' class='form-control' name='length[]' required placeholder='enter length'></td>";
        parcel+= "<td><input type='number' class='form-control' name='width[]' required placeholder='enter width'></td>";
        parcel+= "<td><input type='number' class='form-control' name='height[]' required placeholder='enter height'></td>";
        parcel+= "<td><button type='button' class='btn btn-danger remove_parcel' >Remove</button></td>";
        parcel+="</tr>";
        $("#parcel_item").append(parcel);
    }
    $("#parcel_item" ).on('click','.remove_parcel',function(e){
        let total = $('#parcel_item tr').length;
        console.log(total);
        if(total>1){
            $(this).closest("tr").remove();
        }else{
            alert("Atleast one parcel is required");
        }
    });
</script>
</body>
</html>
