<%-- 
    Document   : ViewPhotos
    Created on : 10 Apr, 2024, 1:15:48 PM
    Author     : Elna Thankachan
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>View Photo</title>
        </head>
        <body>
        <%@include file="Head.jsp" %>
            <table align="center">  
                <tr align="center">
                <%        int i = 0;
                    String selQry = "select * from tbl_photo where furniture_id='" + request.getParameter("frid") + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;
                        if (i == 5) {
                %>
            </tr><tr align="center">
                <% }%>
                <td><a href="../Assets/Files/<%=rs.getString("photo_image")%>"><img src="../Assets/Files/<%=rs.getString("photo_image")%>" width="200" height="200"/></a>
                    <br>
                    <%=rs.getString("photo_caption")%>
                </td>
                <%                      }
                %>
            </tr>
        </table>
                <%@include file="Foot.jsp" %>
    </body>
</html>
