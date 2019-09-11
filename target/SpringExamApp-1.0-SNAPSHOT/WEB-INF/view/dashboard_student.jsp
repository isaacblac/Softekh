<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Dashboard - Examination Application</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>

        <s:url var="url_bcss" value="/static/css/bootstrap.min.css"/>
        <link href="${url_bcss}" rel="stylesheet" type="text/css"/>
        <s:url var="url_bjs" value="/static/js/bootstrap.min.js"/>
        <script type="text/javascript" value="${url_bjs}"></script>
    </head>
    <s:url var="url_bg" value="/static/images/bg.jpg"/>
    <body background="${url_bg}">

        <div>
            <%-- Header --%>
            <jsp:include page="include/header.jsp"/>
        </div>
        <div>
            <%-- Menu --%>
            <jsp:include page="include/menu.jsp"/>
        </div>
        <div class="container">
            <table width="60%">
                <tr>
                    <td height="350" valign="top">
                        <%-- Content Area --%>                   
                        <div align="center" style="padding: 20px 0px 20px 0px;">                 
                            <h3>Student Dashboard - Examination Application</h3>
                        </div>                
                    </td>
                </tr>
            </table>
        </div>
        <footer id="footer" align="center">
            <jsp:include page="include/footer.jsp"/>
        </footer>

    </body>
</html>
