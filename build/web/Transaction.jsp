<%-- 
    Document   : Customer
    Created on : Mar 6, 2021, 9:44:10 PM
    Author     : lenovo
--%>

<%@page import="com.sparks.TransactionBean"%>
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
        <h1 style="text-align: center; background-color: #0000ff;color: #ffffff; font-size:  40px;">Sparks Foundation</h1>
        
        <table  class="table">
            <tr>
                <th> TransId </th>
                <th> To_From </th>
                <th> Trans_amt </th>
                <th> Date </th>
            </tr>
            <%  
                String name1=request.getParameter("name1");
    
    ArrayList<TransactionBean> al=new ArrayList();
   
  
    int transid;
    String name="",to_from="",dated="" ,trans_amt="";
      String sql=String.format("select * from transact where name='%s'",name1);
     
      try
          {
              ResultSet rs=DatabaseBean.executeQuery(sql);
             while(rs.next())
             {
                 
               transid=rs.getInt("transid");
              // out.print(transid);
              name=rs.getString("name");
             // out.print(name);
             to_from=rs.getString("to_from");
             //  out.print(to_from);
                        dated=rs.getString("dated");
                       // out.print(dated);
                     
              trans_amt=rs.getString("trans_amt");
           TransactionBean t=new TransactionBean(transid, to_from, trans_amt, dated, name);
            al.add(t);
    //         al.add(rs);
   
             }
          }
          catch(Exception e)
          {
              JOptionPane.showMessageDialog(null, "TransactionBean" +e.getMessage());
          }
    //out.print("<html>");
    

  %>
    <br/>
            <%
      
for(TransactionBean i:al)
{ %>
<tr>
   

    <td><%=i.getTransid() %></td>
    <td>     <%=i.getTo_from() %></td>
    <td>  <%=i.getTrans_amt() %>  </td>
    <td><%=i.getDated() %> </td>
    
        </tr>
    <%
        }
        %>
            
        </table>
        
        
        </div>
        <a href="Customer.jsp"><button  style="margin-left: 20px; color: #3333ff; background-color: #99ffff;"type="button" class="btn btn-secondary">Back</button></a>
        
        
        </body>
</html>
