<%-- 
    Document   : addSIM
    Created on : May 24, 2018, 6:25:24 PM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
        <title>Add SIM</title>
    </head>
    <body>
     
        <%@include file="Header.jsp" %>
        <div class="wrapper">
            <%@include file="AdminSideBar.jsp" %>
            <div id="content">

                <div class="panel-group" id="accordion">

                    <div class="panel panel-primary" id="panel1">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-target="#collapseOne" 
                                   href="#collapseOne">
                                    Add Sim
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body" >
                                <form action="SimControll" method="POST" class="form-horizontal" >
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" > Serial Number</label>  
                                        <div class="col-sm-8"><input class="form-control" type="text" name="serial" placeholder="Serial" required=""  /></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" >Operator </label> 
                                        <div class="col-sm-8">
                                            <select name="operator" >
                                                <option value="none"> select operator </option>
                                                <option value="V" > vodafone  </option>
                                                <option value="O">orange </option>
                                                <option value="E">Etisalat </option>
                                                <option value="W">We </option>

                                            </select>
                                        </div></div>
                                    <div class="form-group ">
                                        <label class="control-label col-sm-4" >Status</label>
                                        <div class="col-sm-8">
                                            <select name="Status">
                                                <option value="none"> </option>
                                                <option value="Active">Active</option>
                                                <option value="InActive">In Active</option>

                                            </select>
                                        </div></div>

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

        <script>


            function Formreset() {
                document.getElementById("myForm").reset();
            }

        </script>
    </body>
</html>
