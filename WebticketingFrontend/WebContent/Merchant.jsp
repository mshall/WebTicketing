<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : shimaa
--%>

<%@page import="java.sql.*"%>
<%@page import="Services.connect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

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
    <style>

        td,th{
            size:10px;

        }
        table {

            size: 100px;
        }



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
                                All Merchants
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body" >
                            <div>
                                <div> 
                                    <input type="text" name="search" value="" placeholder="Enter Merchant Name " class="input-sm"/>

                                    <a href="MerchantControll?action=search"><button type="submit" class="btn bg-primary"><span class="glyphicon glyphicon-search"></span> Search</button></a>  

                                    <a href="MerchantControll?action=insert"> <button class="btn btn-default"> <span class="glyphicon glyphicon-plus"></span>  Merchant </button></a>
                                </div>
                            </div>
                            <br> <br> <br> 
                            <div id ="Merchant">
                                <div class="table responsive " ><table border="1" > 
                                        <thead>

                                            <tr>
                                                <th>  Merchant-id </th>
                                                <th > Merchant-Name </th>
                                                <th> MCC </th>
                                                <th> class </th>
                                                <th> Merchant-Phone </th>
                                                <th> Email </th> 
                                                <th colspan="2"> Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${users}" var="user">
                                                <tr>
                                                    <td><c:out value="${user.getMid()}" /></td>
                                                    <td><c:out value="${user.getmName()}" /></td>
                                                    <td><c:out value="${user.getMCC()}" /></td>
                                                    <td><c:out value="${user.getmClass()}" /></td>
                                                    <td><c:out value="${user.getPhone1()}" /></td>
                                                    <td><c:out value="${user.getMemail()}" /></td>

                                                    <td><a href="MerchantControll?action=edit&MID=<c:out value="${user.getMid()}"/>">  Update</a></td>
                                                    <td><a href="MerchantControll?action=delete&MID=<c:out value="${user.getMid()}"/>"> Delete</a></td>
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
        <!--   <script>
               $(document).ready(function () {
       
                   $.ajax({
                       url: 'AllMerchant',
                       success: function (responseText) {
                           $('#Merchant').html(responseText);
                       }
                   });
               });
       
       
           </script>
        -->


</body>
</html>
