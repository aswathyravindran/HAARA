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
                response.sendRedirect("../Propertyowner/PeditProfile.jsp");
            } else if (request.getParameter("change Password") != null) {
                response.sendRedirect("../Propertyowner/PchangePassword.jsp");
            } else if (request.getParameter("btnhome") != null) {
                response.sendRedirect("../Propertyowner/PhomePage.jsp");
            } else if (request.getParameter("btnmyprop") != null) {
                response.sendRedirect("../Propertyowner/Property.jsp");
            } else if (request.getParameter("btnrequest") != null) {
                response.sendRedirect("../Propertyowner/ViewRequest.jsp");
            }

            String selQry3 = "select * from tbl_property_owners where property_owners_id='" + session.getAttribute("pid") + "' ";
            ResultSet rs3 = con.selectCommand(selQry3);
            if (rs3.next()) {
        %>

        <h1>MY PROFILE</h1>
        <form method="post" name="myprofile">
            <table border="1" align="center">
                <tr>
                    <td colspan="2">
                        <img src="../Assets/Files/<%=rs3.getString("property_owners_photo")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs3.getString("property_owners_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rs3.getString("property_owners_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs3.getString("property_owners_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <%=rs3.getString("property_owners_address")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="btnedit" value="Edit Profile">
                        <input type="submit" value="ChangePassword" name="change Password" >
                    </td>
                </tr>
            </table>
            <% }%>
        </form>
        <%@include file="Foot.jsp" %>
    </body>
</html>