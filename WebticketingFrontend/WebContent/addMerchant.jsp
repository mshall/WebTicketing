<%-- 
    Document   : newjsp
    Created on : May 17, 2018, 3:25:19 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
    <head>
    <title><fmt:message key="addMerchant" /></title> 
    
    <style>

    </style>
</head>
<body>
    <script>
        $(function () {
            $('input[name=dob]').datepicker();
        });
    </script>

    <div class="wrapper">
        <%@include  file="AdminSideBar.jsp" %>
        <div  id="content">
        <jsp:include page="AlertMessage.jsp"></jsp:include>
            <div class="panel-group" id="accordion">

                <div class="panel panel-primary" id="panel1">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-target="#collapseOne" 
                               href="#collapseOne">
                                <fmt:message key="addMerchant" /> 
                            </a>
                        </h4>
                    </div>

                </div> 
                <div id="collapseTwo" class="panel-collapse collapse in">
                    <div class="panel-body   ">
                        <form action="MerchantControll" method="POST" class="form-horizontal" >
                            <div class="form-group " >
                                <label class="control-label col-sm-4" ><fmt:message key="MID" /></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" name="ID"  readonly=""  value="<c:out value="${user.getMid()}" />" >
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="MerchantName" /></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="mName"  placeholder="Merchant Name" required="" value="<c:out value="${user.getmName()}"/>" >
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="ContactPerson" /></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="CP" placeholder="Contact Person" value="<c:out value="${user.getMcp()}" />">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="Phone1" /></label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="p1" placeholder="Phone 1" required value="<c:out value="${user.getPhone1()}"/>" >
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="Phone2" /></label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="p2" placeholder="Phone 2" value="<c:out value="${user.getPhone2()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="Email" /></label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" name="email" placeholder="@example.com" value="<c:out value="${user.getMemail()}" />" >
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="City" /></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="City" placeholder="City"value="<c:out value="${user.getCity()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="Street" /></label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="st" placeholder="Street" value="<c:out value="${user.getStreet()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="AMES" /></label>
                                <div class="col-sm-8">
                                    <input type="number " class="form-control" name="Ames"  placeholder="AMes Merchant ID " value="<c:out value="${user.getAID()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="PremiumID" /></label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="pid" placeholder="Premium ID" value="<c:out value="${user.getPID()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="MCC" /></label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="mcc"  placeholder="MCC" value="<c:out value="${user.getMCC()}" />">
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="Class" /></label>
                                <div class="col-sm-8">
                                    <select name="Class">
                                        <option value="">select...</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="Currency" /></label>
                                <div class="col-sm-8">
                                    <select name="Currency">
                                        <option value="">select... </option>
                                         <option value="EGP">EGP</option>
                                         <option value="EUR">EUR</option>
                                         <option value="USD">USD</option>
                                         <option value="SAR">SAR</option>
                                         <option value="AED">AED</option>
                                         <option value="JPY">JPY</option>
                                         <option value="HKD">HKD</option>
                                         <option value="MOP">MOP</option>
                                         <option value="CNY">CNY</option>
                                         <option value="GBP">GBP</option>
                                                      
                                    </select>
                                </div>
                            </div><div class="form-group ">
                                <label class="control-label col-sm-4" ><fmt:message key="Status" /></label>
                                <div class="col-sm-8">
                                    <select name="Status">
                                        <option value="">select...</option>
                                        <option value="active">Active</option>
                                        <option value="inactive">In Active</option>

                                    </select>
                                </div>
                            </div><div class="form-group ">
                                <div class="col-sm-offset-4 col-sm-8">      
                                    <input type="button" value="<fmt:message key="Submit" />" id="submit" class="btn btn-primary" onclick="updateMerchant()"/>
                                    <input type="reset" value="<fmt:message key="Cancel" />" name="cancel" onclick="Formreset()"  class="btn btn-danger"/>
                                </div> 
                            </div>


                        </form>


                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>


        function Formreset() {
            document.getElementById("myForm").reset();
        }

    </script>
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
