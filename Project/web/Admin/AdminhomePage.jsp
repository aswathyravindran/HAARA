<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Head.jsp" %>
<!-- partial -->
<nav class="navbar col-lg-12 col-12 px-0 py-0 py-lg-4 d-flex flex-row">
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
        </button>

        <h4 class="font-weight-bold mb-0 d-none d-md-block mt-1">Welcome back</h4>
        <ul class="navbar-nav navbar-nav-right">

        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
        </button>
    </div>

</nav>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-12 col-xl-12 grid-margin stretch-card">
                <div class="row w-100 flex-grow">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title">Website Audience Metrics</p>                     
                                <canvas id="myAreaChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script>



    <%
        String selChart = "SELECT 'Jan' AS month,COUNT(*) AS total_count FROM tbl_request WHERE MONTHNAME(request_date) = 'January' UNION ALL SELECT 'Feb' AS month, COUNT(*) AS total_count FROM tbl_request WHERE MONTHNAME(request_date) = 'February' UNION ALL SELECT  'Mar' AS month, COUNT(*) AS total_count FROM   tbl_request WHERE   MONTHNAME(request_date) = 'March' UNION ALL SELECT   'Apr' AS month, COUNT(*) AS total_count FROM  tbl_request WHERE   MONTHNAME(request_date) = 'April' UNION ALL SELECT  'May' AS month, COUNT(*) AS total_count FROM  tbl_request WHERE  MONTHNAME(request_date) = 'May' UNION ALL SELECT   'Jun' AS month,   COUNT(*) AS total_count FROM   tbl_request WHERE   MONTHNAME(request_date) = 'June' UNION ALL SELECT   'Jul' AS month,  COUNT(*) AS total_count FROM   tbl_request WHERE  MONTHNAME(request_date) = 'July' UNION ALL SELECT   'Aug' AS month, COUNT(*) AS total_count FROM  tbl_request WHERE  MONTHNAME(request_date) = 'August' UNION ALL SELECT  'Sep' AS month, COUNT(*) AS total_count FROM  tbl_request WHERE   MONTHNAME(request_date) = 'September' UNION ALL SELECT  'Oct' AS month, COUNT(*) AS total_count FROM  tbl_request WHERE  MONTHNAME(request_date) = 'October' UNION ALL SELECT 'Nov' AS month, COUNT(*) AS total_count FROM  tbl_request WHERE  MONTHNAME(request_date) = 'November' UNION ALL SELECT 'Dec' AS month, COUNT(*) AS total_count FROM tbl_request WHERE MONTHNAME(request_date) = 'December'";
        ResultSet rsX = con.selectCommand(selChart);
        ResultSet rsY = con.selectCommand(selChart);
    %>


    var xValues = [
    <%
        while (rsX.next()) {
            out.print("'" + rsX.getString("month") + "',");
        }
    %>
    ];

    var yValues = [
    <%
        while (rsY.next()) {
            out.print(rsY.getString("total_count") + ",");
        }
    %>
    ];



    var barColors = [
        "#b91d47",
        "#00aba9",
        "#2b5797",
        "#e8c3b9",
        "#1e7145",
        "#b91d47",
        "#00aba9",
        "#2b5797",
        "#e8c3b9",
        "#1e7145",
        "#b91d47",
        "#00aba9",
        "#2b5797",
        "#e8c3b9",
        "#1e7145",
        "#b91d47",
        "#00aba9",
        "#2b5797",
        "#e8c3b9",
        "#1e7145"
    ];

    new Chart("myAreaChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                    label: "Request Wise",
                    backgroundColor: barColors,
                    data: yValues
                }]
        },
        options: {
            title: {
                display: true,
                text: "All Request Data"
            }
        }
    });


</script>
<%@include file="Foot.jsp" %>