/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sparks;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author lenovo
 */
public class CustomerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
      

        String op = request.getParameter("op");

        if (op != null) {
            performOperation(op, request, response);
            return;  // terminate function
        }

    }

    private void performOperation(String op, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        switch (op) {
            case "1":
                Transfer(request, response);
                break;
           

        }
    }

    private void Transfer(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        PrintWriter out = response.getWriter();
        
     //     Float amt = Float.parseFloat(request.getParameter("currentbal"));
        String h1 = request.getParameter("h1");  // h1- user
        String h2 = request.getParameter("h2");  // h2- account mei deposit
        Float h3 = Float.parseFloat(request.getParameter("h3"));

      //  out.print(amt);
// h3 - amount
        float amt1 = 0;
        float amt2 = 0;

        String sql = String.format("select * from customer where name='%s'", h1);
     //    String sql1=String.format("select * from customer where name='%s'",h2);
        ResultSet rs = DatabaseBean.executeQuery(sql);

        while (rs.next()) {
            amt1 = rs.getFloat("actualbal");
             
        }

        if (amt1 < h3 + 500) {
            getServletContext().getRequestDispatcher("/InsufficientBal.jsp").forward(request, response);
            return;
        }
         // out.println("success");
          String sql1=String.format("update customer set actualbal=actualbal+'%f' where name='%s' ",h3,h2);
           String sql2=String.format("update customer set actualbal=actualbal-'%f' where name='%s' ",h3,h1);
           try {
             
            int rs1 = DatabaseBean.executeUpdate(sql1);
            int rs2 = DatabaseBean.executeUpdate(sql2);
            if(rs1>0 && rs2>0)
            {
                 String sql3=String.format("insert into transact values(transid_seq.nextval,'%s','%s'*-1,sysdate,'%s')",h2,h3,h1); // 
                 String sql4=String.format("insert into transact values(transid_seq.nextval,'%s','%s'*+1,sysdate,'%s')",h1,h3,h2);
              //   out.println("success2");
                 DatabaseBean.commit();
                 ResultSet rs3,rs4;
                rs3 = DatabaseBean.executeQuery(sql3);
                rs4=DatabaseBean.executeQuery(sql4);
                DatabaseBean.commit();
              
                 
                    getServletContext().getRequestDispatcher("/Successful.jsp").forward(request, response);
                }
            
            else
            {
                JOptionPane.showMessageDialog(null, "error here");
            }
           }
        catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Exception Transfer-CustomerServlet");
        }
   
           
           
          
//  out.print(sql1);
       // String s1="";
       //  s1=ht(h1,h3);
       //  out.print("success");
         

        /*
     
       
     
        try {
            ResultSet rs1 = DatabaseBean.executeQuery(sql1);
             ResultSet rs2 = DatabaseBean.executeQuery(sql2);
          
             if(rs1.next() && rs2.next())
             {
                 out.print("success");
                 getServletContext().getRequestDispatcher("/Successful.jsp").forward(request, response);
                  DatabaseBean.commit();
             }
             else
             {
                 JOptionPane.showMessageDialog(null, "Error : CustomerSevlet");
             }
                     
           
        } catch (Exception se) {
            out.println("process request" + se.toString());
        }
  
         */
//To change body of generated methods, choose Tools | Templates.
    }
    
    

   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    


}
