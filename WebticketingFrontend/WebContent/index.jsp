<%-- 
    Document   : index
    Created on : May 15, 2018, 7:19:02 PM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/form-elements.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>

    <body >
        <div class="top-content">
            <div class="inner-bg " >
                <div class="container" >
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 form-box" >
                            <div class="form-top">
                                <div class="form-top-left">
                                    <img src="Image/Spectralogo.jpg " width="400">
                                    <h2><fmt:message key="welcome" /></h2>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-home"></i>
                                </div>

                                <div>
                                    <div class="col-sm-4">
                                        <a href="Login.jsp" class="d-block mb-4 h-100"> <img class="img-fluid img-thumbnail  "  src="Image/Login.jpg " ></a>
                                    </div>
                                    <div class="col-sm-4">
                                        <a href="ChooseLang.jsp" class="d-block mb-4 h-100" ><img class="img-fluid img-thumbnail "  src="Image/ProblemSub.jpg "></a>
                                    </div>
                                    <div class="col-sm-4 ">
                                        <a href="LiveChat.jsp"  class="d-block mb-4 h-100" > <img  class="img-fluid img-thumbnail "src="Image/LiveChat.png " ></a>

                                    </div>
                                </div>

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



        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
    </body>
</html>
