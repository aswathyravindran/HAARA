<%-- 
    Document   : ViewProperty
    Created on : 26 Mar, 2024, 4:58:26 PM
    Author     : Admin
--%>



<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nest View Property</title>
    </head>
    <body>
        <form name="frmproperty" method="post">
            <table>
                <tr>
                    <th colspan="2" align="center">View property</th>
                </tr>
                <tr>
                <td>District</td>
                <td>
                    <select name="sel_district" id="sel_district" onchange="getProperty(this.value)">
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
            <table id="tblViewprop">
              
            </table>
        </form>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                        function getProperty(pid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxProperty.jsp?pid=" + pid,
                                success: function(html) {
                                    $("#tblViewprop").empty(html);
                                    $("#tblViewprop").append(html);

                                }
                            });
                        }
         

    </script>
</html>