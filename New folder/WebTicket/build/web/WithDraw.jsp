<%-- 
    Document   : WithDraw
    Created on : May 25, 2018, 6:31:31 AM
    Author     : shimaa
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Services.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Home </title>
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

    <link href="BootStrap/MyCss.css" rel="stylesheet" type="text/css"/>



</head>
<body>
    <%@include file="Header.jsp" %>

    <div class="wrapper ">    
        <%@include  file="AdminSideBar.jsp" %>

        <%-- page Contenct --%>

        <div id="content">
            <div class="panel-group" id="accordion">
                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Terminal Withdraw
                        </h4>
                    </div>

                    <div class="panel-body">
                        <form name="WithDraw" action="TWithDraw" method="POST" class="form-horizontal" id="myForm">

                            <div class="form-group"> 
                                <label class="col-sm-4 control-label"> Merchant-ID</label>
                                <div class="col-sm-8" > 
                                    <select class="form-control" name="MerchantID" style="width: 50%"  >
                                        <option value="0"> select Merchant ID </option>;
                                        <%
                                            connect c = new connect();
                                            Connection con = c.getConn();
                                            Statement stmt = con.createStatement();
                                            ResultSet result = stmt.executeQuery("select * from merchant;");
                                            while (result.next()) {

                                        %>
                                        <option value="<%=result.getInt(1)%>">  <%=result.getString(2) %> </option>
                                        <%
                                            }

                                        %>



                                    </select>
                                </div>
                            </div>



                            <div class="form-group"> 
                                <label class="col-sm-4 control-label"> Terminal</label>
                                <div class="col-sm-8">
                                    <select class="form-control" name="Terminal" style="width: 50%" id="TID">
                                        <option value="0"> select Terminal serial </option>;
                                        <%  connect cc = new connect();
                                            Connection conn = cc.getConn();
                                            //Statement st = conn.createStatement();
                                            PreparedStatement pre = conn.prepareStatement("select `Terminal-id` from terminal where `merchant_Merchant-id`=?");
                                            pre.setString(1, request.getParameter("MerchantID"));
                                            ResultSet re = pre.executeQuery();
                                            while (re.next()) {

                                        %>
                                        <option value="<%=result.getInt(1)%>">  <%= result.getInt(1) %> </option>
                                        <%
                                            }

                                        %>


                                    </select>
                                </div>
                            </div>

                            <div  class="form-group"> 
                                <div class="col-sm-offset-4 col-sm-8">      
                                    <input type="submit" value="Submit" name="submit" class="btn btn-primary" />
                                    <input type="reset" value="Cancel" name="cancel" onclick="Formreset()"  class="btn btn-danger" />
                                </div> 
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%-- 
                <script>


            $(document).ready(function () {

                $.ajax({
                    url: 'GetMerchantId',
                    success: function (responseText) {
                        $('#loadMerchant').html(responseText);
                    }
                });
            });

            function  function2() {
                $.ajax({
                    url: 'AssignTerminal',
                    success: function (responseText) {
                        $('#TID').html(responseText);
                    }
                });
            }


        </script>

        --%>

</body>
</html>
