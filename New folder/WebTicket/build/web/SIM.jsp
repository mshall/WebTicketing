
<%@page import="java.sql.*"%>
<%@page import="Services.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>

    <head>
        <script src="BootStrap/js/app-ajax.js" type="text/javascript"></script>
    <a href="BootStrap/fonts/glyphicons-halflings-regular.svg"></a>
    <script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script>
    <link href="BootStrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
    <link href="BootStrap/css/mstyle.css" rel="stylesheet" type="text/css"/>
    <script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script>
    <script src="BootStrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="BootStrap/js/npm.js" type="text/javascript"></script>
    <script src="BootStrap/js/bootstrap.js" type="text/javascript"></script>


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
                                All  SIM
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body" >


                            <div> 
                                <input type="text" name="ID" value="" placeholder="Sim serial " class="input-sm"/>

                                <a href="SimControll?action=search&search=<c:out value="ID"/>">   <button type="submit" class="btn bg-primary"><span class="glyphicon glyphicon-search"></span> Search</button></a>  

                                <a href="SimControll?action=insert"> <button class="btn btn-default"> <span class="glyphicon glyphicon-plus"></span>  SIM </button></a>
                            </div>

                                <br> <br>   

                                <div id ="SIMs" style="align-content: center">

                                <div class="table responsive " >
                                    <table border=1> 
                                        <thead>
                                            <tr><th> Sim-id</th>
                                                <th> Serial</th>
                                                <th> operator</th>
                                                <th> status</th>
                                                <th> Action </th>

                                            </tr>
                                        </thead>


                                        <tbody>
                                            <c:forEach items="${users}" var="user">
                                                <tr><td><c:out value="${user.getSid()}" /></td>
                                                    <td><c:out value="${user.getSerial()}" /></td>
                                                    <td><c:out value="${user.getOp()}" /></td>
                                                    <td><c:out value="${user.getStatus() }" /></td>

                                                    <td><a href="SimControll?action=Store&SID=<c:out value="${user.getSerial()}"/>"> Store</a></td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>








                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </div>













  





</body>


</html>

