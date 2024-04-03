<%-- 
    Document   : FurnitureOwner
    Created on : 2 Apr, 2024, 4:50:21 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Furniture Owners</title>
    </head>
    <body>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_furniture_owner where furniture_owner_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("FurnitureOwnerList.jsp");
            }

        %>
        <h1>Furniture Owners</h1>
        <form name="folist">
            <table border="1" align="center">
                <tr >
                    <th >Sl.No</th>
                    <th >Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Status</th>
                    <th >Action</th>
                </tr>


                <%        int k = 0;
                    String selQry2 = "select * from tbl_furniture_owner";
                    ResultSet rs2 = con.selectCommand(selQry2);
                    while (rs2.next()) {

                        k++;

                %>
                <tr>
                    <td ><%=k%></td>
                    <td ><%=rs2.getString("furniture_owner_name")%></td>
                    <td ><%=rs2.getString("furniture_owner_email")%></td>
                    <td ><%=rs2.getString("furniture_owner_contact")%></td>
                    <td ><%=rs2.getString("furniture_owner_address")%></td>
                    <td ><a href="FurnitureOwnerList.jsp?del=<%=rs2.getString("furniture_owner_id")%>">Delete</a></td>
                </tr>
                <%                      }


                %>


            </table>



        </form>
    </body>
</html>
