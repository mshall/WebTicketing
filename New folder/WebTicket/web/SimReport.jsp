<%-- 
    Document   : Test
    Created on : Jun 24, 2018, 3:46:11 AM
    Author     : shimaa
--%>

<%@page import="org.apache.commons.beanutils.RowSetDynaClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Services.connect"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
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
    <link href="MyCss.css" rel="stylesheet" type="text/css"/>
    <link href="Report.css" rel="stylesheet" type="text/css"/>
</head>
<body>

    <%@include file="Header.jsp" %>

    <div class="wrapper "> 

        <%@include  file="AdminSideBar.jsp" %>

        <div id="content">



            <% connect c = new connect();
                Connection con = c.getConn();
                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("SELECT * from sim");
                RowSetDynaClass resultSet = new RowSetDynaClass(rs, false);
                //            s.close();
                //            con.close();
                request.setAttribute("results", resultSet);
            %>

            <display:table name="requestScope.results.rows"  export="true" >


                <display:setProperty name="export.excel.filename" value="ActorDetails.xls"/>
                <display:setProperty name="export.pdf.filename" value="ActorDetails.pdf"/>
                <display:setProperty name="export.pdf" value="true" />
            </display:table> 
        </div>
    </div>









</body>
</html>
