<%-- 
    Document   : Technical
    Created on : May 24, 2018, 2:05:57 AM
    Author     : shimaa
--%>

<%@page import="java.sql.*"%>
<%@page import="Services.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technical</title>
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
    <link href="MyCss.css" rel="stylesheet" type="text/css"/>

</head>
<body >

    <%@include file="Header.jsp" %>

    <div class="wrapper">
        <%@include  file="AdminSideBar.jsp" %>

        <div  id="content">
            <div class="panel-group" id="accordion">
                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            All  Technical 
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body" >

                            <div> 
                                <input type="text" name="search" value="" placeholder="Enter Technical Name" class="input-sm"/>

                                <a href="TechnicalControll?action=search&TechId=search">  <button type="submit" class="btn bg-primary">  <span class="glyphicon glyphicon-search"></span> Search</button></a>  

                                <a href="TechnicalControll?action=insert"> <button class="btn btn-default"> <span class="glyphicon glyphicon-plus"></span>  Technical </button></a>
                            </div>

                            <br><br>
                            <div id ="technical">
                                <div class="table responsive " >
                                    <table border=1> 
                                        <thead>
                                            <tr><th> Technical-ID </th>
                                                <th> Technical-Name </th>
                                                <th> Email </th>
                                                <th> Phone 1 </th>
                                                <th> Status </th>
                                                <th colspan="2"> Action </th>
                                            
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${users}" var="user">
                                                <tr>
                                                    <td><c:out value="${user.getTechId()}" /></td>
                                                    <td><c:out value="${user.getTname()}" /></td>
                                                    <td><c:out value="${user.getEmail()}" /></td>
                                                    <td><c:out value="${user.getPhone1()}" /></td>
                                                    <td><c:out value="${user.getStatus()}" /></td>
                                                    <td><a href="TechnicalControll?action=edit&TechId=<c:out value="${user.getTechId()}"/>">  Update</a></td>
                                                    <td><a href="TechnicalControll?action=delete&TechId=<c:out value="${user.getTechId()}"/>"> Delete</a></td>
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

    <%--        <script>
        $(document).ready(function () {

                                                                $.ajax({
                                                                    url: 'AllTechnical',
                                                                    success: function (responseText) {
                                                                        $('#technical').html(responseText);
                                                                    }
                                                                });
                                                            });


                                                        </script>
    --%>

</body>
</html>
