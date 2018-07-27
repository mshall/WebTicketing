<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="BootStrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="BootStrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="BootStrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="BootStrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script>
        <link href="BootStrap/css/mstyle.css" rel="stylesheet" type="text/css"/>
        <script src="BootStrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="BootStrap/js/npm.js" type="text/javascript"></script>
        <script src="BootStrap/js/bootstrap.js" type="text/javascript"></script>

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
                    url: 'TechTicekets',
                    success: function (responseText) {
                        $('#allTickets').html(responseText);
                    }
                });
            });
        </script>





    </body>
</html>
