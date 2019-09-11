<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Student Login - Examination Application</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>

        <s:url var="url_bcss" value="/static/css/bootstrap.min.css"/>
        <link href="${url_bcss}" rel="stylesheet" type="text/css"/>
        <s:url var="url_bjs" value="/static/js/bootstrap.min.js"/>
        <script type="text/javascript" value="${url_bjs}"></script>
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
            <table width="60%" >
                <tr>
                    <td height="350" valign="top">
                        <%-- Content Area --%>
                        <div style="padding: 20px 0px 20px 20px;">                 
                            <h3>Student Login</h3>
                        </div>
                        <c:if test="${param.act eq 'lo'}">
                            <p class="success">Logged out successfully : Thanks for using Exam Application!</p>
                        </c:if>
                        <c:if test="${param.act eq 'reg'}">
                            <p class="success">Student registered successfully : Please login!</p>
                        </c:if>
                        <c:if test="${err!=null}">
                            <p class="error">${err}</p>
                        </c:if>
                        <s:url var="url_login" value="/login"/>
                        <f:form action="${url_login}" modelAttribute="command" role="form">
                            <div class="form-group" id="id_tfs">
                                <label class="lead" for="name">Username:</label>
                                <f:input path="loginName" class="form-control" id="name"/>
                            </div>
                            <div class="form-group" id="id_tfs">
                                <label class="lead" for="password">Password:</label>
                                <f:password path="password" class="form-control" id="password"/>
                            </div>
                            <div id="id_tfs">
                                <button type="submit" class="btn btn-primary btn-block">Login</button><br/>
                                <s:url var="url_reg_form" value="/reg_form"/>
                                <a href="${url_reg_form}">New Student Registration</a>
                            </div>                   
                        </f:form>
                    </td>
                </tr>
            </table>
        </div>
        <footer id="footer" align="center">
            <jsp:include page="include/footer.jsp"/>
        </footer>

    </body>
</html>
