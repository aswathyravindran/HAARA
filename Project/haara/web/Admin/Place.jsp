<%-- 
    Document   : Place
    Created on : Mar 17, 2024, 10:11:39 AM
    Author     : mariy
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>place</title>
    </head>
    <body>
        <%

            if (request.getParameter("btn_submit") != null) {
                String placeName = request.getParameter("txtplace");
                String district = request.getParameter("district");
                String insQry = "insert into tbl_place(place_name,district_id)values('" + placeName + "','" + district + "') ";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Place.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "Place.jsp";
        </script>
        <%
                }
            }

        %>


        <form method="post" name="place">
            <table border="2" align="center">
                <tr>
                    <td>District</td>
                    <td>
                        <select name="district">
                            <option value="sel">--select--</option>
                            <%                                String selQry = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                                }

                            %>

                            <%    if (request.getParameter("del") != null) {
                                    String delQry = "delete from tbl_place where place_id='" + request.getParameter("del") + "'";
                                    con.executeCommand(delQry);
                                    response.sendRedirect("Place.jsp");
                                }

                            %>

                        </select>	      
                    </td>
                </tr>
                <tr>
                    <td>Places</td>
                    <td>
                      <%--  <select name="place">
                            <option value="sel">--select--</option>
                               <%  String selQry1 = "select * from tbl_place p inner join tbl_district d on d.district_id=p.district_id";
                                ResultSet rs1 = con.selectCommand(selQry1);
                                while (rs1.next()) {
                            %>
                            <option value="<%=rs1.getString("place_id")%>"><%=rs1.getString("place_name")%></option>
                            <%
                                }

                            %>
</select>	  --%>    
                      <input type="text" name="txtplace" placeholder="enter your place" required="">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Save"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>

<table border="1" align="center">


    <tr >
        <th >Sl.No</th>
        <th >District</th>
        <th >Place</th>
    </tr>

    <%        int i = 0;
        //here is a problem
        String selQry1 = "select * from tbl_place p inner join tbl_district d on d.district_id=p.district_id";
        ResultSet rs1 = con.selectCommand(selQry1);
        while (rs1.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs1.getString("district_name")%></td>
        <td ><%=rs1.getString("place_name")%></td>
        <%--<td ><%=rso.getString("admin_password")%></td>
        <td ><%=rso.getString("admin_contact")%></td> --%>
        <td ><a href="Place.jsp?del=<%=rs1.getString("place_id")%>">Delete</a></td> 
    </tr>
    <%                      }


    %>

</table>