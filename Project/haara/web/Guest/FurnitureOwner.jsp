<%-- 
    Document   : fowner.jsp
    Created on : 16 Mar, 2024, 11:59:01 AM
    Author     : vdjuc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F_OWNER</title>
    </head>
    <body>
        <p align="center">FOWNER </p>

        <%--  <form method="post"> --%>
        <form name="frmFurnitureOwner" method="post" enctype="multipart/form-data" action="../Assets/ActionPages/FOwnerUploadAction.jsp">

            <table border="1" align="center">

                 <tr>
                <td>Name</td>
                <td><input type="text" name="name" placeholder="enter name"></td>
            </tr>
            <tr>
                <td>Contact</td>
                <td><input type="number" max="9999999999" name="txtcontact" required=""> </td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" placeholder="enter email"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="txtpwd" placeholder="enter password"></td>
            </tr>
            <tr>
                <td>District</td>
                <td>
                    <select name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                        <option value="">-----Select------</option>
                        <%
                            String sel = "select * from tbl_district";
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
                    <textarea name="txtaddress" rows="6" cols="20" placeholder="enter address"></textarea>
                </td>
            </tr>
            <tr>
                <td>Proof</td>
                <td><input type="file" name="file_proof"></td>
            </tr>
            <tr>
                <td>Photo</td>
                <td><input type="file" name="file_photo"></td>
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