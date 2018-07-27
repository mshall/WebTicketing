<%-- 
    Document   : addTechnical
    Created on : May 17, 2018, 4:06:06 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

    <title>add Technical</title> 

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
                            Add Technical 

                        </h4>
                    </div>

                </div> 
                <div >
                    <div class="panel-body   ">
                        <form  action="TechnicalControll" method="POST" class="form-horizontal" >
                            <div class="form-group">
                                <label class="control-label col-sm-4" > Technical-ID</label>  
                                <div class="col-sm-8"><input class="form-control" type="text" name="ID"  readonly="" value="<c:out value="${user.getTechId()}"/>"   /></div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4" > Technical-Name </label>  
                                <div class="col-sm-8"><input class="form-control" type="text" name="name" placeholder="Technical Name" required="" value="<c:out value="${user.getTname()}"/>"   /></div>
                            </div><div class="form-group">
                                <label class="control-label col-sm-4" >Contact-Person </label> <div class="col-sm-8"><input  class="form-control" type="text" name="CP" value="" placeholder="Contact Person" /></div>
                            </div> <div class="form-group">
                                <label class="control-label col-sm-4" > Phone 1</label> <div class="col-sm-8"><input class="form-control" type="number" name="Phone1" placeholder="Phone1" required=""  value="<c:out value="${user.getPhone1()}"/>"/> </div>        
                            </div>   <div class="form-group">
                                <label class="control-label col-sm-4" > Phone 2</label> <div class="col-sm-8"><input class="form-control" type="number" name="Phone2" value="" placeholder="Phone2" /></div>  

                            </div>    <div class="form-group">
                                <label class="control-label col-sm-4" > E-mail</label> <div class="col-sm-8"><input class="form-control" type="email" name="email" placeholder="@example.com" required=""  value="<c:out value="${user.getEmail()}"/>"/></div>        
                            </div>  <div class="form-group">
                                <label class="control-label col-sm-4" > Street</label> <div class="col-sm-8"><input class="form-control" type="text" name="Street" value="" placeholder="Street" /></div>        
                            </div>  <div class="form-group">
                                <label class="control-label col-sm-4" > City</label> <div class="col-sm-8"><input class="form-control" type="text" name="City" value="" placeholder="City" /></div>  
                            </div> <div class="form-group">
                                <label class="control-label col-sm-4" > User-Name </label>  <div class="col-sm-8"> <input class="form-control" type="text" name="uname"  placeholder="UserName" required="" value="<c:out value="${user.getUserName()}"/>"/></div>
                            </div> <div class="form-group">
                                <label class="control-label col-sm-4" > password </label>  <div class="col-sm-8"> <input class="form-control" type="password" id="pass1" name="pass1" placeholder="Password" required=""/></div>
                            </div> <div class="form-group">
                                <label class="control-label col-sm-4" > Confirm-Password </label>  <div class="col-sm-8"> <input class="form-control" type="password"  id="pass2" name="pass2" placeholder="Confirm Password" required  onkeyup="checkPass(); return false;"/></div>
                            </div>
                            <span id="confirmMessage" class="confirmMessage"></span>
                            <div class="form-group">
                                <label class="control-label col-sm-4" > Status</label>
                                <div class="col-sm-8">
                                    <select name="Status"   >
                                        <option value="none"> select </option>
                                        <option value="active">Active</option>
                                        <option value="inactive">InActive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4" > Vendor</label>
                                <div class="col-sm-8">
                                    <select name="Vendor"   >
                                        <option value="none"> select </option>
                                   
                                    </select>
                                </div>
                            </div>
                            <div  class="form-group"> 
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

    <script>

        function checkPass()
        {
                //Store the password field objects into variables ...
                var pass1 = document.getElementById("pass1");
                var pass2 = document.getElementById("pass2");
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

        function Formreset() {
            document.getElementById("myForm").reset();
        }
    </script>
</body>
</html>
