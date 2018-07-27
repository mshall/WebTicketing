<%-- 
    Document   : addstore
    Created on : May 17, 2018, 4:05:50 AM
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

    <title>add Store</title> 

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
                            Add Store 

                        </h4>
                    </div>

                </div> 

                <div class="panel-body   ">
                    <form  action="StoreControll" method="POST" class="form-horizontal" >
                        <div class="form-group ">
                            <label class="control-label col-sm-4" > Store ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="SID" placeholder="Store ID" value="<c:out value="${user.getStore_id()}" />" >
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-sm-4" > Store Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="Sname" placeholder="Store Name" required="" value="<c:out value="${user.getName()}"/>" >
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-sm-4" >Contact Person</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="CP" placeholder="Contact Person" value="<c:out value="${user.getCP()}"/>"   >
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-sm-4" > Phone 1</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="p1" placeholder="Phone 1" required value="<c:out value="${user.getP1()}"/>"   >
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-sm-4" >Phone 2</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="p2" placeholder="Phone 2" value="<c:out value="${user.getP2()}"/>"   >
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-sm-4" >street</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="st" placeholder=" street" value="<c:out value="${user.getStreet()}"/>"   >
                                       </div>
                                       </div>
                                       <div class="form-group ">
                                       <label class="control-label col-sm-4" >City</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="ct" placeholder=" City" value="<c:out value="${user.getCity()}"/>"   >
                                </div>
                            </div>



                            <div class="form-group ">
                                <label class="control-label col-sm-4" > Status</label>
                                <div class="col-sm-8">
                                    <select name="Status" style="width: 50%">
                                        <option value="none"></option>
                                        <option value="active">Active</option>
                                        <option value="inactive">In Active</option>

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
    function Formreset() {
        document.getElementById("myForm").reset();
    }
</script>
</body>
</html>
