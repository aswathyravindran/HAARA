<%-- 
    Document   : ChangePassword
    Created on : 21 Mar, 2024, 6:18:52 PM
    Author     : Admin
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <%
        if (request.getParameter("btnsubmit") != null) {
            String sel = "select * from tbl_property_owners where property_owners_id='" + session.getAttribute("pid") + "'";
            ResultSet rs = con.selectCommand(sel);
            rs.next();
            String dp = rs.getString("property_owners_password");
            String cp = request.getParameter("txtcurr");
            String np = request.getParameter("txtnew");
            String rp = request.getParameter("txtrepass");
            
            if (dp.equals(cp)) {
                if (np.equals(rp)) {
                    String upQry = "update tbl_property_owners set property_owners_password='" + np + "' where property_owners_id='" + session.getAttribute("pid") + "'";
                    if (con.executeCommand(upQry)) {
    %>
    <script>
        alert('Password Updated');
        window.location = "PhomePage.jsp";
    </script>
    <%                    
                    }
                    else
                    {
                        
                    }
                } else {
                     %>
    <script>
        alert('New Password Missmatched');
        window.location = "ChangePassword.jsp";
    </script>
    <% 
                }
            } else {
                %>
    <script>
        alert('Current Password Missmatched');
        window.location = "ChangePassword.jsp";
    </script>
    <% 
            }
            
        }

    %>
    <body>
        <%@include file = "Head.jsp" %>
        <form name="frmEditpprofile">
            <table border="1" align="center" height="300px" width="300px">
                <tr align="center">
                    <td colspan="2">Change Password</td>
                </tr>
                <tr>
                    <td>Current Password</td>
                    <td><input type="text" name="txtcurr"> </td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="text" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  required name="txtnew"></td>
                </tr>
                <tr>
                    <td>Re-Password</td>
                    <td><input type="password"  required name="txtrepass"> </td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Submit" name="btnsubmit"></td>
                </tr>
            </table>
        </form>
        <%@include file="Foot.jsp" %>
    </body>
</html>