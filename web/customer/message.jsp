<%-- 
    Document   : message
    Created on : Nov 3, 2021, 5:16:43 PM
    Author     : Puja Sinha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


    <%
        String success = (String)session.getAttribute("success");
        if(success!=null)  {
    %>            
        <div class="alert alert-success">
            <span><%= success %></span>
        </div>
    <%
        }
        session.removeAttribute("success");
    %>
    
    <%
        String error = (String)session.getAttribute("error");
        if(error!=null)  {
    %>            
        <div class="alert alert-danger">
            <span><%= error %></span>
        </div>
    <%
        } 
        session.removeAttribute("error");
    %>
