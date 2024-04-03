<%-- 
    Document   : Adminreg.jsp
    Created on : 17 Mar, 2024, 10:35:28 AM
    Author     : vdjuc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <h1 align="center">Admin</h1>
        <h2 align="center">Sign Up</h2>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
             

        <%

            if (request.getParameter("btnsubmit") != null) {
                String adminName = request.getParameter("txtname");
                String adminEmail = request.getParameter("txtemail");
                String adminPassword = request.getParameter("txtpwd");
                String adminContact = request.getParameter("txtcontact");
                String insQry = "insert into tbl_admin(admin_name,admin_email,admin_password,admin_contact)values('" + adminName + "','" + adminEmail + "','" + adminPassword + "','" + adminContact + "') ";
                
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Adminregs.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "Adminregs.jsp";
        </script>
        <%
                }
            }

        %>
        
                <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_admin where admin_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Adminregs.jsp");
            }

        %>
        
        
        <%--nextcol---%>
        
     
        
        
        <form method="post" name="login">
            <table border="2" align="center">
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="txtname" placeholder="enter name" required="">
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" placeholder="enter email" required=""></td>
                </tr>
                <tr>
                   <td>Password</td>
                   <td><input type="password" name="txtpwd" placeholder="enter password" required=""></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" placeholder="enter contact detail" required=""></td>
                </tr>
                     
               <tr>
                     <td colspan="2" align="center">
                     <input type="submit" name="btnsubmit" value="Submit">
                     <input type="reset"  name="btnreset"  value="Cancel">
                     </td>
                </tr> 
                 
            </table>
        </form>
    </body>
</html>
<table border="1" align="center">


    <tr >
        <th >Sl.No</th>
        <th >Name</th>
        <th >Email</th>
        <%-- <th >Password</th> --%>
        <th >Contact</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_admin";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("admin_name")%></td>
        <td ><%=rs.getString("admin_email")%></td>
        <%-- <td ><%=rs.getString("admin_password")%></td> --%>
        <td ><%=rs.getString("admin_contact")%></td>
        <td ><a href="Adminregs.jsp?del=<%=rs.getString("admin_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>