<%-- 
    Document   : InboxTickets
    Created on : May 25, 2018, 6:21:19 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style> 

            .panel-heading a:after {
                font-family:'Glyphicons Halflings';
                content:"\e114";
                float: right;
                color: #fff;

            }
            .panel-heading a.collapsed:after {
                content:"\e080";
            }
            panel{

                width:100%;
            }
            table{
                width: 100%;

            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>

        <div class="wrapper ">    
            <%@include  file="AdminSideBar.jsp" %>

            <%-- page Contenct --%>

            <div id="content">
                <div class="panel-group" id="accordion">


                    <div class="panel panel-primary" id="panel2">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-target="#collapseTwo" 
                                   href="#collapseTwo">
                                    Tickets Information
                                </a>
                            </h4>

                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in">
                            <div class="panel-body" id="allTickets">


                            </div>
                        </div>


                    </div>

                </div>
            </div>


        </div>

        <script>
            $(document).ready(function () {

                $.ajax({
                    url: 'AllTicekets',
                    success: function (responseText) {
                        $('#allTickets').html(responseText);
                    }
                });
            });
        </script> 
    </body>
</html>
