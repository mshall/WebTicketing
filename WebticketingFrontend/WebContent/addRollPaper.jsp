<%-- 
    Document   : addTechnical
    Created on : May 17, 2018, 4:06:06 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
    <head>
    <title><fmt:message key="roll_paper" />  </title> 
</head>
<body>
    
    <div class="wrapper">
        <%@include  file="AdminSideBar.jsp" %>
        <div  id="content">
        <jsp:include page="AlertMessage.jsp"></jsp:include>
            <div class="panel-group" >

                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 id="pageTitle" class="panel-title">
                        </h4>
                    </div>

                </div> 
                <div >
                    <div class="panel-body   ">
                        <form  action="" method="" class="form-horizontal" >
                            <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="rollpaper_id" /> </label>  
                                <div class="col-sm-8"><input class="form-control" type="text" id="rollpaperId" readonly=""/></div>
                            </div>
                            
                            <div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="rollpaper_size" /></label>
									<div class="col-sm-8">
										<select id="rollpaperSize">
											<option value="">select...</option>
											<option value="Small">Small</option>
											<option value="Medium">Medium</option>
											<option value="Large">Large</option>
										</select>
									</div>
								</div>
                            
                            <div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="store" /></label>
									<div class="col-sm-8" id="storesList"></div>
								</div>
								
                             <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="total_in" /> </label> <div class="col-sm-8"><input class="form-control" type="number" id="totalIn" placeholder="Total In" onkeyup="changeRemaining();"/> </div>        
                            </div> 
                             <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="out" /> </label> <div class="col-sm-8"><input class="form-control" type="number" id="out" placeholder="out" onkeyup="changeRemaining();"/></div>  
                            </div>   
                            <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="remaining" /> </label> <div class="col-sm-8"><input class="form-control" type="number" id="remaining" placeholder="remaining" /></div>  
                            </div> 
                            <div  class="form-group"> 
                                <div class="col-sm-offset-4 col-sm-8">      
                                    <input type="button" value="<fmt:message key="submit" />" id="submit" class="btn btn-primary" onclick="save()"/>
                                    <input type="button" value="<fmt:message key="cancel" />" id="cancel" onclick="Formreset()"  class="btn btn-danger"/>
                                </div> 
                            </div>

                        </form>

                    </div>
                </div>

            </div>  
        </div> 
    </div> 

    <script src="assets/js/operations/admin/roll.js"></script>
	<script src="assets/js/operations/admin/stores.js"></script>
    <script>
    $(document).ready(function() {
    	getStoresDropdown();
    	var rollpaperId = getURLParameter('rollpaperId');
		console.log("rollpaperId:"+rollpaperId);
		if(rollpaperId!=null){
			console.log("Edit Rollpaper");
			$('#pageTitle').html('<fmt:message key="roll_paper" />');
			getROllById(rollpaperId);	
		}else{
			$('#pageTitle').html('<fmt:message key="roll_paper" />');
		}
	});        
        function save(){
        	var rollpaperId = getURLParameter('rollpaperId');
			if(rollpaperId!=null){
				updateRoll();	
			}else{
				addRoll();
			}
        }
        
        function changeRemaining(){
        	$("#remaining").val($("#totalIn").val()-$("#out").val());	
        }
        
        function Formreset() {
        	window.location.replace("Technical.jsp");
        }
    </script>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
