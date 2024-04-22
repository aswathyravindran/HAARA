<%-- 
    Document   : AddPhoto
    Created on : 13 Apr, 2024, 11:41:43 AM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Photos</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%-- //delete --%>


        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_photo where photo_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("AddPhoto.jsp");
            }

        %>

        <form method="post" name="frmAddphoto" enctype="multipart/form-data" action="../Assets/ActionPages/FPhotoUploadAction.jsp?prid=<%=request.getParameter("prid")%>">
            <table border="2" align="center">
                <tr>
                    <td>Image</td>
                    <td>
                        <input type="file" name="filephoto" required="">
                    </td>
                </tr>
                <tr>
                    <td>Caption</td>
                    <td>
                        <textarea name="txtcaption" placeholder="Enter caption" rows="5"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit"  name="btnsubmit" value="submit">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>

<%--to show the table in the page--%>
<table border="1" align="center">  


    <tr >
        <th >Sl.No</th>
        <th >Caption</th>
        <th >Image</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_photo where furniture_id='" + request.getParameter("prid") + "'";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("photo_caption")%></td>
        <td><img src="../Assets/Files/<%=rs.getString("photo_image")%>" width="120" height="120"/>
        </td>
        <td ><a href="Addphoto.jsp?del=<%=rs.getString("photo_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
    <%@include file="Foot.jsp" %>