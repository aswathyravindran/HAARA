<%-- 
    Document   : EditProfile
    Created on : 21 Mar, 2024, 6:18:20 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDIT PROFILE</title>
    </head>
    <body>
        <%if (request.getParameter("btnsubmit") != null) {
                String email = request.getParameter("txtemail");
                String name = request.getParameter("txtname");
                String contact = request.getParameter("txtcontact");
                String address = request.getParameter("txtaddress");
                String upQry = "update tbl_property_owners set property_owners_name='" + name + "',property_owners_email='" + email + "',property_owners_contact='" + contact + "',property_owners_address='" + address + "' where property_owners_id='" + session.getAttribute("pid") + "'";
                boolean status = con.executeCommand(upQry);
                if (status == true) {
                    response.sendRedirect("../Propertyowner/Pprofile.jsp");
                }

            }
            String selQry = "select * from tbl_property_owners where property_owners_id='" + session.getAttribute("pid") + "'";
            ResultSet urs = con.selectCommand(selQry);
            if (urs.next()) {
        %>
        <form name="pownerprof">
            <table border="1" align="center" height="300px" width="300px">
                <tr align="center">
                    <td colspan="2">Edit Profile</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=urs.getString("property_owners_name")%>"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="number" name="txtcontact" max="9999999999" value="<%=urs.getString("property_owners_contact")%>"> </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" value="<%=urs.getString("property_owners_email")%>"></td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txtaddress" value="<%=urs.getString("property_owners_address")%>"></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Submit" name="btnsubmit" ></td>
                </tr>
            </table>
            <% }%>
        </form>
    </body>
</html>
