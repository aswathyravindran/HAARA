<%-- 
    Document   : calculator.jsp
    Created on : 18 Feb, 2024, 11:50:56 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculator</title>
    </head>
    <body>
        <h1>CALCULATOR</h1>
        <%
            int a=0,b=0,c=0;
            if(request.getParameter("btnadd")!=null)
            {
                a=Integer.parseInt(request.getParameter("txtname1"));
                b=Integer.parseInt(request.getParameter("txtname2"));
                c=a+b;        
            }
            else if(request.getParameter("btnsub")!=null)
            {
                a=Integer.parseInt(request.getParameter("txtname1"));
                b=Integer.parseInt(request.getParameter("txtname2"));
                c=a-b;
            }
            else if(request.getParameter("btnmul")!=null)
            {
                a=Integer.parseInt(request.getParameter("txtname1"));
                b=Integer.parseInt(request.getParameter("txtname2"));
                c=a*b;
            }
            else if(request.getParameter("btndiv")!=null)
            {
                a=Integer.parseInt(request.getParameter("txtname1"));
                b=Integer.parseInt(request.getParameter("txtname2"));
                c=a/b;
            }
           %> 
        <form method="post" form name="calculator">
        <table border="1">
            <tr>
                <td>No1</td>
                <td><input type="text" name="txtname1" placeholder="enter number1"></td>
            </tr> 
            <tr>
                <td>No2</td>
                <td><input type="text" name="txtname2" placeholder="enter number2"></td>
            </tr>
            <tr>
		<td colspan="2">
			<input type="submit" name="btnadd" value="+">
                        <input type="Submit" name="btnsub" value="-">
                        <input type="Submit" name="btnmul" value="*">
                        <input type="Submit" name="btndiv" value="/">
	    </tr>
            <tr>
                <td>Result</td>
                <td><%=c%></td>
            </tr>
        </table>
    </form>
    </body>
</html>
