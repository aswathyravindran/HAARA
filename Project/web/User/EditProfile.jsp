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
        <%if (request.getParameter("btnsubmit")!=null){
            String email = request.getParameter("txtemail");
            String name = request.getParameter("txtname");
            String contact = request.getParameter("txtcontact");
            String address = request.getParameter("txtaddress");
            String upQry = "update tbl_user set user_name='"+name+"',user_email='"+email+"',user_contact='"+contact+"',user_address='"+address+"' where user_id='"+session.getAttribute("uid")+"'";
            boolean status = con.executeCommand(upQry);
            if (status == true){
            response.sendRedirect("../User/MyProfile.jsp");
        }
            
        }
        String selQry = "select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
        ResultSet urs = con.selectCommand(selQry);
        if (urs.next()) {
        %>
        <form method="post" name="userprof">
            <table border="1" align="center">
                <tr align="center">
                    <td colspan="2">Edit Profile</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=urs.getString("user_name")%>"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="number" name="txtcontact" max="9999999999" value="<%=urs.getString("user_contact")%>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" value="<%=urs.getString("user_email")%>"></td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txtaddress" value="<%=urs.getString("user_address")%>"></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Submit" name="btnsubmit" ></td>
                </tr>
            </table>
           <% }%>
        </form>
    </body>
</html>
