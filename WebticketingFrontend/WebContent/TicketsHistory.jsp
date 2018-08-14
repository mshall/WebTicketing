<%-- 
    Document   : TicketsHistory
    Created on : May 25, 2018, 6:21:58 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<title><fmt:message key="tickets_history" /></title>
</head>
<body>
    <%@include file="Header.jsp" %>

    <div class="wrapper ">    
        <%@include  file="AdminSideBar.jsp" %>

        <%-- page Contenct --%>

        <div id="content">
            <div class="panel-group" id="accordion">
                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-target="#collapseOne" 
                               href="#collapseOne">
                               <fmt:message key="tickets_history" />
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body" id ="allTicketsByTechnician">

                        </div>
                    </div>
                </div>


                <br><br><br><br>
                <script src="assets/js/operations/technical/tickets.js"></script>
<script src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">

<script src="assets/js/operations/admin/tickets.js"></script> -->
        <script>



            $(document).ready(function () {
            	getComplaintsByTechnician();
            });
        </script>


    </body>
</html>
