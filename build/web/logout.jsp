<%-- 
    Document   : logout
    Created on : 31 Jan, 2014, 1:21:14 AM
    Author     : Anirudh
--%>

<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.setAttribute("user",null);
            //session.abandon();
            session.invalidate();
            response.setStatus(response.SC_MOVED_TEMPORARILY);
                        
                       String site="http://192.241.177.72:8080/ANISOKUultimate/startingPoint.html";;
                      
                       response.setHeader("Location", site);
        %>   
    </body>
</html>
