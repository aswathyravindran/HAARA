<%-- 
    Document   : AjaxProperty
    Created on : 1 Apr, 2024, 5:07:38 PM
    Author     : Admin
--%>

<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<table>
    <tr>
        <th>Furniture</th>
        <th>Details</th>
        <th>Price</th>                       
    </tr>

<%
    String selx = "select * from tbl_property h,tbl_district d,tbl_place p where h.place_id=p.place_id and p.district_id=d.district_id and d.district_id='" + request.getParameter("pid") + "'";
    ResultSet rsx = con.selectCommand(selx);
    while (rsx.next()) {
%>


<tr>
    <td><img src="../Assets/Files/<%=rsx.getString("property_file")%>" width="200" height="200"/></td>
    <td><%=rsx.getString("property_details")%></td>
    <td><%=rsx.getString("property_price")%></td>


</tr>
<tr align="right">
    <td><a href="ViewMoreProp.jsp?pid=<%=rsx.getString("property_id")%>">View More</a></td>
    <td colspan="4"><a href="PropertyReview.jsp?id=<%=rsx.getString("property_id")%>">Review</a></td>
</tr>
<%
    }
%>
</table>




