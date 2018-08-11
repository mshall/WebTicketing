<%-- 
    Document   : TicketsMaintenance
    Created on : May 25, 2018, 6:22:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="BootStrap/js/glm-ajax.js" type="text/javascript"></script>
    <a href="BootStrap/fonts/glyphicons-halflings-regular.svg"></a>
    <link href="BootStrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
    
    <link href="BootStrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/mstyle.css" rel="stylesheet" type="text/css"/>
    
    <script src="BootStrap/js/npm.js" type="text/javascript"></script>
    <script src="BootStrap/js/bootstrap.js" type="text/javascript"></script>
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
                <div>
							<p id="form-message" style="font-size: 1.2em;">
							</p>
						</div>
                    <form name="Maintainenace" action="Maintainenace" method="POST"  lass="form-horizontal" id="myForm">
                        <div class="form-group"> 
                            <label class="control-label col-sm-4" > Status </label>
                            <select  style="width: 50%" class="col-sm-8" id="status" name="status"  class="form-control">
                                <option value="0"> </option>
                                <option value="1">Solved Soft</option>
                                <option value="2">Solved Hard</option>
                                <option value="3">Maintenance</option>
                            </select>
                        </div>
                        <br> 
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-4" > Solution </label> 
                            <div class="col-sm-8">
                                <input class="form-control" type="text" id="solution" name="solution" placeholder="write your  Solution" /></div>
                        </div>
                        <br> 
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-4" >  Notes </label>
                            <div class="col-sm-8"><input class="form-control" type="text" id="note" name="note" placeholder=" write your Notes" />
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
