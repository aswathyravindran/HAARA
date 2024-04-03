<%-- 
    Document   : UserRequest
    Created on : 3 Apr, 2024, 5:12:08 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property</title>
    </head>
    <body>
        <%
            if (request.getParameter("btnreq") != null) {

                String insQry = "insert into tbl_request(request_date,request_status,user_id,property_id)values(CURDATE(),'" + 0 + "','" + session.getAttribute("uid") + "','" + request.getParameter("pid") + "') ";

                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "ViewMoreProp.jsp?pid='" + request.getParameter("pid") + "'";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "ViewMoreProp.jsp";
        </script>
        <%
                }
            }

            String selQry3 = "select * from tbl_property h,tbl_place p,tbl_property_owners q where q.property_owners_id=h.property_owners_id and h.place_id=p.place_id and h.property_id='" + request.getParameter("pid") + "'";
            ResultSet rs3 = con.selectCommand(selQry3);
            if (rs3.next()) {
        %>

        <h1>Property Details</h1>
        <form name="frmUserprofile" method="post">
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
                        <img src="../Assets/Files/<%=rs3.getString("property_file")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td> Property Address</td>
                    <td>
                        <%=rs3.getString("property_address")%>
                    </td>
                </tr>
                <tr>
                    <td>Property Details</td>
                    <td>
                        <%=rs3.getString("property_details")%>
                    </td>
                </tr>
                <tr>
                    <td>Property Price</td>
                    <td>
                        <%=rs3.getString("property_price")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Wishlist" name="btnwish">

                        <input type="submit" value="Add Cart" name="btncart">
                        <input type="submit" value="Request" name="btnreq">
                    </td>
                </tr>

            </table>
            <% }%>
        </form>
    </body>
</html>