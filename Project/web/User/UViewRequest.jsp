<%-- 
    Document   : UViewRequest
    Created on : 3 Apr, 2024, 5:27:32 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Head.jsp" %>
<table border="1" align="center">
    <tr >
        <th >Sl.No</th>
        <th >Date</th>
        <th >Status</th>
        <th >Furniture Details</th>
    </tr>
    <%        int j = 0;
        String selQry = "select * from tbl_request r inner join tbl_furniture f on f.furniture_id=r.furniture_id inner join tbl_furniture_owner fo on fo.furniture_owner_id=f.furniture_owner_id inner join tbl_user u on u.user_id=r.user_id where u.user_id='" + session.getAttribute("uid") + "'";
        ResultSet rs = con.selectCommand(selQry);

        while (rs.next()) {
            j++;
    %>

    <tr>
        <td ><%=j%></td>
        <td ><%=rs.getString("request_date")%></td>
        <td ><%
            int s1 = Integer.parseInt(rs.getString("request_status"));
            int p = rs.getInt("payment_status");
            if (s1 == 0) {
            %>Pending
            <% } else if (s1 == 1) {
            %>
            Accept
            <a href="FChat/Chat.jsp?id=<%=rs.getString("furniture_owner_id")%>">Chat</a>


            <%if (p == 1) {
            %>Paid
            <% } else if (p == 0) {
            %>
            <a href="Payment.jsp?id=<%=rs.getString("request_id")%>">Pay</a>
            <% }
            } else {
            %>Reject<% }%>
        </td>

        <td ><%=rs.getString("furniture_description")%></td>


    </tr>
    <%                      }


    %>
</table>

<table border="1" align="center">
    <tr >
        <th >Sl.No</th>
        <th >Date</th>
        <th >Status</th>
        <th >Property Details</th>

    </tr>
    <%        int j1 = 0;
        String selQry1 = "select * from tbl_request r inner join tbl_property f on f.property_id=r.property_id inner join tbl_property_owners fo on fo.property_owners_id=f.property_owners_id inner join tbl_user u on u.user_id=r.user_id where u.user_id='" + session.getAttribute("uid") + "'";
        System.out.println(selQry);
        ResultSet rs1 = con.selectCommand(selQry1);

        while (rs1.next()) {

            j++;

    %>

    <tr>
        <td ><%=j%></td>
        <td ><%=rs1.getString("request_date")%></td>
        <td ><%
            int s = Integer.parseInt(rs1.getString("request_status"));
            int p = rs1.getInt("payment_status");
            if (s == 0) {
            %>Pending
            <% } else if (s == 1) {
            %>
            Accept
            <a href="PChat/Chat.jsp?id=<%=rs1.getString("property_owners_id")%>">Chat</a>x
            
            <%if (p == 1) {
            %>Paid
            <% } else if (p == 0) {
            %>
            <a href="Payment.jsp?id=<%=rs1.getString("request_id")%>">Pay</a>
          
            
            <%  } } else {
            %>Reject<% }%>
        </td>

        <td ><%=rs1.getString("property_details")%></td>


    </tr>
    <%                      }


    %>
</table>
<%@include file="Foot.jsp" %>