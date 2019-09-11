<%-- 
    Document   : test
    Created on : 16-Oct-2018, 20:25:43
    Author     : ISAAC BLACK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <s:url var="url_jqlib" value="/static/js/jquery.js"/>
        <script src="${url_jqlib}"></script>
        <script>
            $(document).ready(function(){
                //alert('JQuery is ready and integrated!');
                $("#id_get_time").click(function(){
                    //alert('Button Clicked.....');
                    $.ajax({
                        url : 'get_time',
                        success : function(data){
                            $('#id_time').html(data);
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <h1>Ajax test Page!</h1>
        <button id="id_get_time">GET SERVER TIME!</button><br/>
        <p id="id_time"></p>
    </body>
</html>
