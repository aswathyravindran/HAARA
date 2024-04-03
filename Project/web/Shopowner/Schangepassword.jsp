<%-- 
    Document   : Pchangepassword
    Created on : 23 Mar, 2024, 10:12:10 AM
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
            String sel = "select * from tbl_furniture_owner where furniture_owner_id='" + session.getAttribute("fid") + "'";
            ResultSet rs = con.selectCommand(sel);
            rs.next();
            String dp = rs.getString("furniture_owner_password");
            String cp = request.getParameter("txtcurr");
            String np = request.getParameter("txtnew");
            String rp = request.getParameter("txtrepass");

            if (dp.equals(cp)) {
                if (np.equals(rp)) {
                    String upQry = "update tbl_furniture_owner set furniture_owner_password='" + np + "' where furniture_owner_id='" + session.getAttribute("fid") + "'";

                    if (con.executeCommand(upQry)) {
    %>
    <script>
        alert('Password Updated');
        window.location = "ShomePage.jsp";
    </script>
    <%
        } else {
//            out.print(upQry);
        }
    } else {
    %>
    <script>
        alert('New Password Missmatched');
        window.location = "Schangepassword.jsp";
    </script>
    <%
        }
    } else {
    %>
    <script>
        alert('Current Password Missmatched');
        window.location = "Schangepassword.jsp";
    </script>
    <%
            }

        }

    %>
    <body>
        <form name="frmEditprofile">
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
