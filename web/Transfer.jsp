<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.sparks.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sparks.DatabaseBean"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
         
        <style>
            body, html {
                height: 100%;
                font-family: Arial, Helvetica, sans-serif;
            }

            * {
                box-sizing: border-box;
            }

            .bg-img {
                /* The image used */
                background-image: url("images/photo1.jpg");

                min-height: 600px;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                position: relative;
            }

            /* Add styles to the form container */
            .container {
                position: absolute;
                right: 0;
                margin-right:  40%;
                max-width: 600px;
                padding: 16px;
                background-color: white;
            }

            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
            }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Set a style for the submit button */
            .btn {
                background-color: #3366ff;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                opacity: 0.9;
            }

            .btn:hover {
                opacity: 1;
            }
        </style>
    </head>
    <body>
        <%
            String name1 = request.getParameter("name");

        %>
        <h2 style="text-align: center; font-style: inherit; background-color: #ccffff; margin-top: 10px; ">Sparks Banking System</h2>

        <div class="bg-img">
            <br>
            <form action="CustomerServlet?op=1" class="container" method="post">
                <h1 style="text-align: center; color: #3333ff;">Welcome To </h1>
                <h3 style="text-align: center; color: #3333ff;">Money Transfer Portal</h3>



                <label for="Name"><b>Transfer From</b></label>
                <input type="text" value="<%=name1%>" name="h1" id="h1"/>

                <label for="TName"><b>Transfer To</b></label> <br>
                <select  style="width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;" id="h2" name="h2" >
                    <%

                        ArrayList<CustomerBean> al = new ArrayList();

                        String name = "", emailid = "";
                        float currentbal = 0;
                        String sql = String.format("select * from customer where name!='%s'",name1);
                        try {
                            ResultSet rs = DatabaseBean.executeQuery(sql);
                            while (rs.next()) {
                                name = rs.getString("name");
                                emailid = rs.getString("emailid");
                                currentbal = rs.getFloat("actualbal");
                                CustomerBean cb = new CustomerBean(name, emailid, currentbal);
                                al.add(cb);
                                //         al.add(rs);

                            }
                        } catch (Exception e) {
                            JOptionPane.showMessageDialog(null, "Customer" + e.getMessage());
                        }
                        //out.print("<html>");


                    %>
                    <br>
                    <%                for (CustomerBean i : al) {%>

                    <option value="<%=i.getName()%>"><%=i.getName()%></option>

                    <%
                        }
                    %>

                </select>
                    <br>
                    <label for="Amount"><b>Transfer From</b></label>
                    <br>
                    <input style="width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;" type="number" placeholder="Enter Amount" name="h3" id="h3"/>
                     
                    
                <button type="submit" class="btn">Transfer</button>
            </form>
        </div>
    </body>
</html>
