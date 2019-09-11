<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student List - Examination Application</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
        <s:url var="url_jqlib" value="/static/js/jquery.js"/>
        <script src="${url_jqlib}"></script>
        <script>
            function changeStatus(sid, lstatus) {
                //alert(studentId+", "+loginStatus);
                $.ajax({
                    url: 'change_status',
                    data: {studentId: sid, loginStatus: lstatus},
                    success: function (data) {
                        alert(data);
                    }
                });
            }
        </script>
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
        <div class="container lead"> 
            <table width="100%">
                <tr>
                    <td height="350" valign="top">
                        <%-- Content Area --%>
                        <div style="padding: 20px 0px 20px 0px;">                 
                            <h3>Students Test Score</h3>
                        </div>
                        <c:if test="${param.act eq 'del'}">
                            <p class="success">Record deleted Successfully!</p>
                        </c:if>
                        <c:if test="${param.act eq 'ed'}">
                            <p class="success">Record Updated Successfully!</p>
                        </c:if>
                        <!-- <table width="92%">
                             <tr>
                                 <td align="right">
                                     <form action="<s:url value="/student/student_search" />">
                                         <input type="text" name="freeText" value="${param.freeText}" placeholder="Enter Text To Search"/>
                                         <button>Find</button>
                                     </form><br />
                                 </td>
                             </tr>
                         </table>-->

                        <form action="<s:url value="/result/bulk_sdelete"/>">
                            <button type="submit" class="btn btn-danger">Delete Selected Records</button><br/><br/>
                            <table class="table table-bordered" role="table">
                                <thead>
                                    <tr>
                                        <th colspan="4" align="center">Correct Answers</th>
                                        <th>B</th>
                                        <th>A</th>
                                        <th>D</th>
                                        <th>A</th>
                                        <th>C</th>
                                        <th>B</th>
                                        <th>C</th>
                                        <th>D</th>
                                        <th>C</th>
                                        <th>A</th>
                                        <th rowspan="2" style="padding-bottom: 37px">Score</th>
                                        <th rowspan="2" style="padding-bottom: 37px">Action</th>
                                    </tr>                                
                                    <tr>
                                        <th>TID</th>
                                        <th>SID</th>
                                        <th>Full Name</th>
                                        <th>Class</th>
                                        <th>Q1</th>
                                        <th>Q2</th>
                                        <th>Q3</th>
                                        <th>Q4</th>
                                        <th>Q5</th>
                                        <th>Q6</th>
                                        <th>Q7</th>
                                        <th>Q8</th>
                                        <th>Q9</th>
                                        <th>Q10</th>
                                    </tr>
                                </thead>

                                <c:if test="${empty studentResult}">
                                    <tr>
                                        <td colspan="8" class="error">No Record Found!</td>
                                    </tr>
                                </c:if>

                                <c:forEach var="r" items="${studentResult}" varStatus="st" >
                                    <tbody>
                                        <tr>
                                            <td align="center"><input type="checkbox" name="eid" value="${r.examId}"></td>
                                            <td>${r.examId}</td>
                                            <td>${r.fullName}</td>
                                            <td>${r.level}</td>
                                            <td>${r.question1}</td>
                                            <td>${r.question2}</td>
                                            <td>${r.question3}</td>
                                            <td>${r.question4}</td>
                                            <td>${r.question5}</td>
                                            <td>${r.question6}</td>
                                            <td>${r.question7}</td>
                                            <td>${r.question8}</td>
                                            <td>${r.question9}</td>
                                            <td>${r.question10}</td>
                                            <td>${r.score}</td>
                                            <s:url var="url_del" value="/student/del_score">
                                                <s:param name="eid" value="${r.examId}"/>
                                            </s:url>
                                            <td><a href="${url_del}" class="btn btn-danger" onclick="return confirm('Are you show you want to delete record!')">Delete</a></td>                            
                                        </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
                        </form>                   
                    </td>
                </tr>
            </table>
        </div>
        <%-- Footer --%>
        <footer id="footer" align="center">                        
            <jsp:include page="include/footer.jsp"/>
        </footer>
    </div>
</body>
</html>
