<%-- 
    Document   : ShomePage
    Created on : 21 Mar, 2024, 5:39:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <form name="frmMyprofile" method="post">
        <h1>Hello <%=session.getAttribute("fname")%></h1>
        <a href="Sprofile.jsp">Profile</a>
        <a href="Furniture.jsp">Furniture</a>
        <a href="ViewRequests.jsp">Requests</a>
        </form>
    </body>
</html>