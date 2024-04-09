^<%-- 
    Document   : Login.jsp
    Created on : 18 Mar, 2024, 5:20:28 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NEST: Login</title>
    </head>
    <body>

        <%if (request.getParameter("btnsubmit") != null) {
                String email = request.getParameter("txtemail");
                String password = request.getParameter("txtpassword");
                String selQry = "select * from tbl_user where user_email= '" + email + "' and user_password= '" + password + "' ";
                ResultSet rs = con.selectCommand(selQry);

                String selQry1 = "select * from tbl_admin where admin_email= '" + email + "' and admin_password= '" + password + "' ";
                ResultSet rs1 = con.selectCommand(selQry1);

                String selQry2 = "select * from tbl_property_owners where property_owners_email= '" + email + "' and property_owners_password= '" + password + "' and property_owners_status=1";
                ResultSet rs2 = con.selectCommand(selQry2);

                String selQry3 = "select * from tbl_furniture_owner where furniture_owner_email= '" + email + "' and furniture_owner_password= '" + password + "' and furniture_owner_status=1";
                ResultSet rs3 = con.selectCommand(selQry3);

                if (rs.next()) {
                    session.setAttribute("uid", rs.getString("user_id"));
                    session.setAttribute("uname", rs.getString("user_name"));
                    response.sendRedirect("../User/HomePage.jsp");
                } else if (rs1.next()) {
                    session.setAttribute("aid", rs1.getString("admin_id"));
                    session.setAttribute("aname", rs1.getString("admin_name"));
                    response.sendRedirect("../Admin/AdminhomePage.jsp");
                } else if (rs2.next()) {
                    session.setAttribute("pid", rs2.getString("property_owners_id"));
                    session.setAttribute("pname", rs2.getString("property_owners_name"));
                    response.sendRedirect("../Propertyowner/PhomePage.jsp");
                } else if (rs3.next()) {
                    session.setAttribute("fid", rs3.getString("furniture_owner_id"));
                    session.setAttribute("fname", rs3.getString("furniture_owner_name"));
                    response.sendRedirect("../Shopowner/ShomePage.jsp");
                } else {
        %>
        <script>
            alert("Failed");

            window.location = "Login.jsp";
        </script>
        <%
                }
            }

        %>
        
        <form method="post" name="frmdistrict">
            <table>
                <tr>
                    <td align="center" colspan="2">Login</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" placeholder="Enter Email" required=""></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" placeholder="Enter Password" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btncancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>