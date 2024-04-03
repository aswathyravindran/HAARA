<%-- 
    Document   : ViewRequests
    Created on : 2 Apr, 2024, 10:16:05 AM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

    <table border="1" align="center">
        <tr >
            <th >Sl.No</th>
            <th >Date</th>
            <th >Status</th>
            <th >User Name</th>
            <th >Furniture Details</th>
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
        String selQry1 = "select * from tbl_request r ,tbl_furniture p , tbl_user u where p.furniture_id=r.furniture_id and r.user_id='" + session.getAttribute("uid") + "' and u.user_id=r.user_id ";
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

        <td ><a href="ViewRequests.jsp?ac=<%=rs1.getString("request_id")%>">Accept</a></td> 
        <td ><a href="ViewRequests.jsp?rj=<%=rs1.getString("request_id")%>">Reject</a></td> 
    </tr>
    <%                      }


    %>
</table>