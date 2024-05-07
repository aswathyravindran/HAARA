<%-- 
    Document   : PropertyRequest
    Created on : Apr 22, 2024, 10:31:47 PM
    Author     : mariy
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <% 
        if(request.getParameter("btnrequest")!=null){
            String insQry = "insert into tbl_request(request_date,request_status,user_id,property_id,from_date,to_date,total_days)values(CURDATE(),0,'" + session.getAttribute("uid") + "','" + session.getAttribute("pid") + "','" + request.getParameter("frmdate") + "','" + request.getParameter("todate") + "','" + request.getParameter("days") + "') ";
            boolean status = con.executeCommand(insQry);

        if (status == true) {
%> 
<script type="text/javascript">
    alert("Request Successfully Submitted");
    setTimeout(function() {
        window.location.href = 'ViewMoreProp.jsp?pid=<%=session.getAttribute("pid")%>';
    }, 40);//40millisecend it go to next page
</script>
<%
        }
        }   
            
        String selQ="select * from tbl_property where property_id='"+ session.getAttribute("pid") +"'";    
        ResultSet rs=con.selectCommand(selQ);
        rs.next();
        
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Property Details</td>
                    <td><textarea name="details"  readonly=""><%=rs.getString("property_details")%></textarea></td>
                </tr>
                 <tr>
                    <td>Property Price</td>
                    <td><input type="text" name="price" id="price" value="<%=rs.getString("property_price")%>" readonly=""></td>
                </tr>
                 <tr>
                    <td>From Date</td>
                    <td><input type="date" name="frmdate" id="frmdate"></td>
                </tr>
                 <tr>
                    <td>To Date</td>
                    <td><input type="date" name="todate" id="todate" onchange="getCalculate()"></td>
                </tr>
                <tr>
                    <td>Total Rent Days</td>
                    <td><input type="text" name="days" id="day" readonly="" ></td>
                </tr>
                 <tr>
                    <td>Total Amount</td>
                    <td><input type="text" name="amnt" id="amnt" readonly=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnrequest" value="Request"><input type="reset" name="Cancel" value="Cancel"></td>
                </tr>
            </table>
        </form>
                    <%@include file="Foot.jsp" %>
    </body>
</html>
 <script src="../Assets/JQuery/jQuery.js"></script>
 <script>
        function getCalculate(){
            
            var frm=document.getElementById("frmdate").value;
            var todate=document.getElementById("todate").value;
           
            
            var date1=new Date(frm);
            var date2=new Date(todate);
            
            
            var differencems = Math.abs(date1 - date2);
            var differenceDays = Math.ceil(differencems / (1000 * 60 * 60 * 24));
            if (differenceDays == 0){
                document.getElementById("day").value = 1;
            }
            else{
            document.getElementById("day").value = differenceDays;
        }
            var amnt=document.getElementById("price").value;
//            var days=document.getElementById("day").value;
            if ( differenceDays == 0){
                var totalamnt=1 * amnt;
                document.getElementById("amnt").value = totalamnt.toFixed(2);
            }else{
            var totalamnt=differenceDays * amnt;
            document.getElementById("amnt").value = totalamnt.toFixed(2);
        }
           
            
            
        }
        
     
 </script>
