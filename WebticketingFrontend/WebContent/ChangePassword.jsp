<%-- 
    Document   : Login
    Created on : May 16, 2018, 12:05:08 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Latest compiled and minified CSS -->
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
    <title>Change Password</title>

    <style>

        body {font-family: Arial, Helvetica, sans-serif;}

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* Set a style for all buttons */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }.container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }


    </style>
</head>
<body>

    <div class="container-fluid text-center">
        <img src="Image/Spectralogo.jpg " width="400">
    </div>
    <br ><br><br>
    <jsp:include page="AlertMessage.jsp"></jsp:include>
    
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">

                
                <div class="jumbotron">
                    <form action="ChangePassword" Method ="POST">
                    <div>
                        <label for="uname"><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" id="userName" required>
                    </div> 
                    <div>
                        <label for="psw"><b> Old Password</b></label>
                        <input type="password" placeholder="Enter Old Password" id="password" required>
                        
                    </div>
                         <div>
                        <label for="psw"><b> New Password</b></label>
                        <input type="password" placeholder="Enter New Password" id="newPassword" required>
                    </div>
                        
                    <div>
                        <button type="button" onclick="changePassword()">Change</button>
                       
                    </div>
                    </form>
                </div>




            </div>
            <div class="col-sm-4" ></div>

        </div>

    </div>
    <script src="assets/js/operations/util.js"></script>
    <script src="assets/js/operations/login.js"></script>
    <script>
   
    		$(document).ready(function() {
    		
    $("#successUpdate").hide();
            $("#errorUpdate").hide();
    		});
    		 </script> 
</body>
</html>
