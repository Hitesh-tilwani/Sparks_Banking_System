package com.sparks;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class DatabaseBean {
    //static - Single copy and called using classname
    private static Connection con;
    private static Statement st; //To run queries
    private static ResultSet rs;        //For Select Statement
    //Singleton - Executes only once when class refered for 1st time
    static {    
        try {
            
            // initilizing context class and making its object
            Context initContext = new InitialContext();
            //The Context class is the core of the JNDI API. You use it to perform any lookup 
            //and to add any new name-value associations. When you use JNDI, you typically
            //create an InitialContext object first: The InitialContext constructor looks for a system 
               //     property called java. ...
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            
            
            DataSource ds = (DataSource) envContext.lookup("jdbc/myora");
            con = ds.getConnection();  //Obtain Database Connection
            con.setAutoCommit(false); //Do not save data till we issue commit fn
            //14-Sep-2020 Navigatable Statement
            st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           // st = con.createStatement();  //Create instance of Statement class
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    //To execute Select Query, which return rows inside Result
    public static ResultSet executeQuery(String sql) {
        try {
            ResultSet rs = st.executeQuery(sql);
            return rs;
        } catch (Exception e) {
            return null;  //OCJP: null can be returned in place of object
        }
    }
    //To execute insert/update/delete, it returns number of rows affected as int
    public static int executeUpdate(String sql) {
        try {
            int result = st.executeUpdate(sql);
            return result;
        } catch (Exception e) {
            System.out.println("execUpdate" + e.toString());
            return 0;
        }

    }
    public static void commit() throws SQLException{
        if(con!=null) con.commit();
    }
}
