<%-- 
    Document   : District
    Created on : 17 Mar, 2024, 10:32:42 AM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Head.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <body>

        <%-- //submit--%>
        <%

            if (request.getParameter("btnsubmit") != null) {
                String districtName = request.getParameter("txtname");
                String insQry = "insert into tbl_district(district_name)values('" + districtName + "') ";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "District.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "District.jsp";
        </script>
        <%
                }
            }

        %>

        <%-- //delete --%>


        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_district where district_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("District.jsp");
            }

        %>

        <form method="post" name="district">
            <table border="2" align="center">
                <td>District</td>
                <td>
                    <input type="text" name="txtname" placeholder="Enter district" required="">
                </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit"  name="btnsubmit" value="submit">
                        <input type="reset"  name="btncancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>

<%--to show the table in the page--%>
<table border="1" align="center">  


    <tr >
        <th >Sl.No</th>
        <th >Name</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_district";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("district_name")%></td>
        <td ><a href="District.jsp?del=<%=rs.getString("district_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
    <%@include file="Foot.jsp" %>