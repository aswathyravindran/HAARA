<%-- 
    Document   : Viewmorefur
    Created on : 1 Apr, 2024, 4:50:07 PM
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
        <%@include file="Head.jsp" %>
        <%
            if (request.getParameter("btnwish") != null) {
                String insQry1 = "insert into tbl_wishlist(user_id,furniture_id)values('" + session.getAttribute("uid") + "','" + request.getParameter("fid") + "') ";
                if (con.executeCommand(insQry1)) {
        %>
        <script>
            alert("Added to wishlist");
            window.location = "ViewMoreFur.jsp";
        </script>
        <%
            } else {
                out.print(insQry1);
            }
        } else if (request.getParameter("btnreq") != null) {
            session.setAttribute("fid", request.getParameter("fid"));
           %>
        <script>
           
            window.location = "FurnitureRequest.jsp";
        </script>
        <%

            

            }

            String selQry3 = "select * from tbl_furniture h,tbl_place p,tbl_furniture_owner q where q.furniture_owner_id=h.furniture_owner_id and h.place_id=p.place_id and h.furniture_id='" + request.getParameter("fid") + "'";
            ResultSet rs3 = con.selectCommand(selQry3);
            if (rs3.next()) {
        %>

        <h1>Furniture Details</h1>
        <form name="frmUserprofile" method="post">
            <table border="1" align="center">
                <tr>
                    <td colspan="2">
                        <img src="../Assets/Files/<%=rs3.getString("furniture_owner_photo")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs3.getString("furniture_owner_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rs3.getString("furniture_owner_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs3.getString("furniture_owner_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <%=rs3.getString("furniture_owner_address")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img src="../Assets/Files/<%=rs3.getString("furniture_image")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td> Furniture Address</td>
                    <td>
                        <%=rs3.getString("furniture_address")%>
                    </td>
                </tr>
                <tr>
                    <td>Furniture Details</td>
                    <td>
                        <%=rs3.getString("furniture_description")%>
                    </td>
                </tr>
                <tr>
                    <td>Furniture Price</td>
                    <td>
                        <%=rs3.getString("furniture_price")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="ViewFPhotos.jsp?frid=<%=rs3.getString("furniture_id")%>">View More Photos</a>
                        <input type="submit" value="Wishlist" name="btnwish">
                        <input type="submit" value="Request" name="btnreq">
                    </td>
                </tr>

            </table>
            <% }%>
        </form>
        <%@include file="Foot.jsp" %>
    </body>
</html>