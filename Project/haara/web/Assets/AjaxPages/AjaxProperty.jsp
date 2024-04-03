<%-- 
    Document   : AjaxProperty
    Created on : 1 Apr, 2024, 5:07:38 PM
    Author     : Admin
--%>

<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<table> 
<tr>
                    <th colspan="2">Property Name</th>
                    <th>Details</th>
                    <th>Price</th>                       
                </tr>
<%
    String sel = "select * from tbl_property h,tbl_district d,tbl_place p where h.place_id=p.place_id and p.district_id=d.district_id and d.district_id='" + request.getParameter("pid") + "'";
    ResultSet rs = con.selectCommand(sel);
    while (rs.next()) {
%>


<tr>
    <td><img src="../Assets/Files/<%=rs.getString("property_file")%>" width="200" height="200"/></td>
    <td><%=rs.getString("property_details")%></td>
    <td><%=rs.getString("property_address")%></td>
   
   
</tr>
<tr align="right">
    <td colspan="4"><a href="ViewMoreProp.jsp?pid=<%=rs.getString("property_id")%>">View More</a></td>
</tr>
<%
}
    %>
</table>