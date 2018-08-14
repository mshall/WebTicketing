<!DOCTYPE html>
<html>
    <head>
<title><fmt:message key="technical_tickets" /></title>
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
                                    <fmt:message key="tickets_history" />
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in">
                            <div class="panel-body" id="ticketsHistory">
                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>     
<script src="assets/js/operations/technical/tickets.js"></script>
        <script>
            $(document).ready(function () {
            	getTicketsHistory();
            });
        </script>
    </body>
</html>
