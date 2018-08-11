<%-- 
    Document   : MerchantRP
    Created on : May 25, 2018, 7:08:04 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Roll Paper To Merchant</title> 
    <style>

    </style>
</head>
<body>
    <%@include file="Header.jsp" %>
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
                            Total In Roll Papers 
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
                            Assign To Merchant 
                        </h4>
                    </div>
                </div> 
                <div >
                    <div class="panel-body   ">
                        <div >
                            <form name="assign" action="AssignRPtoMerchant" method="POST" class="form-horizontal">
                                <div class="form-group">
                                    <label class="control-label col-sm-4"> Merchant Name </label>
                                    <div class="col-sm-8" id="merchantList"></div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="control-label col-sm-4">Total In  </label> 
                                    <div class="col-sm-8"> 
                                        <input type="text" name="TotalIn" value="" size="50%" />
                                    </div> </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4">Meet SLA  </label> 
                                    <div class="col-sm-8">  
                                        <input type="text" name="SLA" value="" size="50%" />
                                    </div> </div>


                                <div class="form-group ">
                                    <div class="col-sm-offset-4 col-sm-8">      
                                        <input type="button" value="Submit" class="btn btn-primary" onclick="save()" />
                                        <input type="reset" value="Cancel" name="cancel" onclick="Formreset()"  class="btn btn-danger"/>
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
        	$("#successUpdate").hide();
			$("#errorUpdate").hide();
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
</body>
</html>
