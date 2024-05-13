<%-- 
    Document   : AjaxPPrice
    Created on : Apr 22, 2024, 8:48:10 PM
    Author     : mariy
--%>

<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <table>  
        <tr>
            <th>Property</th>
            <th>Details</th>
            <th>Price</th>                       
        </tr>
    <%
        String word=request.getParameter("word");
//        out.print(word);
        String sel = "SELECT * FROM tbl_property WHERE property_price <=  "+ word  ;
        out.print(sel);
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
    %>


    <tr>
        <td><img src="../Assets/Files/<%=rs.getString("property_file")%>" width="200" height="200"/></td>
        <td><%=rs.getString("property_details")%></td>
        <td><%=rs.getString("property_price")%></td>


    </tr>
    <tr align="right">
        <td><a href="ViewMoreProp.jsp?pid=<%=rs.getString("property_id")%>">View More</a></td>
        <td colspan="4"><a href="PropertyReview.jsp?id=<%=rs.getString("property_id")%>">Review</a></td>

    </tr>
    <%
        }
    %>
</table>