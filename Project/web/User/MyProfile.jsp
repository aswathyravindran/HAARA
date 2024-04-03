<%-- 
    Document   : MyProfile
    Created on : 21 Mar, 2024, 6:17:15 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MY PROFILE</title>
    </head>
    <body>
        <%if (request.getParameter("btnedit") != null) {
                response.sendRedirect("../User/EditProfile.jsp");
            } else if (request.getParameter("Change Password") != null) {
                response.sendRedirect("../User/ChangePassword.jsp");
            } else if (request.getParameter("btnhome") != null) {
                response.sendRedirect("../User/HomePage.jsp");
            }

            String selQry3 = "select * from tbl_user where user_id='" + session.getAttribute("uid") + "' ";
            ResultSet rs3 = con.selectCommand(selQry3);
            if (rs3.next()) {
        %>

        <h1>MY PROFILE</h1>
        <form method="post" name="myprofile">
            <table border="1" align="center">
                <tr>
                    <td colspan="2">
                        <img src="../Assets/Files/<%=rs3.getString("user_photo")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs3.getString("user_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rs3.getString("user_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs3.getString("user_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <%=rs3.getString("user_address")%>
                    </td>
                </tr>
                <tr><td colspan="2"> <input type="submit" name="btnedit" value="Edit Profile">
                        <input type="submit" name="Change Password" value="ChangePassword"  >
                        <input type="submit" name="btnhome" value="Home"></td>
                </tr>
            </table>
            <% }%>
        </form>
    </body>
</html>