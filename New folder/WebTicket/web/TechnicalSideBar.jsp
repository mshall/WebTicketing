<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    <a href="BootStrap/fonts/glyphicons-halflings-regular.svg"></a>
    <script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script>
    <link href="BootStrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/mstyle.css" rel="stylesheet" type="text/css"/>
    <script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script>
    <script src="BootStrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="BootStrap/js/npm.js" type="text/javascript"></script>
    <script src="BootStrap/js/bootstrap.js" type="text/javascript"></script>
</head>
<body>
    
   
            <nav id="sidebar">
                <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn  " >
                    <i class="glyphicon glyphicon-align-right"></i>
                    <span></span>
                </button>

                <ul class="list-unstyled components">
                    <li class="active">
                        <a href="TechnicalHome.jsp"  >
                            <i class="glyphicon glyphicon-home"></i>
                            Home
                        </a></li>

                    
                    <li>
                        <a href="#Terminal" data-toggle="collapse" aria-expanded="false">
                            <i class="glyphicon glyphicon-phone"></i>
                            Tickets
                        </a>
                        <ul class="collapse list-unstyled" id="Terminal">
                            <li><a href="TechnicalTickets.jsp">Tickets History</a></li>
                            <li><a href="MaintainedTickets.jsp">Tickets Maintenance</a></li>
                           
                        </ul>
                    </li>
                  
                                      
                    <li>
                        <a href="">
                            <i class="glyphicon glyphicon-log-out"></i>
                            Log Out
                        </a>
                    </li>
                </ul>


            </nav>



<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>

</body>
</html>
