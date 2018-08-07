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
                                    <div class="col-sm-8"  size="50%">
                                        <select name="Mname" id="Merchants">

                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-4">Size </label> 
                                    <div class="col-sm-8" size="50%">  <select name="Size">
                                            <option value="none"> select roll paper</option>
                                            <option vlaue="large"> Large</option>
                                            <option vlaue="medium"> Medium</option>
                                            <option vlaue="small"> Small</option>
                                        </select> 

                                    </div> </div>


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
                                        <input type="submit" value="Submit" name="submit" class="btn btn-primary" />
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
    <script>
        function Formreset() {
            document.getElementById("myForm").reset();
        }
        $(document).ready(function () {
        	getAllRollPapers();
        });


    </script>
</body>
</html>
