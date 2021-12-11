<%-- 
    Document   : payment
    Created on : Nov 7, 2021, 11:58:52 AM
    
--%>

<%@page import="com.puja.customer.models.Parcel"%>



<%@page import="com.puja.customer.utils.CustomerUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Courier Customer Order Feedback</title>

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
            <% Parcel parcel = (Parcel)request.getAttribute("parcel"); 
                int total = parcel.getTransport_cost()+parcel.getDelivery_charge()+parcel.getParcel_cost();
                total = total*100;
            %>
            <div class="container">
                <div class="card">
                    <div class="card-header">
                        <h3>Online Payment</h3>
                    </div>
                    <div class="card-body ">
                        <div class="row">
                            <form action="<%=Constants.paymentSuccess %>" method="POST">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="form-label">Parcel ID</label>
                                        <input class="form-control" readonly="" value="<%=parcel.getId() %>" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="form-label">Total Cost</label>
                                        <input class="form-control" name="total" readonly="" value="<%=total %>" required>
                                    </div>
                                </div>
<script
    src="https://checkout.razorpay.com/v1/checkout.js"
    data-key="<%=Constants.payment_key %>" 
    data-amount="<%=total %>" 
    data-currency="INR"
    data-buttontext="Pay with Razorpay"
    data-name="CMS System"
    data-description="Project by Puja Sinha"
    data-image="https://unsplash.com/photos/q8kR_ie6WnI?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink"
    data-prefill.name="<%=customer.getC_name() %>"
    data-prefill.email="<%=customer.getC_email()%>"
    data-prefill.contact="<%=customer.getC_mob()%>"
    data-theme.color="#F37254"
></script>
<input type="hidden" custom="Hidden Element" value="<%=parcel.getId() %>" name="order_id">
</form>
                        </div>
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
</body>
</html>


