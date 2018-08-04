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
        	<script src="assets/js/operations/admin/terminals.js"></script>
	<script src="assets/js/operations/admin/stores.js"></script>
	
            <script>
        $(document).ready(function () {
        	getTerminalById();
           
        });


    </script>

</body>
</html>
