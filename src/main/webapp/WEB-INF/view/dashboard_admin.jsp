<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - Examination Application</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>

        <s:url var="url_bcss" value="/static/css/bootstrap.min.css"/>
        <link href="${url_bcss}" rel="stylesheet" type="text/css"/>
        <s:url var="url_bjs" value="/static/js/bootstrap.min.js"/>
        <script type="text/javascript" value="${url_bjs}"></script>
    </head>
    <s:url var="url_bg" value="/static/images/bg.jpg"/>
    <body background="${url_bg}">
        <div class="container">           
            <div>
                <%-- Header --%>
                <jsp:include page="include/header.jsp"/>
            </div>
            <div>
                <%-- Menu --%>
                <jsp:include page="include/menu.jsp"/>
            </div>
            <table width="60%">
                <tr>
                    <td height="350" valign="top">
                        <%-- Content Area --%>
                        <h1></h1>
                        <div style="padding: 20px 0px 20px 0px;">                 
                            <h3>Admin Dashboard - Examination Application</h3>
                        </div> 
                        TODO - Admin Option
                    </td>
                </tr>
                <!--<tr>
                    <td height="25">
                <%-- Footer --%>
                <jsp:include page="include/footer.jsp"/>
            </td>
        </tr>-->
            </table>
            <footer id="footer" align="center">
                <jsp:include page="include/footer.jsp"/>
            </footer>
        </div>
    </body>
</html>
