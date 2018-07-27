<%-- 
    Document   : TerminalUpdate
    Created on : May 25, 2018, 7:03:36 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Deployed Terminals </title>
        <script src="BootStrap/js/glm-ajax.js" type="text/javascript"></script>
    <a href="BootStrap/fonts/glyphicons-halflings-regular.svg"></a>
    <link href="BootStrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/mstyle.css" rel="stylesheet" type="text/css"/>
    <script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script>
    <script src="BootStrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="BootStrap/js/npm.js" type="text/javascript"></script>
    <script src="BootStrap/js/bootstrap.js" type="text/javascript"></script>

    <link href="BootStrap/MyCss.css" rel="stylesheet" type="text/css"/>



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
                            All Deployed Terminals
                        </h4>
                    </div>

                    <div class="panel-body">
                        <div class="col-sm-8" > 
                            <div id="deploy">
                                
                           
                            </div>
                        </div>
                
                    </div>
                </div>
            </div>
        </div>
    </div>
        
            <script>
        $(document).ready(function () {

            $.ajax({
                url: 'TerminalDeployed',
                success: function (responseText) {
                    $('#deploy').html(responseText);
                }
            });
        });


    </script>

</body>
</html>
