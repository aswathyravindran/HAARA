<%-- 
    Document   : PropertyOwner
    Created on : 2 Apr, 2024, 4:49:42 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pownerlist</title>
    </head>
    <body>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_property_owners where property_owners_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("PropertyOwnerList.jsp");
            }

        %>
        <h1>Property Owners</h1>
        <form name="polist">
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


                <%        int j = 0;
                    String selQry1 = "select * from tbl_property_owners";
                    ResultSet rs1 = con.selectCommand(selQry1);
                    while (rs1.next()) {

                        j++;

                %>
                <tr>
                    <td ><%=j%></td>
                    <td ><%=rs1.getString("property_owners_name")%></td>
                    <td ><%=rs1.getString("property_owners_email")%></td>
                    <td ><%=rs1.getString("property_owners_contact")%></td>
                    <td ><%=rs1.getString("property_owners_address")%></td>
                    <td ><a href="PropertyOwnerList.jsp?del=<%=rs1.getString("property_owners_id")%>">Delete</a></td>
                </tr>
                <%                      }


                %>
            </table>
        </form>
    </body>
</html>
