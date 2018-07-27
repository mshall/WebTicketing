<%-- 
    Document   : newjsp
    Created on : May 17, 2018, 3:25:19 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

    <title>add Merchant</title> 
    <style>

    </style>
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
            <div class="panel-group" id="accordion">

                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-target="#collapseOne" 
                               href="#collapseOne">
                                Add Merchant 
                            </a>
                        </h4>
                    </div>

                </div> 
                <div id="collapseTwo" class="panel-collapse collapse in">
                    <div class="panel-body   ">
                        <form action="MerchantControll" method="POST" class="form-horizontal" >
                            <div class="form-group " >
                                <label class="control-label col-sm-4" >MID</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" name="ID"  readonly=""  value="<c:out value="${user.getMid()}" />" >
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" >Merchant Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="mName"  placeholder="Merchant Name" required="" value="<c:out value="${user.getmName()}"/>" >
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" >Contact Person</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="CP" placeholder="Contact Person" value="<c:out value="${user.getMcp()}" />">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" >Phone 1</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="p1" placeholder="Phone 1" required value="<c:out value="${user.getPhone1()}"/>" >
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" >Phone 2</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="p2" placeholder="Phone 2" value="<c:out value="${user.getPhone2()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" >Email</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" name="email" placeholder="@example.com" value="<c:out value="${user.getMemail()}" />" >
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" >City</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="City" placeholder="City"value="<c:out value="${user.getCity()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" >Street</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="st" placeholder="Street" value="<c:out value="${user.getStreet()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" >AMes Merchant ID </label>
                                <div class="col-sm-8">
                                    <input type="number " class="form-control" name="Ames"  placeholder="AMes Merchant ID " value="<c:out value="${user.getAID()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" >Premium ID</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="pid" placeholder="Premium ID" value="<c:out value="${user.getPID()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" >MCC</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="mcc"  placeholder="MCC" value="<c:out value="${user.getMCC()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" >Class</label>
                                <div class="col-sm-8">
                                    <select name="Class">
                                        <option value="none"></option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" >Currency</label>
                                <div class="col-sm-8">
                                    <select name="Currency">
                                        <option value="none"> </option>
                                        <option value="EUR">EUR</option>
                              
                                    </select>
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" >Status</label>
                                <div class="col-sm-8">
                                    <select name="Status">
                                        <option value="none">   </option>
                                        <option value="active">Active</option>
                                        <option value="inactive">In Active</option>

                                    </select>
                                </div>
                            </div><div class="form-group ">
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


        function Formreset() {
            document.getElementById("myForm").reset();
        }

    </script>
</body>

</html>
