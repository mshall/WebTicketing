<%-- 
    Document   : TicketsMaintenance
    Created on : May 25, 2018, 6:22:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
    <head>
    <title><fmt:message key="tickets_maintenance" /></title>
</head>
<body>
 <div class="wrapper">
        <%@include  file="TechnicalSideBar.jsp" %>

        <div  id="content">
            <div class="panel-group" >
                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 class="panel-title">
						<fmt:message key="tickets_maintenance" />
                          
                        </h4>
                    </div>

                </div>
                <div>
							<p id="form-message" style="font-size: 1.2em;">
							</p>
						</div>
                     
                <div class="panel-body">
                <form name="Maintainenace" action="Maintainenace" method="POST"  lass="form-horizontal" id="myForm">
                <div class="panel-body">    
					<div class="row">
						<label class="control-label col-sm-4" ><fmt:message key="status" />: </label>
						 <select  style="width: 50%" id="status" name="status"  class="col-sm-4" style="border-radius: .5rem">
                                <option value="0">Select... </option>
                                <option value="1">Solved Soft</option>
                                <option value="2">Solved Hard</option>
                                <option value="3">Maintenance</option>
                            </select>
					</div>
                        <br> 
                        <br>
                        <div class="row">
                            <label class="control-label col-sm-4" ><fmt:message key="solution" />: </label> 
                            <div class="col-sm-8">
                                <input class="col-sm-4" type="text" id="solution" name="solution" placeholder="write your  Solution" /></div>
                        </div>
                        <br> 
                        <br>
                        <div class="row">
                            <label class="control-label col-sm-4" ><fmt:message key="notes" /> </label>
                            <div class="col-sm-4"><input class="form-control" type="text" id="note" name="note" placeholder=" write your Notes" />
                            </div>
                        </div>
                        <br> 
                        <br>
</div>
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
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
