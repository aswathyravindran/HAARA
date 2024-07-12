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
        <%@include file="Head.jsp" %>
        <%if (request.getParameter("btnedit") != null) {
                response.sendRedirect("../Shopowner/SeditProfile.jsp");
            } else if (request.getParameter("change Password") != null) {
                response.sendRedirect("../Shopowner/Schangepassword.jsp");
            } else if (request.getParameter("btnhome") != null) {
                response.sendRedirect("../Shopowner/ShomePage.jsp");
            } else if (request.getParameter("btnmyfurniture") != null) {
                response.sendRedirect("../Shopowner/Furniture.jsp");
            } else if (request.getParameter("btnrequest") != null) {
                response.sendRedirect("../Shopowner/ViewRequests.jsp");
            }

            String selQry3 = "select * from tbl_furniture_owner where furniture_owner_id='" + session.getAttribute("fid") + "' ";
            ResultSet rs3 = con.selectCommand(selQry3);
            if (rs3.next()) {
        %>

        <h1>MY PROFILE</h1>
        <form method="post" name="myprofile">
            <table border="1" align="center">
                <tr>
                    <td colspan="2">
                        <img src="../Assets/Files/<%=rs3.getString("furniture_owner_photo")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs3.getString("furniture_owner_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rs3.getString("furniture_owner_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs3.getString("furniture_owner_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <%=rs3.getString("furniture_owner_address")%>
                    </td>
                </tr>
                <tr><td colspan="2"> <input type="submit" name="btnedit" value="Edit Profile">
                        <input type="submit" value="ChangePassword" name="change Password" >
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnmyfurniture" value="My Furniture"></td>
                </tr>
            </table>
            <% }%>
        </form>
            <%@include file="Foot.jsp" %>
    </body>
</html>