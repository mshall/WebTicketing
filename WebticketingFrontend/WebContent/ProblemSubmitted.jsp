<%-- 
    Document   : Login
    Created on : May 16, 2018, 12:05:08 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${language}">
    <head>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="BootStrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/form-elements.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <title><fmt:message key="problem_submit" /></title>


    </head>
    <body >
    <form>
            <select id="language" name="language" onchange="submit()">
                <option value="en_US" ${language == 'en_US' ? 'selected' : ''}>English</option>
                <option value="ar_EG" ${language == 'ar_EG' ? 'selected' : ''}>Arabic</option>               
            </select>
     </form> 
     
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 form-box">
                            <div class="form-top">
                                <div class="form-top-left ">
                                    <img src="Image/Spectralogo.jpg " width="200">
                                    <b ><fmt:message key="write_issue" /></b>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-question"></i>
                                </div>
                            </div>                        
                            
                            <div class="form-bottom">
                                <form action="ProbelmSubmit" Method ="POST" class=" form-horizontal">
                                    <div class="form-group">
                                        <label  name="TID"> <fmt:message key="tid"/> </label>
                                        <input type="text" name="TID" class="form-control">
                                    </div>

                                    <div class="form-group">
                                        <label  name="MID"><fmt:message key="mid"/> </label>
                                        <input type="text" name="MID" class=" form-control">
                                    </div>

                                    <div class="form-group">
                                        <label  name="CP"><fmt:message key="contact_name" /></label>
                                        <input type="text" name="CP"  class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label  name="Mob"><fmt:message key="mobile" /></label>
                                        <input type="text" name="Mob" class=" form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label  name="PD"><fmt:message key="problem_details" /></label>
                                        <input type="text" name="PD" class=" form-control">
                                    </div>
                                    <button type="submit" class="btn btn-lg btn-primary btn-block"><fmt:message key="submit" /></button>
                                </form>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>

        <script src="assets/js/jquery.backstretch.min.js" type="text/javascript"></script>
        <script src="assets/js/scripts.js" type="text/javascript"></script>

        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->




    </body>
</html>
