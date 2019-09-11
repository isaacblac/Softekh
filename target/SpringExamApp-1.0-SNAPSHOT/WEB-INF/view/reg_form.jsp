<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration Form - Examination Application</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
        <s:url var="url_jqlib" value="/static/js/jquery.js"/>
        <script src="${url_jqlib}"></script>

        <s:url var="url_bcss" value="/static/css/bootstrap.min.css"/>
        <link href="${url_bcss}" rel="stylesheet" type="text/css"/>
        <s:url var="url_bjs" value="/static/js/bootstrap.min.js"/>
        <script type="text/javascript" value="${url_bjs}"></script>
        <script>
            $(document).ready(function () {
                $("#id_check_avail").click(function () {
                    $.ajax({
                        url: 'check_avail',
                        data: {username: $("#id_username").val()},
                        success: function (data) {
                            $("#id_res_div").html(data);
                        }
                    });
                });
            });
        </script>
    </head>
    <s:url var="url_bg" value="/static/images/bg.jpg"/>
    <body background="">

        <div>
            <%-- Header --%>
            <jsp:include page="include/header.jsp"/>
        </div>
        <div>
            <%-- Menu --%>
            <jsp:include page="include/menu.jsp"/>
        </div>
        <div class="container">
            <table width="100%">  
                
                <tr>
                    <td height="350" valign="top">
                        <%-- Content Area --%>
                        <div style="padding: 20px 0px 20px 0px;">                 
                            <h3>Student Registration Form</h3>
                        </div>
                        <c:if test="${param.act eq 'lo'}">
                            <p class="success">Logged out successfully : Thanks for using Exam Application!</p>
                        </c:if>
                        <c:if test="${err!=null}">
                            <p class="error">${err}</p>
                        </c:if>
                        <s:url var="url_reg" value="/register"/>
                        <f:form action="${url_reg}" modelAttribute="command" class="form" role="form">
                            <div class="form-group">
                                <label for="fname" class="lead">Full Name: </label>
                                <f:input path="fullName" class="form-control" id="fname"/>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="lead">Phone:</label>
                                <f:input path="phone" class="form-control" id="phone"/>
                            </div>
                            <div class="form-group">
                                <label for="email" class="lead">E-mail:</label>
                                <f:input path="email" class="form-control" id="email"/>
                            </div>
                    </td>
                </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="lead">
                                    <label for="id_username">Username:</label>
                                    <f:input id="id_username" path="loginName" class="form-control"/>
                                    <div id="id_res_div" class="error"></div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="lead" style="padding-top: 20px">
                                <button type="button" class="btn btn-primary" id="id_check_avail">Check Availability</button>                                    
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="lead">
                                    <label for="psw">Password:</label>
                                    <f:password path="password" class="form-control" id="psw"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="lead">
                                    <label for="level">Class:</label>
                                    <f:select path="level" class="form-control" id="level">
                                        <f:option value="" label="Select"></f:option>
                                        <f:option value="ss1" label="SS1"></f:option>
                                        <f:option value="ss2" label="SS2"></f:option>
                                        <f:option value="ss3" label="SS3"></f:option>
                                    </f:select>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>                                   
                        <td>
                            <div class="form-group">
                                <div class="lead">
                                    Gender: 
                                    Male <f:radiobutton path="gender" value="male"/>&nbsp;&nbsp;  
                                    female <f:radiobutton path="gender" value="female"/>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="lead">
                                    <label for="address">Address:</label>
                                    <f:textarea path="address" id="address" class="form-control"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><button type="submit" class="btn btn-primary btn-block">Submit</button><br/>
                    </tr>                    
                </f:form>
            </table>
        </div>
        <footer id="footer" align="center">
            <%-- Footer --%>
            <jsp:include page="include/footer.jsp"/>
        </footer>

    </body>
</html>
