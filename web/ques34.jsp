<%-- 
    Document   : ques2
    Created on : 31 Jan, 2014, 12:09:59 AM
    Author     : Anirudh
--%>
<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
<head>
<title>
ANISOKU
</title>
<style> 
body
{
background:url("maze.jpg");
background-size:1365px 650px;
background-position:center;
background-attachment:fixed;
}
abc
{
position:fixed;
top:370px;
right:350px;
}
xyz
{
position:fixed;
top:250px;
right:680px;
}
pqr
{
position:fixed;
top:450px;
right:440px;
}
mno
{
position:fixed;
top:5px;
right:150px;
}
mn
{
position:fixed;
top:55px;
right:230px;
}
qwe
{
position:fixed;
top:5px;
left:150px;
}
qw
{
position:fixed;
top:55px;
left:230px;
}
a:link    {color:black;}
a:hover   {color:red;}
a:visited    {color:black;}
h4
{
position:fixed;
top:550px;
left:530px;
}
</style>
</head>
<body>
  <%
try
 {
    String user=(String)session.getAttribute("user");
    //out.println("user is"+user);
    if(user==null)
    {
        String site ="http://192.241.177.72:8080/ANISOKUultimate/startingPoint.html";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
    }  
    Connection c=null;
            Class.forName("com.mysql.jdbc.Driver");
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root", "root");
   String sql="SELECT level FROM score WHERE user='"+user+"'";
    Statement s = c.createStatement();
    ResultSet rsCheck=s.executeQuery(sql);
    rsCheck.next();
    String pow=rsCheck.getString(1);
    int level=Integer.parseInt(pow);
    rsCheck.close();
    s.close();
    c.close();
    if(level<33)
    {  String site ="http://192.241.177.72:8080/ANISOKUultimate/ques"+(level+1)+".jsp";
               response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
     }
     //out.println("\nGood Job");
    //out.println(pow);
}
    catch(Exception e)
     {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
      }
%>

<mno><a href="logout.jsp"><h2>Logout</h2></a></mno>
<mn><a href="rules.htm" target="_blank"><h2>Rules</h2></a></mn>
<qwe><a href="https://www.facebook.com/pages/Freacs/345258588953111" target="_blank"><h2>Forum</h2></a></qwe>
<qw><a href="leaderBoard.jsp" target="_blank"><h2>Leaderboard</h2></a></qw>
<center><b><h1 style="font-size:80;font-family:Twelve Ton Sushi;">ANISOKU<br>Level 34</h1></b></center>
<xyz><img src="level 34.jpg" border="5" width=500px height=300px></xyz>
<form action="answerCheck.jsp" method=post>
<abc><input type="text" name="answer" size="25" style="font-size:20px;"></abc>
<pqr><input type="image" src="submit ques.jpg" alt="Submit" width="100" height="45"></pqr>
</form>
<b><h4 style="font-size:30;font-family:ACQUAINTANCE;">Presented By FREACS...</h4></b>
</body>
</html>