<%-- 
    Document   : ViewFurniture
    Created on : 26 Mar, 2024, 5:15:00 PM
    Author     : Admin
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nest View Furniture</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <form name="frmfurniture" method="post">
            <table>
                <tr>
                    <th colspan="2" align="center">View Furniture</th>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="sel_district" id="sel_district" onchange="getFurniture(this.value)">
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
            </table>
            <table id="tblViewfur">

            </table>
        </form>
        <%@include file="Foot.jsp" %>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                            function getFurniture(fid)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxFurniture.jsp?fid=" + fid,
                                    success: function(html) {
                                        $("#tblViewfur").empty(html);
                                        $("#tblViewfur").append(html);

                                    }
                                });
                            }


    </script>
</html>