<%-- 
    Document   : AdminhomePage
    Created on : 21 Mar, 2024, 5:38:21 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body>
        <h1>Hello <%=session.getAttribute("aname")%></h1>
        <a href="PropertyOwnerList.jsp">Property Owners</a>
        <a href="FurnitureOwnerList.jsp">Furniture Owners</a>
        <a href="UserList.jsp">Users</a>
    </body>
</html>

