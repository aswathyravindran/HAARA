<%-- 
    Document   : complaint
    Created on : 16 Mar, 2024, 12:19:35 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint page</title>
    </head>
    <body>
        <%
            if (request.getParameter("btnsubmit") != null) {
                String s = "insert into tbl_complaint(complaint_content,user_id) values('" + request.getParameter("txtdesc") + "','" + session.getAttribute("uid") + "')";
                if (con.executeCommand(s)) {

        %>
        <script>
            alert("Saved");
            window.location = "Complaint.jsp";
        </script>
        <%                }
            }
        %>
        <form method="post" name="complaint">
            <table border="1" align="center">
                <tr>
                    <td>Complaint</td>
                    <td>
                        <textarea name="txtdesc" rows="6" cols="20"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit"  name="btnsubmit" value="submit">
                        <input type="reset"  name="btncancel" value="Reset">
                    </td>
                </tr>
            </table>
            <table border="1" align="center">  
                <tr>
                    <td>Sl No</td>
                    <td>Complaint</td>
                    <td>Complaint Reply </td> 
                </tr>
                <%        int i = 0;
                    String selQry = "select * from tbl_complaint where user_id='" + session.getAttribute("uid") + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {

                        i++;

                %>
                <tr>
                    <td ><%=i%></td>
                    <td ><%=rs.getString("complaint_content")%></td>
                    <td ><%=rs.getString("complaint_reply")%></td>
                </tr>
                <%                      }


                %>
            </table>
        </form>
    </body>
</html>
