<%-- 
    Document   : registration.jsp
    Created on : Jan 28, 2014, 1:24:25 AM
    Author     : KUNALK
--%>
<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*,java.io.*"  %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  String key=request.getParameter("TEXT_1");
            String user=request.getParameter("TEXT_2");
            String pass=request.getParameter("TEXT_3");
            String times =request.getParameter("TEXT_4");
            out.println(key);
            if(key.equals("king")==false)
              {out.println("saraswati");
                String site = "http://192.241.177.72:8080/ANISOKUultimate/kregis_error.html";
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site); 
              }
            else
            {out.println("gopal");
            
            try
                {  
                    Connection c=null;
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
                        String site = "http://192.241.177.72:8080/ANISOKUultimate/kregis_error.html";
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site); 
                          
                      }
                    else
                    {
                     
                     String sql="SELECT pass FROM login WHERE EXISTS(SELECT * FROM login WHERE user='"+user+"')";
                     Statement s = c.createStatement();
                     ResultSet rsCheck=s.executeQuery(sql);
                     
                     boolean exists = rsCheck.next();
                     rsCheck.close();
                     s.close();
                     
                     
                    if(!exists)
                          { String sql2="insert into login values('"+user+"','"+pass+"');";
                          
                           
                            Statement s2=c.createStatement();
                            s2.executeUpdate(sql2);
                            sql2="insert into score values('"+user+"','0',"+times+");";
                            s2=c.createStatement();
                            s2.executeUpdate(sql2);
                            s2.close();
                            //c.close();
                            String site = "http://192.241.177.72:8080/ANISOKUultimate/kregis.html";
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site); 
                          }
                            
                          
                     else
                    {     
                          String site = "http://192.241.177.72:8080/ANISOKUultimate/kregis_error.html";
                          response.setStatus(response.SC_MOVED_TEMPORARILY);
                          response.setHeader("Location", site); 
                          
                            
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
            }
            %>
    </body>
</html>
