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
            response.sendRedirect("../Propertyowner/Pprofile.jsp");
        }
        %>
        <form name="frmMyprofile" method="post">
        <h1>Hello <%=session.getAttribute("pname")%></h1>
        <input type="submit" name="btnmyprofile" value="My Profile">
        </form>
    </body>
</html>