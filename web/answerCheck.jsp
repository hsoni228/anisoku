<%-- 
    Document   : answerCheck
    Created on : Jan 27, 2014, 11:22:20 PM
    Author     : KUNALK
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
          
            String ans=request.getParameter("answer");
            String user=(String)session.getAttribute("user");;
            try
            {
            Connection c=null;
            Class.forName("com.mysql.jdbc.Driver");
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root", "root");
   
            String lev=(String)session.getAttribute("level");
            int level=Integer.parseInt(lev);
            int i, flag=0,l=ans.length();
            char ch;
            for(i=0;i<l;i++)
                      { ch=ans.charAt(i);
                        if(!(ch>='a' && ch<='z' || ch>='A' && ch<='Z' || ch>='0' && ch<='9' || ch=='_'))
                            {flag=1;
                             break;
                            }
                      }
            if(flag==1)
               {response.setStatus(response.SC_MOVED_TEMPORARILY);
               String site ="http://192.241.177.72:8080/ANISOKUultimate/ques"+(level+1)+".jsp";
                            
               //String site=ConnectionManager.getQues(level);
                response.setHeader("Location", site); 
               }
             else
               {
                   int level1=level+1;
                   String lev1=level1+"";
                   String passQ="SELECT answer FROM answer WHERE ques='"+lev1+"'";
                         //Connection c1 =ConnectionManager.getConnection();
                          Statement s1 = c.createStatement();
                         ResultSet rsCheck1 = s1.executeQuery(passQ);
                         rsCheck1.next();
                        String answer=rsCheck1.getString(1);
                        rsCheck1.close();
                        s1.close();
                        //c1.close();
                        out.println(answer+" ");
                      if(answer.equals(ans)==true)
                        {
                        session.setAttribute( "level", lev1 );
                        String passQ3="update score set level='"+Integer.parseInt(lev1)+"' WHERE user='"+user+"'";
                        //Connection c3 =ConnectionManager.getConnection();
                        Statement s3 = c.createStatement();
                         int aff =s3.executeUpdate(passQ3);
                        s3.close();
                        //c3.close();
                       response.setStatus(response.SC_MOVED_TEMPORARILY);
                       String site ="http://192.241.177.72:8080/ANISOKUultimate/ques"+(level1+1)+".jsp";
                            
                      // String site=ConnectionManager.getQues(level1);
                       response.setHeader("Location", site); 
                        }
                      else
                      {
                      response.setStatus(response.SC_MOVED_TEMPORARILY);
                      String site="http://192.241.177.72:8080/ANISOKUultimate/ques"+(level+1)+".jsp";
                            
                      response.setHeader("Location", site); 
                      }
               }
            c.close();
            }
            catch(Exception e)
                    {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
                   }
            
            
            
          %>
    </body>
</html>
