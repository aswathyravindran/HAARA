<%-- 
    Document   : Wishlist
    Created on : Apr 4, 2024, 6:03:43 PM
    Author     : mariy
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Wishlist</title>
    </head>
    <body>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_wishlist where wishlist_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Wishlist.jsp");
            }

        %>



        <%        int i = 0;
            String selQry = "select * from tbl_wishlist";
            ResultSet rs = con.selectCommand(selQry);
            while (rs.next()) {
                if (rs.getString("furniture_id") != null) {
                    String selQry1 = "select * from tbl_furniture where furniture_id='" + rs.getString("furniture_id") + "'";
                    ResultSet rs1 = con.selectCommand(selQry1);

        %>

        <table border="1" align="center">

            <tr align="center">
                <td colspan="5">Furnitures</td>
            </tr>
            <tr >
                <th >Sl no.</th>
                <th>Photo</th>
                <th>Price</th>
                <th colspan="2">Action</th>
            </tr> 

            <%            while (rs1.next()) {
                    i++;
            %>
            <tr>
                <td ><%=i%></td>
                <td ><img src="../Assets/Files/<%=rs1.getString("furniture_image")%>" width="120" height="120"/></td>
                <td ><%=rs1.getString("furniture_price")%></td>
                <td ><a href="ViewMoreFur.jsp?fid=<%=rs1.getString("furniture_id")%>">View More</a></td>
                <td ><a href="Wishlist.jsp?del=<%=rs.getString("wishlist_id")%>">Delete</a></td>
            </tr>

            <%  } %>
        </table>
        <%
        } else if (rs.getString("property_id") != null) {
            String selQry2 = "select * from tbl_property where property_id='" + rs.getString("property_id") + "'";
            ResultSet rs2 = con.selectCommand(selQry2);
        %>

        <table border="1" align="center">
            <tr align="center">
                <td colspan="5">Properties</td>
            </tr>
            <tr >
                <th >Sl no.</th>
                <th >Photo</th>
                <th >Price</th>
                <th colspan="2">Action</th>
            </tr>


            <%
                while (rs2.next()) {

                    i++;

            %>
            <tr>
                <td ><%=i%></td>
                <td ><img src="../Assets/Files/<%=rs2.getString("property_file")%>" width="120" height="120"/></td>
                <td ><%=rs2.getString("property_price")%></td>
                <td ><a href="ViewMoreProp.jsp?pid=<%=rs2.getString("property_id")%>">View More</a></td>
                <td ><a href="Wishlist.jsp?del=<%=rs.getString("wishlist_id")%>">Delete</a></td>
            </tr>

            <%                      }
                    }
                }


            %>


        </table>
    </body>
</html>