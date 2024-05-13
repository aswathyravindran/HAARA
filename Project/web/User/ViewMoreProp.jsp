<%-- 
    Document   : ViewMoreProp
    Created on : 1 Apr, 2024, 4:50:44 PM
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
                String insQry1 = "insert into tbl_wishlist(user_id,property_id)values('" + session.getAttribute("uid") + "','" + request.getParameter("pid") + "') ";
                if (con.executeCommand(insQry1)) {
        %>
        <script>
            alert("Added to wishlist");
            window.location = "ViewMoreProp.jsp";
        </script>
        <%
            } else {
                out.print(insQry1);
            }
        }else if (request.getParameter("btnreq") != null) {
            session.setAttribute("pid", request.getParameter("pid"));
           %>
        <script>
           
            window.location = "PropertyRequest.jsp";
        </script>
        <%

            

            }

            String selQry3 = "select * from tbl_property h,tbl_place p,tbl_property_owners q where q.property_owners_id=h.property_owners_id and h.place_id=p.place_id and h.property_id='" + request.getParameter("pid") + "'";
            ResultSet rs3 = con.selectCommand(selQry3);
            if (rs3.next()) {
        %>

        <h1>Property Details</h1>
        <form name="frmUserprofile" method="post">
            <table border="1" align="center" height="300px" width="300px">
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
                        <a href="ViewPhotos.jsp?prid=<%=rs3.getString("property_id")%>">View More Photos</a>
                        <input type="submit" value="Wishlist" name="btnwish">
                        <% String SelQry = "select * from tbl_request where request_status = 1 and property_id ='"+ request.getParameter("pid") +"'";
                        ResultSet rs = con.selectCommand(SelQry);
                        
                        if (rs.next()){
                            out.print("Currently Unavailable");
                        }else{
                            %>
                        <input type="submit" value="Request" name="btnreq">
                                <%
                            }
                                %>
                    </td>
                </tr>

            </table>
            <% }%>
        </form>
            <%@include file="Foot.jsp" %>
    </body>
</html>