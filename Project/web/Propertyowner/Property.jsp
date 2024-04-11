<%-- 
    Document   : property.jsp
    Created on : Mar 16, 2024, 11:49:31 AM
    Author     : mariy
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<h1 align="center">Property</h1>-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

//            if (request.getParameter("btnsubmit") != null) {
//                
//                String propertyAddress = request.getParameter("txtaddress");
//                String propertyPrice = request.getParameter("txtprice");
//                String propertyDetails = request.getParameter("txtdetails");
//                String contractTime = request.getParameter("txttime");
//                String insQry = "insert into tbl_property (property_photo,property_address,property_price,property_details,place_id,property_contract_time)values('" + propertyAddress + "','" + propertyPrice + "','" + propertyDetails + "','" + contractTime+ "') ";
//                
//                if (con.executeCommand(insQry)) {
        %>
        <script>
//            alert("Record Saved");
//            window.location = "property.jsp";
        </script>
        <%//        } else {

        %>
        <script>
//            alert("Failed");
//            window.location = "property.jsp";
        </script>
        <%//                }
//            }

        %>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_property where property_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Property.jsp");
            }

        %>
        <form name="frmProperty" method="post" enctype="multipart/form-data" action="../Assets/ActionPages/PropertyUploadAction.jsp">
            <table border="1" align="center">
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file_photo"></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="txtprice"></td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td><textarea name="txtdetails" rows="2" cols="16"></textarea></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                            <option value="">-----Select------</option>
                            <%                                String sel = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%}%>
                        </select>                       
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="sel_place" id="sel_place">
                            <option value="">-----Select-----</option>
                        </select>                       
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea name="txtaddress" rows="2" cols="16"></textarea>
                    </td>
                <tr>
                    <td>Contract Time</td>
                    <td><input type="text" name="txtprice"></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset"  name="btnreset"  value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                            function getPlace(did)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                    success: function(html) {
                                        $("#sel_place").html(html);

                                    }
                                });

                            }
    </script>
</html>
<table border="1" align="center">
    <tr >
        <th >Sl.No</th>
        <th >Address</th>
        <th >Price</th>
        <th >Details</th>
        <th >Contract time</th>
        <th colspan="2">Action</th>
    </tr>

    <%        int i = 0;
        //here is a problem
        String selQry1 = "select * from tbl_property p inner join tbl_property_owners d on d.property_owners_id=p.property_owners_id and p.property_owners_id='" + session.getAttribute("pid") + "'";
        ResultSet rs1 = con.selectCommand(selQry1);

        while (rs1.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs1.getString("property_address")%></td>
        <td ><%=rs1.getString("property_price")%></td>
        <td ><%=rs1.getString("property_details")%></td>
        <td ><%=rs1.getString("property_contract_time")%></td>
        <%--<td ><%=rso.getString("admin_password")%></td>
        <td ><%=rso.getString("admin_contact")%></td> --%>
        <td ><a href="Addphoto.jsp?prid=<%=rs1.getString("property_id")%>">Add Photos</a></td>
    <td ><a href="Property.jsp?del=<%=rs1.getString("property_id")%>">Delete</a></td> 
</tr>
<%                      }


%>
</table>


