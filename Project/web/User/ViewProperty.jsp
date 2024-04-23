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
        <title>Nest View Property</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <form name="frmproperty" method="post">
            <table>
                <tr>
                    <th  colspan="2" align="center">View Property</th>
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
                      <td>Price</td>
                    <td>
                          
                <input type="text" name="search" id="searchprop" onkeyup="getsearch()">
                        
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
                             function getsearch()
                             
                            {
                                var word=document.getElementById("searchprop").value
                                console.log(word)
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxPPrice.jsp?word=" +word,
                                    success: function(html) {
                                        $("#tblViewprop").empty(html);
                                        $("#tblViewprop").append(html);

                                    }
                                });
                            }


    </script>
    <%@include file="Foot.jsp" %>
</html>