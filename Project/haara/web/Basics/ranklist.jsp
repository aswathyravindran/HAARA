<%-- 
    Document   : ranklist
    Created on : 22 Feb, 2024, 2:01:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ranking system</title>
    </head>
    <body>
        <h1>GRADE CARD</h1>
        <%
            double tm = 0, p = 0;
            String fn = "", ln = "", gr = "", dept = "", gnd = "", nm = "";
            if (request.getParameter("btnsubmit") != null) {
                fn = request.getParameter("firstname");
                ln = request.getParameter("lastname");
                int m1 = Integer.parseInt(request.getParameter("M1"));
                int m2 = Integer.parseInt(request.getParameter("M2"));
                int m3 = Integer.parseInt(request.getParameter("M3"));
                tm = m1 + m2 + m3;
                p = (tm / 300)*100;
                gnd = request.getParameter("Gender");
                if (gnd.compareTo("Female")==0) {
                    nm = "Ms " + fn+" "+ ln;
                }
                else if (gnd.compareTo("Male") ==0) {
                    nm = "Mr " + fn+" " +ln;
                }
                if (p >= 90) {
                    gr = "S";
                } else if (p >= 80 && p < 90) {
                    gr = "A";
                } else if (p >= 70 && p < 80) {
                    gr = "B";
                } else if (p > 60 && p < 70) {
                    gr = "C";
                } else if (p >= 50 && p < 60) {
                    gr = "D";
                } else {
                    gr = "F";
                }

                dept = request.getParameter("dpt");
            }
        %>
        <form method="post" form name="rnklist">
            <table border="1">
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="firstname" placeholder="Enter first name"></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="lastname" placeholder="Enter last name"></td>
                </tr>
                <tr>
                    <td>GENDER</td>
                    <td>
                        <input type="radio" name="Gender" value="Female">Female
                        <input type="radio" name="Gender" value="Male">Male
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <select name="dpt">
                            <option>Select</option>
                            <option value="AD">Artificial Intelligence</option>
                            <option value="CE">Civil Engineering</option>
                            <option value="CS">Computer Science</option>
                            <option value="ME">Mechanical Engineering</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Mark1</td>
                    <td><input type="number" name="M1" placeholder="Mark1" max="100"</td>
                </tr>
                <tr>
                    <td>Mark2</td>
                    <td><input type="number" name="M2" placeholder="Mark2" max="100"</td>
                </tr>
                <tr>
                    <td>Mark3</td>
                    <td><input type="number" name="M3" placeholder="Mark3" max="100"</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit"  name="btnsubmit" value="submit">
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=nm%></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%=gnd%></td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td><%=dept%></td>
                </tr>
                <tr>
                    <td>Total Mark</td>
                    <td><%=tm%></td>
                </tr>
                <tr>
                    <td>Percentage</td>
                    <td><%=p%></td>
                </tr>
                <tr>
                    <td>Grade</td>
                    <td><%=gr%></td>
                </tr>
            </table>
        </form>
    </body>
</html>
