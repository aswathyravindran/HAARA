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
            String sel = "select * from tbl_user where user_id='" + session.getAttribute("uid") + "'";
            ResultSet rs = con.selectCommand(sel);
            rs.next();
            String dp = rs.getString("user_password");
            String cp = request.getParameter("txtcurr");
            String np = request.getParameter("txtnew");
            String rp = request.getParameter("txtrepass");

            if (dp.equals(cp)) {
                if (np.equals(rp)) {
                    String upQry = "update tbl_user set user_password='" + np + "' where user_id='" + session.getAttribute("uid") + "'";

                    if (con.executeCommand(upQry)) {
    %>
    <script>
        alert('Password Updated');
        window.location = "HomePage.jsp";
    </script>
    <%
        } else {
//            out.print(upQry);
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
        <form name="frmEditUserprofile">
            <table border="1" align="center">
                <tr>
                    <td>Current Password</td>
                    <td><input type="password" name="txtcurr"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="password" name="txtnew"> </td>
                </tr>
                <tr>
                    <td>Re enter</td>
                    <td><input type="password" name="txtrepass"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Submit" name="btnsubmit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
