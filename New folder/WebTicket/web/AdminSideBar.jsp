<%-- 
    Document   : AdminSideBar
    Created on : May 23, 2018, 7:39:48 PM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <nav id="sidebar">
        <div class="sidebar-header">
            <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn  " >
                <i class="glyphicon glyphicon-align-right"></i>
                <span></span>
            </button>
        </div>
        <ul class="list-unstyled components">
            <li class="active">
                <a href="AdminHome.jsp"  >
                    <i class="glyphicon glyphicon-home"></i>
                    Home
                </a></li>

            <li >
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-briefcase"></i>
                    Accounts
                </a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li><a href="TechnicalIndex.jsp"> Technical</a></li>
                    <li><a href="MerchantIndex.jsp"> Merchant</a></li>
                    <li><a href="StoreIndex.jsp"  > Store</a>
                    </li>
                    <li><a href="ChangePassword.jsp">Change Password</a></li>
                </ul>
            </li>
            <li>
                <a href="#Terminal" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-phone"></i>
                    Terminal
                </a>
                <ul class="collapse list-unstyled" id="Terminal">
                    <li><a href="TerminalIndex.jsp">Terminals</a></li>
                    <li><a href="DeploymentIndex.jsp">Deployment</a></li>
                    <li><a href="TerminalUpdate.jsp">Update Deployment </a></li>

                </ul>
            </li>
            <li>
                <a href="#SIM" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-duplicate"></i>
                    SIM
                </a>
                <ul class="collapse list-unstyled" id="SIM">
                    <li><a href="SimIndex.jsp"> SIM </a></li>
                </ul>
            </li>
            <li>
                <a href="#RollPaper" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-duplicate"></i>
                    Roll Paper
                </a>
                <ul class="collapse list-unstyled" id="RollPaper">
                    <li><a href="MerchantRP.jsp">Store to Merchant</a></li>
                </ul>
            </li>
            <li>
                <a href="#Tickets" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-duplicate"></i>
                    Tickets
                </a>
                <ul class="collapse list-unstyled" id="Tickets">
                    <li><a href="InboxTickets.jsp">Inbox Tickets</a></li>
                    <li><a href="AssignTicket.jsp">Assign Ticket</a></li>
                    <li><a href="TicketsHistory.jsp">Tickets History</a></li>
                    <li><a href="TicketsMaintenance.jsp">Tickets Maintenance</a></li>
                </ul>
            </li>
            <li>
                <a href="#Withdraw" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    Withdraw
                </a>
                <ul class="collapse list-unstyled" id="Withdraw">

                    <li><a href="WithDraw.jsp">Add New Withdraw</a></li>
                    <li><a href="WithDrawLogs.jsp">WithDraw Logs </a></li>
                </ul>
            </li>
            <li>
                <a href="#Reports" data-toggle="collapse" aria-expanded="false">
                    <i class="glyphicon glyphicon-envelope"></i>
                    Reports
                </a>
                <ul class="collapse list-unstyled" id="Reports">
                    <li><a href="TechnicalReport.jsp.jsp">Technical Report</a></li>
                    <li><a href="MerchantReport.jsp">Merchant  Report</a></li>
                    <li><a href="MnReport.jsp">Maintenance Report</a></li>
                    <li><a href="TicketReport.jsp">Tickets Report</a></li>
                    <li><a href="WdReport.jsp">Withdraw  Report</a></li>
                    <li><a href="WithdrawReport.jsp">Store Report</a></li>
                    <li><a href="SimReport.jsp">SIM Report</a></li>
                    <li><a href="TerminalReport.jsp">Terminal Report</a></li>
                    <li><a href="RpReport.jsp">Roll Paper Report</a></li>
                </ul>
            </li>

            <li>
                <a href="#">
                    <i class="glyphicon glyphicon-log-out"></i>
                    Log Out
                </a>
            </li>
        </ul>


    </nav>




    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>


</body>
</html>
