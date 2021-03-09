<%-- 
    Document   : Customer
    Created on : Mar 6, 2021, 9:44:10 PM
    Author     : lenovo
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="com.sparks.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sparks.DatabaseBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banking System</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
    </head>
    
    <body>
        <div>
            <h1 style="text-align: center; background-color: #000000;color: #ffffff; font-size:  40px;">Sparks Foundation</h1>
        
        <table  class="table container">
            <tr>
                <th> Name </th>
                <th> Email </th>
                <th> Current Balance </th>
                <th> Action </th>
            </tr>
            <%  
    
    ArrayList<CustomerBean> al=new ArrayList();
   
  
    String name="",emailid="" ;
    float currentbal=0;
      String sql=String.format("select * from customer");
          try
          {
              ResultSet rs=DatabaseBean.executeQuery(sql);
             while(rs.next())
             {
                 name=rs.getString("name");
             emailid=rs.getString("emailid");
              currentbal=rs.getFloat("actualbal");
           CustomerBean cb=new CustomerBean(name, emailid, currentbal);
            al.add(cb);
    //         al.add(rs);
    
             }
          }
          catch(Exception e)
          {
              JOptionPane.showMessageDialog(null, "Admin-Categories" +e.getMessage());
          }
    //out.print("<html>");
    


  %>
    <br/>
            <%
      
for(CustomerBean i:al)
{ %>
<tr>
    

    <td><%=i.getName()%></td>
    <td>     <%=i.getEmailid()%></td>
    <td>  <%=i.getCurrentbal()%>  </td>
    <td> <a href="Transfer.jsp?name=<%=i.getName() %>"><button type="button" class=" btn btn-primary" >Transfer</button></a></td>
    <td>  <a href="Transaction.jsp?name1=<%=i.getName()%>">   <button type="button" class=" btn btn-success">View Transaction</button></a></td>
            
            
        </tr>
    <%
        }
        %>
            
        </table>
        
        
        </div>
        
        
        </body>
    
    
</html>
