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
<<<<<<< HEAD
<<<<<<< HEAD
        <a href="UViewRequest.jsp">Request Status</a>
        <a href="Complaint.jsp">Have any complaints?</a>
=======
         <a href="Wishlist.jsp">Wishlist</a>
>>>>>>> b24a42f3a5cbc3062dd115023cf93d0d0ac5b9a2
=======
         <a href="Wishlist.jsp">Wishlist</a>
>>>>>>> b24a42f3a5cbc3062dd115023cf93d0d0ac5b9a2
        <input type="submit" name="btnmyprofile" value="My Profile">
        </form>
    </body>
</html>