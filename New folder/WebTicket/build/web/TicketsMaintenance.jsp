<%-- 
    Document   : TicketsMaintenance
    Created on : May 25, 2018, 6:22:11 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body>

    <%@include file="Header.jsp" %>
    <div class="wrapper">
        <%@include  file="AdminSideBar.jsp" %>

        <div  id="content">
            <div class="panel-group" >
                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 class="panel-title">

                            Ticket Maintenance

                        </h4>
                    </div>

                </div> 
                <div class="panel-body   ">
                    <form name="Maintainenace" action="Maintainenace" method="POST"  lass="form-horizontal" id="myForm">
                        <div class="form-group"> 
                            <label class="control-label col-sm-4" > Status </label>
                            <select  style="width: 50%" class="col-sm-8" id="getTechnical" name="Status"  class="form-control">
                                <option value="none"> </option>
                                <option>Solved Soft</option>
                                <option>Solved Hard</option>
                                <option>Maintenance</option>
                            </select>
                        </div>
                        <br> 
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-4" > Solution </label> 
                            <div class="col-sm-8">
                                <input class="form-control" type="text" name="Solution" placeholder="write your  Solution" /></div>
                        </div>
                        <br> 
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-4" >  Notes </label>
                            <div class="col-sm-8"><input class="form-control" type="text" name="Note" placeholder=" write your Notes" />
                            </div>
                        </div>
                        <br> 
                        <br>

                        <div  class="form-group"> 
                            <div class="col-sm-offset-4 col-sm-8">      
                                <input type="submit" value="Submit" name="submit" class="btn btn-primary" />
                                <input type="reset" value="Cancel" name="cancel" onclick="Formreset()"  class="btn btn-danger"/>
                            </div> 
                        </div>
                        <br> 
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>




        function Formreset() {
            document.getElementById("myForm").reset();
        }
    </script>
</body>
</html>
