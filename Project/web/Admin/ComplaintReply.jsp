<%-- 
    Document   : ComplaintReply
    Created on : 4 Apr, 2024, 6:36:07 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Reply</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            String selQry = "select * from tbl_complaint c inner join tbl_user u on u.user_id=c.user_id";
            ResultSet rs = con.selectCommand(selQry);
            if (request.getParameter("btnsubmit") != null) {
                String s = "update tbl_complaint set complaint_reply='" + request.getParameter("txtreply") + "',complaint_status='1' where complaint_id = '" + request.getParameter("cid") + "'";
                out.print(s);
                boolean status = con.executeCommand(s);

                if (status) {

        %>
        <script>
            alert("Reply saved");
            window.location = "Complaints.jsp";
        </script>
        <%                }
            }
        %>
        <form method="post" name="complaint">
            <table border="1" align="center">
                <tr>
                    <% if (rs.next()) {%>
                    <td>Complaint Reply</td>
                    <td>
                        <textarea name="txtreply" rows="6" cols="20"><%=rs.getString("complaint_reply")%></textarea>
                    </td>
                    <% }%>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit"  name="btnsubmit" value="submit">
                        <input type="reset"  name="btncancel" value="Reset">
                    </td>
                </tr>
            </table>

        </form>
        <%@include file="Foot.jsp" %>
    </body>
</html>
