<%-- 
    Document   : Complaints.jsp
    Created on : 4 Apr, 2024, 5:31:08 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Complaints</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <table border="1" align="center">  
    <tr >
        <th >Sl.No</th>
        <th >Complaint</th>
        <th >User</th>
        <th >Reply</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_complaint c inner join tbl_user u on u.user_id=c.user_id";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("complaint_content")%></td>
         <td ><%=rs.getString("user_name")%></td>
         <% if(Integer.parseInt(rs.getString("complaint_status"))==0){ %>
        <td ><a href="ComplaintReply.jsp?cid=<%=rs.getString("complaint_id")%>">Reply</a></td>
        <% } else{ %>
        <td ><%=rs.getString("complaint_reply")%><a href="ComplaintReply.jsp?cid=<%=rs.getString("complaint_id")%>">Edit</a></td>
         <% }  %>
    </tr>
    <%                      }


    %>
</table>
    <%@include file="Foot.jsp" %>
    </body>
</html>

