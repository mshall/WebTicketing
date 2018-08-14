<%-- 
    Document   : addTechnical
    Created on : May 17, 2018, 4:06:06 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title><fmt:message key="add_technical" /></title> 
</head>
<body>
    <script>
        $(function () {
            $('input[name=dob]').datepicker();
        });
    </script>
    <%@include file="Header.jsp" %>
    <div class="wrapper">
        <%@include  file="AdminSideBar.jsp" %>
        <div  id="content">
            <div class="panel-group" >

                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                           <fmt:message key="add_technical" />  

                        </h4>
                    </div>

                </div> 
                <div >
                    <div class="panel-body   ">
                        <form  action="TechnicalControll" method="POST" class="form-horizontal" >
                            <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="technical_id" /> </label>  
                                <div class="col-sm-8"><input class="form-control" type="text" id="userId" readonly=""/></div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="technical_name" />  </label>  
                                <div class="col-sm-8"><input class="form-control" type="text" id="name" placeholder="Technical Name" required="true" /></div>
                            </div>
                             <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="phone1" /> </label> <div class="col-sm-8"><input class="form-control" type="number" id="phone1" placeholder="Phone1"/> </div>        
                            </div>   <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="phone2" /> </label> <div class="col-sm-8"><input class="form-control" type="number" id="phone2" value="" placeholder="Phone2" /></div>  

                            </div>    <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="email" /> </label> <div class="col-sm-8"><input class="form-control" type="email" id="email" placeholder="@example.com"/></div>        
                            </div> 
                            <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="city" /> </label> <div class="col-sm-8"><input class="form-control" type="text" id="city" value="" placeholder="City" /></div>  
                            </div> <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="user_name" />  </label>  <div class="col-sm-8"> <input class="form-control" type="text" id="username"  placeholder="UserName"/></div>
                            </div> <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="password" />  </label>  <div class="col-sm-8"> <input class="form-control" type="password" id="password" placeholder="Password"/></div>
                            </div> <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="confirm_password" />  </label>  <div class="col-sm-8"> <input class="form-control" type="password"  id="password2" placeholder="Confirm Password"  onkeyup="checkPass(); return false;"/></div>
                            </div>
                            <span id="confirmMessage" class="confirmMessage"></span>
                            <div class="form-group">
                                <label class="control-label col-sm-4" ><fmt:message key="status" /> </label>
                                <div class="col-sm-8">
                                    <select id="status">
                                        <option value="active">Active</option>
                                        <option value="inactive">InActive</option>
                                    </select>
                                </div>
                            </div>
                            <div  class="form-group"> 
                                <div class="col-sm-offset-4 col-sm-8">      
                                    <input type="button" value="<fmt:message key="submit" />" id="submit" class="btn btn-primary" onclick="updateTechnician()"/>
                                    <input type="button" value="<fmt:message key="cancel" />" id="cancel" onclick="Formreset()"  class="btn btn-danger"/>
                                </div> 
                            </div>

                        </form>

                    </div>
                </div>

            </div>  
        </div> 
    </div> 

<script src="assets/js/operations/util.js"></script>
	<script src="assets/js/operations/admin/technician.js"></script>
    <script>

        function checkPass()
        {
                //Store the password field objects into variables ...
                var pass1 = document.getElementById("password");
                var pass2 = document.getElementById("password2");
                //Store the Confimation Message Object ...
                var message = document.getElementById("confirmMessage");
                //Set the colors we will be using ...
                var goodColor = "#66cc66";
                var badColor = "#ff6666";
                //Compare the values in the password field 
                //and the confirmation field
                if (pass1.value === pass2.value) {
                        //The passwords match. 
                        //Set the color to the good color and inform
                        //the user that they have entered the correct password 
                        pass2.style.backgroundColor = goodColor;
                        message.style.color = goodColor;
                        message.innerHTML = "Passwords Match!";
                } else {
                        //The passwords do not match.
                        //Set the color to the bad color and
                        //notify the user.
                        pass2.style.backgroundColor = badColor;
                        message.style.color = badColor;
                        message.innerHTML = "Passwords Do Not Match!";
                }
        }  

        $(document).ready(function() {
			var technicianId = getURLParameter('technicianId');
			if(technicianId!=null){
				getTechnicianById(technicianId);	
			}
		});
        
        function save(){
        	var technicianId = getURLParameter('technicianId');
			if(technicianId!=null){
				updateTechnician();	
			}else{
				addTechnician();
			}
        }
        
        function Formreset() {
        	window.location.replace("Technical.jsp");
        }
    </script>
</body>
</html>
