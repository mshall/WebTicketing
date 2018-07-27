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

    <title>Deploy To Merchant</title> 
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
                            <a data-toggle="collapse" data-target="#collapseOne" 
                               href="#collapseOne">
                                Deploy to Merchant 
                            </a>
                        </h4>
                    </div>

                </div> 
                <div id="collapseTwo" class="panel-collapse collapse in">
                    <div class="panel-body   ">
                        <form name="" action="DeploymentControll" method="POST" class="form-horizontal">

                            <div class="form-group " >
                                <label class="control-label col-sm-4" >MID</label>
                                <div class="col-sm-8">
                                    <select class="form-control" name="MerchantID" style="width: 50%" id="Merchants" >

                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" >Terminal-ID</label>
                                <div class="col-sm-8" >
                                    <input type="text" class="form-control" name="TerminalID"  placeholder="Terminal ID" required="" value="<c:out value="${user.getTID()}" />" > 
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4" >SIM 1</label>
                                <div class="col-sm-7">
                                    <select name="sim1" id="sim1" onchange="" >
                                        <option value="none">  Operator </option>
                                        <option value="Vodafone"> <a href="TerminalControll?action=GetSim1&sim1=<c:out value="Vodafone"/>">  vodafone </a> </option>
                                        <option value="Orange"> <a href="TerminalControll?action=GetSim1&sim1=<c:out value="Orange"/>">  Orange</a> </option>
                                        <option value="Etisalat">  <a href="TerminalControll?action=GetSim1&sim1=<c:out value="Etisalat"/>">  Etisalat ></option>
                                            <option value="We"> <a href="TerminalControll?action=GetSim1&sim1=<c:out value="We"/>"> We</a> </option>
                                    </select>
                                    <select >
                                        <option value="0">  Serial </option>
                                        <c:forEach items="${serial}" var="s">
                                            <option value=" <c:out value="${s.get()}" /> ">  <c:out value="${s.get()}" /></option>
                                        </select> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" >SIM 2</label>
                                    <div class="col-sm-7">
                                        <select name="sim2" id="sim2" onchange="this.form.();">
                                            <option value="NULL"> Operator </option>
                                            <option value="V"> vodafone  </option>
                                            <option value="O"> Orange </option>
                                            <option value="E"> Etisalat </option>
                                            <option value="W">We </option>
                                        </select>
                                        <select >
                                            <option value="0">  Serial </option>
                                            <%--
                                            <%  
                                               String  q = "SELECT sim.`SimSerial` from sim where sim.operator=\" "+request.getParameter("sim2") +" \" ";
                                                connect c = new connect(n, pass);
                                                Connection conn = sc.getConn();
                                                PreparedStatement spre = sconn.prepareStatement(q);
    //                                            pre.setString(1, request.getParameter("1"));
                                                ResultSet rss = spre.executeQuery();
                                                while (rss.next()) {
                                            %> 
                                            <option vlaue="<%=rss.getInt(1)%>">  <%=rss.getInt(1) %> </option>
                                            <%
                                                }

                                        %>
                                            --%> 
                                        </select>
                                    </div>
                                </div>

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
            <script>

                $(document).ready(function () {

                    $.ajax({
                        url: 'MerchantforRP',
                        success: function (responseText) {
                            $('#Merchants').html(responseText);
                        }
                    });
                });
                function Formreset() {
                    document.getElementById("myForm").reset();
                }

            </script>
    </body>

</html>
