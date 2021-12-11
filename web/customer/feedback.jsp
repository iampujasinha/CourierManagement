<%-- 
    
--%>


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
<style>
        .rate-area {
    float:left;
    border-style: none;
}

.rate-area:not(:checked) > input {
    position:absolute;
    top:-9999px;
    clip:rect(0,0,0,0);
}

.rate-area:not(:checked) > label {
    float: right;
    width: .80em;
    overflow: hidden;
    white-space: nowrap;
    cursor: pointer;
    font-size: 40px;
    line-height: 32px;
    color: lightgrey;
    margin-bottom: 10px !important;
}

.rate-area:not(:checked) > label:before {
    content: '★';
}

.rate-area > input:checked ~ label {
    color: #e8262d;
    text-shadow: none;
}

.rate-area:not(:checked) > label:hover,
.rate-area:not(:checked) > label:hover ~ label {
    color: #e8262d;
    
}
.rate-area > input:checked + label:hover,
.rate-area > input:checked + label:hover ~ label,
.rate-area > input:checked ~ label:hover,
.rate-area > input:checked ~ label:hover ~ label,
.rate-area > label:hover ~ input:checked ~ label {
    color: #e8262d;
    text-shadow: none;
    
}

.rate-area > label:active {
    position:relative;
    top:0px;
    left:0px; 
}
        </style>
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
                    <div class="card-header">
                        <h3>Order Feedback</h3>
                    </div>
                    <div class="card-body ">
                        <div class="row">
                            <form method="post" class="w-100 pl-3 pr-3">
                                <div class="row ">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Feedback</label>
                                            <input class="form-control" type="text" name="feedback" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Parcel ID</label>
                                            <input class="form-control" value="<%= request.getParameter("id") %>" readonly="" type="text" name="parcel_id" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="control-label">Rate Our Services<span style="color:red" style="margin-right:5px">*</span></label><br>
                                        <ul class="Rate-Our Services rate-area">
                                            <input type="radio" id="5-star" name="rating" value="5">
                                            <label for="5-star" title="Amazing">5 stars</label>
                                            <input type="radio" id="4-star" name="rating" value="4">
                                             <label for="4-star" title="Good">4 stars</label>
                                            <input type="radio" id="3-star" name="rating" value="3">
                                            <label for="3-star" title="Average">3 stars</label>
                                            <input type="radio" id="2-star" name="rating" value="2">
                                             <label for="2-star" title="Not Good">2 stars</label>
                                            <input type="radio" id="1-star" required=""
                                             name="rating" value="1" aria-required="true">
                                            <label for="1-star" title="Bad">1 star</label>
                                        </ul>
                                    </div>
                                            <input hidden="" value="<%= customer.getC_id() %>" name="customer_id" required="">

                                    <div class="col-md-6">
                                        <input class="btn btn-primary" type="submit" value="Submit Feedback" name="submit">
                                    </div>
                                </div>
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

