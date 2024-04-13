<%-- 
    Document   : ViewRequests
    Created on : 2 Apr, 2024, 10:16:05 AM
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
            <th >Furniture Details</th>
            <th >Action</th>
        </tr>


    <%        int i = 0;
        if (request.getParameter("ac") != null) {
            String s = "update tbl_request set request_status=1 where request_id='" + request.getParameter("ac") + "'";
            con.executeCommand(s);
            response.sendRedirect("ViewRequests.jsp");
        } else if (request.getParameter("rj") != null) {
            String s = "update tbl_request set request_status=2 where request_id='" + request.getParameter("rj") + "'";
            boolean st = con.executeCommand(s);
            if (st) {
                response.sendRedirect("ViewRequests.jsp");
            }
        }
        String selQry1 = "select * from tbl_request r inner join tbl_furniture f on f.furniture_id=r.furniture_id inner join tbl_furniture_owner fo on fo.furniture_owner_id=f.furniture_owner_id inner join tbl_user u on u.user_id=r.user_id where fo.furniture_owner_id='" + session.getAttribute("fid") + "'";
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
        <td ><%=rs1.getString("furniture_description")%></td>
        <td ><%
            if (s == 0) {
            %>
            <a href="ViewRequests.jsp?ac=<%=rs1.getString("request_id")%>">Accept</a>
            <a href="ViewRequests.jsp?rj=<%=rs1.getString("request_id")%>">Reject</a>
            <% } else if (s == 1) {
            %>

            <a href="ViewRequests.jsp?rj=<%=rs1.getString("request_id")%>">Reject</a>
            <a href="FChat/Chat.jsp?id=<%=rs1.getString("user_id")%>">Chat</a>
            
            <% } else {
            %><a href="ViewRequests.jsp?ac=<%=rs1.getString("request_id")%>">Accept</a>
            <% }%>
        </td>

    </tr>
    <%                      }


    %>
</table>
    <%@include file="Foot.jsp" %>