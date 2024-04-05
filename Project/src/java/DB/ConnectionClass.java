/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.*;

public class ConnectionClass {

    Connection con = null;
    Statement st = null;
    ResultSet rs = null; 

    public ConnectionClass() {  //CONSTRUCTOR
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_haara", "root", "root");

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
//Insert,Delete and Updatde
    public boolean executeCommand(String str) { //insert,delete,update
        boolean bol = false;
        try {

            st = con.createStatement();
            st.executeUpdate(str);
            bol = true;

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return bol;
    }

//    Select
    public ResultSet selectCommand(String selQry) { //select
        try {
            st = con.createStatement();
            rs = st.executeQuery(selQry);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return rs;
    }
}