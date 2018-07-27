<%-- 
    Document   : ChooseLang
    Created on : May 16, 2018, 2:55:15 AM
    Author     : shimaa
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

        <title>Choose Lang</title>

    </head>
    <body>

        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <form action="chooseLang" method="POST">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <img src="Image/Spectralogo.jpg " width="400">
                                    <h3>Choose Your language </h3>

                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-chain"></i>
                                </div>
                            </div>

                            <div class="form-bottom">
                                <div class="form-label-group text-center " >
                                    <select name="Lang" style="width:50%" onchange="this.form.submit();">
                                        <option value="none"> Choose language</option>
                                        <option value="ar_EG" > Arabic</option>
                                        <option value="US" > English</option>
                                        <option value="fr_FR"> French</option>
                                        <option value="IT">Italy </option>
                                        <option value="CH">Chinese</option>
                                    </select>


                                </div>

                            </div>

                        </div>
 </form>
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
        
        <script
            function LoadForm(){
            
            }
            
        
        
        ></script>
    </body>
</html>
