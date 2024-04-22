<%-- 
    Document   : ViewRequest
    Created on : 2 Apr, 2024, 9:14:32 AM
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
        <th >User Name</th>
        <th >Property Details</th>
    </tr>


    <%        int i = 0;
        if (request.getParameter("ac") != null) {
            String s = "update tbl_request set request_status=1 where request_id='" + request.getParameter("ac") + "'";
            con.executeCommand(s);
            response.sendRedirect("ViewRequest.jsp");
        } else if (request.getParameter("rj") != null) {
            String s = "update tbl_request set request_status=2 where request_id='" + request.getParameter("rj") + "'";
            boolean st = con.executeCommand(s);
            if (st) {
                response.sendRedirect("ViewRequest.jsp");
            }
        }
        String selQry1 = "select * from tbl_request r inner join tbl_property f on f.property_id=r.property_id inner join tbl_property_owners fo on fo.property_owners_id=f.property_owners_id inner join tbl_user u on u.user_id=r.user_id where fo.property_owners_id='" + session.getAttribute("pid") + "'";
        ResultSet rs1 = con.selectCommand(selQry1);

        while (rs1.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs1.getString("request_date")%></td>
        <td ><%
            int s = Integer.parseInt(rs1.getString("request_status"));
            if (s == 0) {
            %>Pending
            <% } else if (s == 1) {
            %>
            Accept
            <% } else {
            %>Reject<% }%>
        </td>
        <td ><%=rs1.getString("user_name")%></td>
        <td ><%=rs1.getString("property_details")%></td>

        <td><a href="ViewRequest.jsp?ac=<%=rs1.getString("request_id")%>">Accept</a></td> 
        <td><a href="ViewRequest.jsp?rj=<%=rs1.getString("request_id")%>">Reject</a></td> 
        <td><a href="PChat/Chat.jsp?id=<%=rs1.getString("user_id")%>">Chat</a></td> 
    </tr>
    <%                      }


    %>
</table>
<%@include file="Foot.jsp" %>