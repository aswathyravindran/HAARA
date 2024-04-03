<%-- 
    Document   : ls.jsp
    Created on : 18 Feb, 2024, 12:46:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>l and s of num</title>
    </head>
    <body>
        <h1>largest and smallest!</h1>
        <%
            int a = 0, b = 0, c = 0, l = 0, s = 0;
            if(request.getParameter("btnfnd")!=null){
            a = Integer.parseInt(request.getParameter("num1"));
            b = Integer.parseInt(request.getParameter("num2"));
            c = Integer.parseInt(request.getParameter("num3"));
            if (a > b && a > c) {
                l = a;
            }
            if (b > c) {
                s = c;
            } else {
                s = b;
            }
            if (b > a && b > c) {
                l = b;
            }
            if (a > c) {
                s = c;
            } else {
                s = a;
            }
            if (c > a && c > b) {
                l = c;
            }
            if (a > b) {
                s = b;
            } else {
                s = a;
            }}
        %>

    </body>
    <form method="post" form name="lsn">
        <table border="1">
            <tr>
                <td>No1</td>
                <td><input type="text" name="num1" placeholder="enter number1"></td>
            </tr> 
            <tr>
                <td>No2</td>
                <td><input type="text" name="num2" placeholder="enter number2"></td>
            </tr>
            <tr>
                <td>No3</td>
                <td><input type="text" name="num3" placeholder="enter number3"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="btnfnd" value="FIND">
            </tr>
            <tr>
                <td>Largest</td>
                <td><%=l%></td>
            </tr>
            <tr>
                <td>Smallest</td>
                <td><%=s%></td>
            </tr>
        </table>
    </form>
</body>     
</html>
