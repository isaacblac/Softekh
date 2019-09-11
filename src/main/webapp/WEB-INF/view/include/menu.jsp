<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>

<s:url var="url_home" value="/index"/>
<s:url var="url_logout" value="/logout"/>
<c:if test="${sessionScope.studentId==null}">
    <%-- Student is not yet logged in : Guest Menu --%>
    <s:url var="url_reg_form" value="/reg_form"/>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Softekh</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li>
                    <a class="nav-link" href="${url_home}">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${url_home}">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${url_reg_form}">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">Help</a>
                </li>
            </ul>
        </div>
    </nav>
</c:if>
<c:if test="${sessionScope.studentId!=null && sessionScope.role == 1}">
    <%-- Admin is logged in : Admin Menu --%>
    <s:url var="url_slist" value="/student/slist"/>
    <s:url var="url_rlist" value="/student/rlist"/>

    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Softekh</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li>
                    <a class="nav-link" href="${url_home}">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${url_slist}">Student List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${url_rlist}">Result List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${url_logout}">Logout</a>
                </li>
            </ul>
        </div>
    </nav>


</c:if>  
<c:if test="${sessionScope.studentId!=null && sessionScope.role == 2}">
    <%-- Student is logged in : Student Menu --%>
    <s:url var="url_exam" value="/student/student_exam"/>    
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Softekh</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li>
                    <a class="nav-link" href="${url_home}">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${url_exam}">Test</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${url_logout}">Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">Help</a>
                </li>
            </ul>
        </div>
    </nav>


</c:if>
