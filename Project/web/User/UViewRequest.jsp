<%-- 
    Document   : UViewRequest
    Created on : 3 Apr, 2024, 5:27:32 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

    <table border="1" align="center">
        <tr >
            <th >Sl.No</th>
            <th >Date</th>
            <th >Status</th>
            <th >Property Details</th>
           
        </tr>
         <%        int i = 0;
          String selQry2 = "select * from tbl_request r ,tbl_property p , tbl_user u where p.property_id=r.property_id and r.user_id='" + session.getAttribute("uid") + "' and u.user_id=r.user_id ";
        ResultSet rs2 = con.selectCommand(selQry2);

        while (rs2.next()) {

            i++;

    %>
    
        <tr>
        <td ><%=i%></td>
        <td ><%=rs2.getString("request_date")%></td>
        <td ><%
            int s = Integer.parseInt(rs2.getString("request_status"));
            if (s == 0) {
            %>Pending
            <% } else if (s == 1) {
            %>
            Accept
            <% } else {
            %>Reject<% }%>
            </td>
        
      
       <td ><%=rs2.getString("property_details")%></td>
       
    </tr>
    <%                      }


    %>
    </table>
        <table border="1" align="center">
        <tr >
            <th >Sl.No</th>
            <th >Date</th>
            <th >Status</th>
            <th >Furniture Details</th>
           
        </tr>
    <%        int j = 0;
          String selQry = "select * from tbl_request r ,tbl_furniture p , tbl_user u where p.furniture_id=r.furniture_id and r.user_id='" + session.getAttribute("uid") + "' and u.user_id=r.user_id ";
        ResultSet rs = con.selectCommand(selQry);

        while (rs.next()) {

            j++;

    %>
        
        <tr>
        <td ><%=j%></td>
        <td ><%=rs.getString("request_date")%></td>
        <td ><%
            int s = Integer.parseInt(rs.getString("request_status"));
            if (s == 0) {
            %>Pending
            <% } else if (s == 1) {
            %>
            Accept
            <a href="FChat/Chat.jsp?fid=<%=rs.getString("furniture_owner_id")%>">Chat</a>
            <% } else {
            %>Reject<% }%>
            </td>
        
        <td ><%=rs.getString("furniture_description")%></td>
      
       
    </tr>
    <%                      }


    %>
</table>