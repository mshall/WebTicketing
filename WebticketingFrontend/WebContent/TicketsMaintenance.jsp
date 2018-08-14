<%-- 
    Document   : TicketsMaintenance
    Created on : May 25, 2018, 6:22:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title><fmt:message key="tickets_maintenance" /></title>
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
						<fmt:message key="tickets_maintenance" />
                          
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
                            <label class="control-label col-sm-4" ><fmt:message key="status" /> </label>
                            <select  style="width: 50%" class="col-sm-8" id="status" name="status"  class="form-control">
                                <option value="0">Select... </option>
                                <option value="1">Solved Soft</option>
                                <option value="2">Solved Hard</option>
                                <option value="3">Maintenance</option>
                            </select>
                        </div>
                        <br> 
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-4" ><fmt:message key="solution" /> </label> 
                            <div class="col-sm-8">
                                <input class="form-control" type="text" id="solution" name="solution" placeholder="write your  Solution" /></div>
                        </div>
                        <br> 
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-4" ><fmt:message key="notes" /> </label>
                            <div class="col-sm-8"><input class="form-control" type="text" id="note" name="note" placeholder=" write your Notes" />
                            </div>
                        </div>
                        <br> 
                        <br>

                        <div  class="form-group"> 
                            <div class="col-sm-offset-4 col-sm-8">      
                                <input type="button" value="<fmt:message key="submit" />" name="submit" class="btn btn-primary" />
                                <input type="button" value="<fmt:message key="cancel" />" name="cancel" onclick="Formreset()"  class="btn btn-danger"/>
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
