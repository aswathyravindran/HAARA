<%-- 
    Document   : complaint
    Created on : 16 Mar, 2024, 12:19:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint page</title>
    </head>
    <body>
        <form method="post" form name="complaint">
            <table border="1" align="center"
                   <tr>
                    <td>Complaint</td>
                    <td>
                        <textarea name="txtdesc" rows="6" cols="20"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit"  name="btnsubmit" value="submit">
                        <input type="reset"  name="btncancel" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
