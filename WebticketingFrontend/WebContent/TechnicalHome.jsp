<!DOCTYPE html>
<html>
    <head>
<title><fmt:message key="technical_home" /></title>
    </head>
    <body>

        <%@include file="Header.jsp" %>

        <div class="wrapper ">    
            <%@include  file="TechnicalSideBar.jsp" %>

            <%-- page Contenct --%>

            <div id="content">
                <div class="panel-group" id="accordion">
                        <div class="panel panel-primary" id="panel2">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-target="#collapseTwo" 
                                   href="#collapseTwo">
                                    <fmt:message key="tickets" />
                                </a>
                            </h4>

                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in">
                            <div class="panel-body" id="allTicketsByTechnician">
                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<script src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">

<script src="assets/js/operations/admin/tickets.js"></script> -->
        <script>



            $(document).ready(function () {
            	getAllComplaints();
            });
        </script>





    </body>
</html>
