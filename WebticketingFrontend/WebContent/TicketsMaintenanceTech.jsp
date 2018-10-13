<%-- 
    Document   : TicketsMaintenance
    Created on : May 25, 2018, 6:22:11 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <jsp:include page="AlertMessage.jsp"></jsp:include>
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
								<label class="control-label col-sm-2"><fmt:message
										key="ticket_id" />: </label> <input class="col-sm-4" type="text"
									id="complaintId" readonly="readonly" disabled="disabled"/>
							</div>
							  <br> 
                        <br>  
					<div class="row">
						<label class="control-label col-sm-2" ><fmt:message key="status" />: </label>
						 <select id="status" name="status"  class="col-sm-4" style="border-radius: .5rem">
                               <option value="">Select...</option>
									<option value="open">Open</option>
									<option value="close">Closed</option>
                            </select>
					</div>
                        <br> 
                        <br>
                        <div class="row">
                            <label class="control-label col-sm-2" ><fmt:message key="solution" />: </label> 
                           
                                <input class="col-sm-4" type="text" id="solution" name="solution" placeholder="write your  Solution" />
                        </div>
                        <br> 
                        <br>
                        <div class="row">
                            <label class="control-label col-sm-2" ><fmt:message key="notes" /> </label>
                            <input class="col-sm-4" type="text" id="note" name="note" placeholder=" write your Notes" />
                           
                        </div>
                        <br> 
                        <br>
</div>
                        <div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<input type="button" value="<fmt:message key="submit" />"
									name="submit" class="btn btn-primary" onclick="updateComplaint()" /> 
									<input type="button"
									value="<fmt:message key="cancel" />" name="cancel"
									onclick="window.location.replace('TechnicalTickets.jsp');" class="btn btn-danger" />
							</div>
						</div>
                        <br> 
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </div>

<script src="assets/js/operations/admin/tickets.js"></script>
    <script>
    
    $(document).ready(function() {
    	u=$.session.get('userType');
    	var complaintId = getURLParameter('complaintId');
		console.log("complaintId:"+complaintId);
		if(complaintId!=null){
			console.log("getTicketById");
			getTicketById(complaintId);	
		}
    	//alert(u);
    });
    function Formreset() {
            document.getElementById("myForm").reset();
        }
    </script>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
