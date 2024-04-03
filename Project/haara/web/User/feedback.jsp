<%-- 
    Document   : feedback.jsp
    Created on : 16 Mar, 2024, 12:21:47 PM
    Author     : vdjuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
    </head>
    <body>
         <p align="center"> </p>

        <form method="post">
        
        <table border="1" align="center">

	<tr>
 		<td>Title</td>
 		<td><input type="text" name="txtname" placeholder="enter title"></td>
	</tr>
         	<tr>
 		<td>Feedback content</td>
 		<td>
    			<textarea name="txtaddress" rows="6" cols="20"></textarea>
		</td>
	</tr>
            <tr>
 		<td colspan="2" align="center">
    			<input type="submit" name="btnsubmit" value="Submit">
    			<input type="reset"  name="btnreset"  value="Cancel">
 		</td>
	</tr>
	
        </table>
        </form>
        
    </body>
</html>