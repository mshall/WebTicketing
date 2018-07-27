<%-- 
    Document   : DeployToMerchant
    Created on : May 27, 2018, 10:24:35 PM
    Author     : shimaa
--%>
<%@page import="java.sql.*"%>
<%@page import="Services.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

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
    <title>add Terminal</title>
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
                                Add Terminal
                            </a>
                        </h4>
                    </div>


                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body   ">
                            <form  action="TerminalControll" method="POST" class="form-horizontal" >

                                <div class="form-group ">
                                    <label class="control-label col-sm-4" >Terminal ID </label>
                                    <div class="col-sm-8">
                                        <input type="number" class="form-control" name="TID"  placeholder="Terminal ID " readonly="readonly" value="<c:out value="${user.getTerminaL_id()}" />" >
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="control-label col-sm-4" >Model </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="Model"  placeholder="Terminal Model " value="<c:out value="${user.getModel()}" />" >
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="control-label col-sm-4" >Serial Number </label>
                                    <div class="col-sm-8">
                                        <input type="number" class="form-control" name="Serial"  placeholder="Serial Number " value="<c:out value="${user.getSerialNumber()}" />" >
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="control-label col-sm-4" > Condition </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="cond"  placeholder="Condition" value="<c:out value="${user.getCondition()}" />" >
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="control-label col-sm-4" >Class</label>
                                    <div class="col-sm-8">
                                        <select name="Class" >
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
                                            <option value="none"></option>
                                            <option value="EUR">EUR</option>
                                            <option value="ss">dsd</option>
                                            <option value="pp">sd</option>
                                            <option value="sss">sds</option>
                                        </select>
                                    </div>
                                </div><div class="form-group ">
                                    <label class="control-label col-sm-4" >Status</label>
                                    <div class="col-sm-8">
                                        <select name="Status">
                                            <option value="none"> </option>
                                            <option value="Active">Active</option>
                                            <option value="In Active">In Active</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="control-label col-sm-4" >MCC</label>
                                    <div class="col-sm-8">
                                        <input type="number" class="form-control" name="mcc"  placeholder="MCC" value="<c:out value="${user.getMCC()}" />" >
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="control-label col-sm-4" >Terminal Feature</label>
                                </div> 
                                <div class="form-group ">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <table class="table responsive " >
                                            <tr>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f1" value="true" /> <label> Sale </label>
                                                </td>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f2" value="true" /> <label> OnLine Returned </label>
                                                </td></tr>

                                            <tr>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f3" value="true" />   <label> OffLine Returned </label>
                                                </td>


                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f4" value="true" />  <label> OffLine Sale </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f5" value="true" /><label> OnLine Void </label>
                                                </td>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox"  name="Feature" id="f6" value="true" /> <label>  OffLine Void  </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f7" value="true" />  <label> Preauth </label>
                                                </td>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f8" value="true" /><label> Amex </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f9" value="true" />  <label> Instatiment </label>
                                                </td>

                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f10" value="true" />  <label> Prepaid Services </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f11" value="true"  />    <label> Diners </label>
                                                </td>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f12" value="true" />   <label> Premuim </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td clas="col-sm-4" >
                                                    <input type="checkbox" name="Feature" id="f13" clas="col-sm-1" value="true"  /> <label clas="col-sm-3"> Manual Entry </label>
                                                </td>

                                            </tr>

                                        </table>


                                    </div>



                                </div>


                                <div class="form-group ">
                                    <div class="col-sm-offset-4 col-sm-8">      
                                        <input type="submit" value="submit" id="submit" class="btn btn-primary" />
                                        <input type="reset" value="cancel" name="cancel" onclick="Formreset()"  class="btn btn-danger"/>
                                    </div> 
                                </div>


                            </form>
                        </div>

                    </div>     

                </div>
            </div>
        </div>
    </div>

    <script>


        $(document).ready(function () {
            $("#submit").click(function () {
                var selectedFreature = new Array();
                $('input[name="Feature"]:checked').each(function () {
                    selectedFreature.push(this.value);
                });

            });
        });

        function Formreset() {
            document.getElementById("myForm").reset();
        }

    </script>
</body>

</html>
