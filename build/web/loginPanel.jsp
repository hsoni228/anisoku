<%-- 
    Document   : loginPanel
    Created on : Jan 27, 2014, 12:05:11 AM
    Author     : KUNALK
--%>




<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>
            <%
            String user=request.getParameter("TEXT_1");
            String pass=request.getParameter("TEXT_2");
             
            try
                {   Connection c=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root", "root");
                    int i,l1=user.length(),l2=pass.length(),flag=0;
                    char ch;
                    for(i=0;i<l1;i++)
                      { ch=user.charAt(i);
                          if(!(ch>='a' && ch<='z' || ch>='A' && ch<='Z' || ch>='0' && ch<='9' || ch=='_'))
                          {flag=1;
                          break;
                          }
                      }
                    for(i=0;i<l2;i++)
                      { ch=pass.charAt(i);
                          if(!(ch>='a' && ch<='z' || ch>='A' && ch<='Z' || ch>='0' && ch<='9' || ch=='_'))
                          {flag=1;
                          break;
                          }
                      }
                    if(flag==1 || l1<3 || l2<3 || l1>29 || l2>29)
                      {   //out.println("Not found");
                        String site = "http://192.241.177.72:8080/ANISOKUultimate/startingPointError.html";
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site); 
                          
                      }
                    else
                    {
                    // Connection c=ConnectionManager.getConnection();
                     String sql="SELECT pass FROM login WHERE EXISTS(SELECT * FROM login WHERE user='"+user+"')";
                     Statement s = c.createStatement();
                     ResultSet rsCheck=s.executeQuery(sql);
                     
                     boolean exists = rsCheck.next();
                     rsCheck.close();
                     s.close();
                    // c.close();
                     
                    if(!exists)
                          { String site = "http://192.241.177.72:8080/ANISOKUultimate/startingPointError.html";
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site); 
                          }
                            
                          
                     else
                    {   
                         String passQ="SELECT pass FROM login WHERE user='"+user+"'";
                        // Connection c2 =ConnectionManager.getConnection();
                         Statement s2 = c.createStatement();
                         ResultSet rsCheck2 =s2.executeQuery(passQ);
                         rsCheck2.next();
                         String pow=rsCheck2.getString(1);
                       rsCheck2.close();
                       s.close();
                      // c.close();
                       if(pow.equals(pass)==true)
                           {//out.println("Yes, you are registered");
                            
                             String passQ3="SELECT level FROM score WHERE user='"+user+"'";
                        //     Connection c3 =ConnectionManager.getConnection();
                             Statement s3 = c.createStatement();
                             ResultSet rsCheck3 =s3.executeQuery(passQ3);
                             rsCheck3.next();
                             String sc=rsCheck3.getString(1);
                             int score=Integer.parseInt(sc);  
                             rsCheck3.close();
                             s3.close();
                             
                             //c3.close();
                             session.setAttribute( "user", user );
                             session.setAttribute( "level",sc );
                             String site ="http://192.241.177.72:8080/ANISOKUultimate/ques"+(score+1)+".jsp";
                             //ConnectionManager.getQues(score) ;
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site); 
                         }
                       
                       else
                            {// out.println("Wrong Password"+pow);
                              String site = "http://192.241.177.72:8080/ANISOKUultimate/startingPointError.html";
                              response.setStatus(response.SC_MOVED_TEMPORARILY);
                              response.setHeader("Location", site); 
                          }
                            
                    }
                    
                 
                    
                     
                      
                      System.out.println( "Thanks");
                    }
                    c.close();
                  }
              catch(Exception e)
                    {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
                   }
            %>
        </h1>
    </body>
</html>


