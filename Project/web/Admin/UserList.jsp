<%-- 
    Document   : UserList
    Created on : 2 Apr, 2024, 5:04:03 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List</title>
    </head>
    <body>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_user where user_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("UserList.jsp");
            }

        %>
        <form name="usrlist" method="post">
        <h1>Users</h1>
        <table border="1" align="center">  
            <tr >
                <th >Sl.No</th>
                <th >Name</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Action</th>
            </tr>


            <%        int i = 0;
                String selQry = "select * from tbl_user";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {

                    i++;

            %>
            <tr>
                <td ><%=i%></td>
                <td ><%=rs.getString("user_name")%></td>
                <td ><%=rs.getString("user_email")%></td>
                <td ><%=rs.getString("user_contact")%></td>
                <td ><%=rs.getString("user_address")%></td>
                <td ><a href="UserList.jsp?del=<%=rs.getString("user_id")%>">Delete</a></td>
            </tr>
            <%                      }


            %>


        </table>

        </form>
    </body>
</html>
