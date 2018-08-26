<%-- 
    Document   : MerchantRP
    Created on : May 25, 2018, 7:08:04 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
    <title><fmt:message key="roll_paper_to_merchant" /></title> 
    <style>

    </style>
</head>
<body>
    <div class="wrapper">
        <%@include  file="AdminSideBar.jsp" %>
        <div  id="content">
        <div class="alert alert-success" id="successUpdate">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Sucess!
				</strong>updated successfully
			</div>
			<div class="alert alert-danger" id="errorUpdate">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Warning!
				</strong> Couldn't update
			</div>
            <div class="panel-group" id="accordion">
                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                           <fmt:message key="total_in_roll_paper" /> 
                        </h4>
                    </div>
                </div> 
                <div >
                    <div class="panel-body   ">
                        <div id ="allRollPapers">
                        </div>
                    </div>
                </div> 
            </div>

            <br><br><br>
            <div class="panel-group" >
                <div class="panel panel-primary" >
                    <div class="panel-heading">
                        <h4 class="panel-title">
                           <fmt:message key="assign_to_merchant" />
                        </h4>
                    </div>
                </div> 
                <div >
                    <div class="panel-body   ">
                        <div >
                            <form name="assign" action="AssignRPtoMerchant" method="POST" class="form-horizontal">
                                <div class="form-group">
                                    <label class="control-label col-sm-4"><fmt:message key="merchant_name" /></label>
                                    <div class="col-sm-8" id="merchantList"></div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="control-label col-sm-4"><fmt:message key="total_in" /> </label> 
                                    <div class="col-sm-8"> 
                                        <input type="text" name="TotalIn" value="" size="50%" />
                                    </div> </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4"><fmt:message key="meet_sla" /></label> 
                                    <div class="col-sm-8">  
                                        <input type="text" name="SLA" value="" size="50%" />
                                    </div> </div>


                                <div class="form-group ">
                                    <div class="col-sm-offset-4 col-sm-8">      
                                        <input type="button" value="<fmt:message key="submit" />" class="btn btn-primary" onclick="save()" />
                                        <input type="button" value="<fmt:message key="cancel" />" name="cancel" onclick="Formreset()"  class="btn btn-danger"/>
                                    </div> 
                                </div>

                            </form>
                        </div>
                    </div>
                </div> 
            </div>

        </div> 
    </div>
    <script src="assets/js/operations/admin/roll.js"></script>
    <script src="assets/js/operations/admin/merchants.js"></script>
    <script src="assets/js/operations/admin/merchant-roll.js"></script>
    <script>
        function Formreset() {
            document.getElementById("myForm").reset();
        }
        $(document).ready(function () {
        //	$("#successUpdate").hide();
		//	$("#errorUpdate").hide();
        	getAllRollPapers();
        	getMerchantsDropdown();
        	
        });
        
        function save(){
        	$('input[type=checkbox]').each(function () {
        	    if(this.checked){
        	    	console.log ($(this).val());
        	    	saveMerchantRoll($(this).val());
        	    }
        	});
        	getAllRollPapers();
        }


    </script>
<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>
