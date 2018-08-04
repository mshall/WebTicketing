<%-- 
    Document   : Deployment
    Created on : May 25, 2018, 7:03:48 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>

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
            <div class="panel-group" id="accordion" >
                <div class="panel panel-primary" id="panel1" >
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Deployment Terminals
                        </h4>
                    </div>

                    <div class="panel-body" >
                        <div>
                            <input type="text" name="TID" value="" placeholder="Enter Terminal ID " class="input-sm"/>


                        </div>
                        <br> <br> <br> 
                        <div id="allTerminals"></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script src="assets/js/operations/admin/terminals.js"></script>
		<script>
			$(document).ready(function() {
				getTerminalsByStatus('deployed');
			});
		</script>

</body>
</html>
