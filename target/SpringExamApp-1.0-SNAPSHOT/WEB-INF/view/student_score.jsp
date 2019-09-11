<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Score - Examination Application</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
        <s:url var="url_jqlib" value="/static/js/jquery.js"/>
        <s:url var="url_bcss" value="/static/css/bootstrap.min.css"/>
        <link href="${url_bcss}" rel="stylesheet" type="text/css"/>
        <s:url var="url_bjs" value="/static/js/bootstrap.min.js"/>
        <script type="text/javascript" value="${url_bjs}"></script>
        <script src="${url_jqlib}"></script>
        <script>
            function myScore() {
                $.ajax({
                    url: 'test_score',
                    success: function (data) {
                        $('#id_score').html(data);
                    }
                });
            }
            $(document).ready(function () {
                $("button").click(function () {
                    $("#id_score").toggle();
                });
            });
        </script>
        <script>
            
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
            <table width="80%" align="center">
                <tr>
                    <td height="350" valign="top">
                        <%-- Content Area --%>
                        <div class="form-group">
                            <p><h1>Problem Solving Test Score</h1>
                        </div>
                        <c:if test="${param.act eq 'ts'}">
                            <p>Problem Solving Test Score!</p>
                        </c:if>
                        <c:if test="${err!=null}">
                            <p class="error">${err}</p>
                        </c:if>
                        <table border="0">

                            <tr>
                                <td>
                                    <button onClick = "myScore()" class="btn btn-primary">CLICK HERE TO SHOW/HIDE SCORE</button>
                                </td>
                            </tr>   
                            <tr>
                                <td>
                                    <p><h1><div style="border: 2px solid; border-radius: 10px; box-shadow: 10px 10px 5px #333;" id="id_score" align="center"></div></h1>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>      
            </table>
        </div>
        <footer id="footer" align="center">
            <jsp:include page="include/footer.jsp"/>
        </footer>

    </body>
</html>
