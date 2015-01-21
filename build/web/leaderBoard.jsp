<%-- 
    Document   : leaderBoard
    Created on : Jan 28, 2014, 12:51:46 AM
    Author     : KUNALK
--%>

<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<STYLE>
body
{
background:url("brown.jpg");
//background-size:1165px 650px;
background-position:center;
}
h1
{
color:black;
font-size:400%;
}
table,tr
{
border:3px solid black;
padding:15px;
}
th
{
background-color:black;
color:white;
width:200px;
font-size:200%;
}
td
{
border:2px solid brown;
padding:15px;
text-align:center;
font-size:150%;
font-weight:bold;
}
</STYLE>
<TITLE>
SCOREBOARD</TITLE>
</HEAD>
<body>
<center><h1><u>SCOREBOARD</u></h1></center>
<br>

<% Connection c=null;
   Class.forName("com.mysql.jdbc.Driver");
   c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root", "root");
   //Connection c=ConnectionManager.getConnection();
   String sql="SELECT * FROM score order by level desc,times asc";
   Statement s = c.createStatement();
   ResultSet rs=s.executeQuery(sql);
   
   // NEXTLINE NOT WORKING!!!
   
   int count=0;
   out.println("<center><table><tr><th>Rank</th><th>UserName</th><th>Score</th></tr>");
   while(rs.next())
      {
           out.println("<tr><td>"+count+"</td><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><tr>"); 
          //out.println(""+count+""+rs.getString(1)+"\t"+rs.getString(2));
           //out.println("<BR>"); 
      count++;
       //rs.next();
      }
   out.println("</center>");
   
   
 %>


</body>
</HTML>