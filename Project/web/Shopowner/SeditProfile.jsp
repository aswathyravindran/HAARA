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
        <%@include file="Head.jsp" %>
        <%if (request.getParameter("btnsubmit")!=null){
            String email = request.getParameter("txtemail");
            String name = request.getParameter("txtname");
            String contact = request.getParameter("txtcontact");
            String address = request.getParameter("txtaddress");
            String upQry = "update tbl_furniture_owner set furniture_owner_name='"+name+"',furniture_owner_email='"+email+"',furniture_owner_contact='"+contact+"',furniture_owner_address='"+address+"' where furniture_owner_id='"+session.getAttribute("fid")+"'";
            boolean status = con.executeCommand(upQry);
            if (status == true){
            response.sendRedirect("../Shopowner/Sprofile.jsp");
        }
            
        }
        String selQry = "select * from tbl_furniture_owner where furniture_owner_id='"+session.getAttribute("fid")+"'";
        ResultSet urs = con.selectCommand(selQry);
        if (urs.next()) {
        %>
        <form name="userprof">
            <table border="1" align="center" height="300px" width="300px">
                <tr align="center">
                    <td colspan="2">Edit Profile</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=urs.getString("furniture_owner_name")%>"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="number" name="txtcontact" max="9999999999" value="<%=urs.getString("furniture_owner_contact")%>"> </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" value="<%=urs.getString("furniture_owner_email")%>"></td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txtaddress" value="<%=urs.getString("furniture_owner_address")%>"></td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <input type="submit" value="Submit" name="btnsubmit" >
                        <input type="reset" value="Reset" name="btncancel" >
                    </td>
                </tr>
            </table>
           <% }%>
        </form>
           <%@include file="Foot.jsp" %>
    </body>
</html>
