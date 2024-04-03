<%-- 
    Document   : HomePage
    Created on : 21 Mar, 2024, 5:39:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home Page</title>
    </head>
    <body>
        <%if (request.getParameter("btnmyprofile") != null) {
            response.sendRedirect("../User/MyProfile.jsp");
        }
        %>
        <form name="frmMyprofile" method="post">
        <h1>Hello <%=session.getAttribute("uname")%></h1>
        <!--<a href="MyProfile.jsp">Profile</a>-->
        <a href="ViewProperty.jsp">Property</a>
        <a href="ViewFurniture.jsp">Furniture</a>
        <input type="submit" name="btnmyprofile" value="My Profile">
        </form>
    </body>
</html>