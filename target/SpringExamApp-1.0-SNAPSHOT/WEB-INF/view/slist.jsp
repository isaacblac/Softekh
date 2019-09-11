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

        <s:url var="url_bcss" value="/static/css/bootstrap.min.css"/>
        <link href="${url_bcss}" rel="stylesheet" type="text/css"/>
        <s:url var="url_bjs" value="/static/js/bootstrap.min.js"/>
        <script type="text/javascript" value="${url_bjs}"></script>
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
            <table width="100%" align="center" class="table">
                <tr>
                    <td height="350" valign="top">
                        <%-- Content Area --%>
                        <div style="padding: 20px 0px 20px 0px;">                 
                            <h3>Student List</h3>
                        </div>
                        <c:if test="${param.act eq 'del'}">
                            <p class="success">Record deleted Successfully!</p>
                        </c:if>
                        <c:if test="${param.act eq 'ed'}">
                            <p class="success">Record Updated Successfully!</p>
                        </c:if>
                        <table width="90%">
                            <tr>
                            <form action="<s:url value="/student/student_search" />" role="form">
                                <td align="right" style="padding-left: 600px;">
                                    <input type="text" name="freeText" class="form-control" value="${param.freeText}" placeholder="Enter Text To Search"/>
                                </td>
                                <td align="right">
                                    <button type="submit" class="btn btn-info inline">Find</button>
                                </td>
                            </form><br />
                    </td>
                </tr>
            </table>

            <form action="<s:url value="/student/bulk_sdelete"/>" class="form-inline" role="form">
                <button type="submit" class="btn btn-danger">Delete Selected Records</button><br/><br/>
                <table class="table table-bordered" width="100%">
                    <thead>
                        <tr align="center">
                            <th>S/N</th>
                            <th>SID</th>
                            <th>Full Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Class</th>
                            <th>Gender</th>
                            <th>Status</th>
                            <th>Action</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty studentList}">
                            <tr>
                                <td colspan="8" class="error">No Record Found!</td>
                            </tr>
                        </c:if>

                        <c:forEach var="c" items="${studentList}" varStatus="st" >
                            <tr>
                                <td align="center"><input type="checkbox" name="sid" value="${c.studentId}"></td>
                                <td align="center">${c.studentId}</td>
                                <td>${c.fullName}</td>
                                <td>${c.phone}</td>
                                <td>${c.email}</td>
                                <td>${c.address}</td>
                                <td align="center">${c.level}</td>
                                <td>${c.gender}</td>

                                <td>
                                    <select id="id_${c.studentId}" onchange="changeStatus(${c.studentId}, $(this).val())" class="form-control">
                                        <option value="1">Active</option>
                                        <option value="2">Block</option>
                                    </select>
                                    <script>
                                        $('#id_${c.studentId}').val(${c.loginStatus});
                                    </script>
                                </td>                                                                      

                                <s:url var="url_del" value="/student/del_student">
                                    <s:param name="sid" value="${c.studentId}"/>
                                </s:url>
                                <s:url var="url_edit" value="/student/edit_student">
                                    <s:param name="sid" value="${c.studentId}"/>
                                </s:url>
                                <td><a href="${url_edit}" class="btn btn-success">Edit</a> <a href="${url_del}" class="btn btn-danger" onclick="return confirm('Are you show you want to delete record!')">Delete</a></td>                            
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </form>                   
        </td>
    </tr>
</table>
</div>
<footer id="footer" align="center">
    <jsp:include page="include/footer.jsp"/>
</footer>
</body>
</html>
