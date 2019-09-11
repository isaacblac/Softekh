<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Test - Examination Application</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
        <s:url var="url_jqlib" value="/static/js/jquery.js"/>
        <script src="${url_jqlib}"></script>

        <s:url var="url_bcss" value="/static/css/bootstrap.min.css"/>
        <link href="${url_bcss}" rel="stylesheet" type="text/css"/>
        <s:url var="url_bjs" value="/static/js/bootstrap.min.js"/>
        <script type="text/javascript" value="${url_bjs}"></script>
    </head>
    <s:url var="url_bg" value="/static/images/bg.jpg"/>
    <body background="<!--${url_bg}--!>">
        <div class="container">
            <table width="80%" align="center">
                <tr>
                    <td height="80">
                        <%-- Header --%>
                        <jsp:include page="include/header.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td height="25">
                        <%-- Menu --%>
                        <jsp:include page="include/menu.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td height="350" valign="top">
                        <%-- Content Area --%>

                        <c:if test="${param.act eq 'lo'}">
                            <p class="success">Logged out successfully : Thanks for using Exam Application!</p>
                        </c:if>
                        <c:if test="${err!=null}">
                            <p class="error">${err}</p>
                        </c:if>
                        <s:url var="url_test" value="/student/save_test"/>
                        <f:form action="${url_test}" modelAttribute="command" class="form-horizontal" role="form">
                            <div class="container">
                                <div style="padding: 20px 0px 20px 0px;">                 
                                    <h3>Quantitative :: Problem Solving</h3>
                                </div>
                                <table class="table">
                                    <tr>
                                        <td>
                                            Q1. A rabbit on a controlled is fed daily 300 grams of a mixture of two foods, food X and food Y. 
                                            Food X contains 10 percent protein and Y contains 15 percent protein. If the rabbit's diet provides
                                            exactly 38 grams of protein daily, how many grams of food X are in the mixture?<br>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question1" value="a" id="id_Q1" />100</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question1" value="b" id="id_Q1" />140</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question1" value="c" id="id_Q1" />150</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question1" value="d" id="id_Q1" />160</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question1" value="e" id="id_Q1" />200</label>
                                            </div>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Q2. Of the 3,600 employees of company X, 1/3 are clerical. If the clerical staff are to be reduced by
                                            1/3, what percent of the total number of the remaining employees would then be clerical?<br>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question2" value="a" class="id_Q2" />25%</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question2" value="b" class="id_Q2" />22.2%</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question2" value="c" class="id_Q2" />20%</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question2" value="d" class="id_Q2" />12.5%</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question2" value="e" class="id_Q2" />11.1%</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><br>
                                            <table width="60%" align="center" class="table table-bordered">
                                                <thead>
                                                    <tr align="center">
                                                        <th>District</th>
                                                        <th>Number of votes</th>
                                                        <th>Percent of votes for candidate P</th>
                                                        <th>Percent of votes for candidate Q</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr align="center">
                                                        <td>1</td>
                                                        <td>800</td>
                                                        <td>60</td>
                                                        <td>40</td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td>2</td>
                                                        <td>1,000</td>
                                                        <td>50</td>
                                                        <td>50</td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td>3</td>
                                                        <td>1,500</td>
                                                        <td>50</td>
                                                        <td>50</td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td>4</td>
                                                        <td>1,800</td>
                                                        <td>40</td>
                                                        <td>60</td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td>5</td>
                                                        <td>1,200</td>
                                                        <td>30</td>
                                                        <td>70</td>
                                                    </tr>
                                                </tbody>
                                            </table><br>
                                            Q3. The table above shows the results of a recent school board election in which
                                            the candidate with the higher total number of votes from the five districts was
                                            declared the winner. Which district has the greatest number of votes for the winner?<br>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question3" value="a" class="id_Q3" />1</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question3" value="b" class="id_Q3" />2</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question3" value="c" class="id_Q3" />3</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question3" value="d" class="id_Q3" />4</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question3" value="e" class="id_Q3" />5</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Q4. If x/y = 2/3, then x - y/y = <br>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question4" value="a" class="id_Q4" />-1/2</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question4" value="b" class="id_Q4" />-1/3</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question4" value="c" class="id_Q4" />1/3</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question4" value="d" class="id_Q4" />1/2</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question4" value="e" class="id_Q4" />5/2</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Q5. A certain bakery has 6 employees. It pays annual salaries of $14,000 to each of two employees,
                                            $16,000 to 1 employee, and $17,000 to  each of the remaining 3 employees. The average(arithmetic mean)
                                            of these employees is closest to each of the following?<br>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question5" value="a" class="id_Q5" />$15,200</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question5" value="b" class="id_Q5" />$15,500</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question5" value="c" class="id_Q5" />$15,800</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question5" value="d" class="id_Q5" />$16,000</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question5" value="e" class="id_Q5" />$16,400</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Q6. The earth travels around the sun at a speed of approximately 18.5 miles per second.
                                            This approximate speed is how many miles per hour?<br>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question6" value="a" class="id_Q6" />1, 080</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question6" value="b" class="id_Q6" />1,160</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question6" value="c" class="id_Q6" />64,800</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question6" value="d" class="id_Q6" />66,600</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question6" value="e" class="id_Q6" />3,996,000</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Q7. If 1/2 of the money in a certain trust fund was invested in stocks, 1/4 in bonds,
                                            1/5 in a mutual fund, and the remaining $10,000 in a government certificate, what was the
                                            total amount of the trust fund?<br>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question7" value="a" class="id_Q7" />$100,000</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question7" value="b" class="id_Q7" />$150,000</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question7" value="c" class="id_Q7" />$200,000</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question7" value="d" class="id_Q7" />$500,000</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question7" value="e" class="id_Q7" />$2,000,000</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Q8. If y = 4+(x-3)^2, then y is least when x=<br>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question8" value="a" class="id_Q8" />14</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question8" value="b" class="id_Q8" />13</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question8" value="c" class="id_Q8" />0</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question8" value="d" class="id_Q8" />3</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question8" value="e" class="id_Q8" />4</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Q9. A box contains 100 balls, numbered from 1 to 100. If three balls are selected at random
                                            and with replacement from the box, what is the probability that the sum of the three numbers
                                            on the balls selected from the box will be odd?<br>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question9" value="a" class="id_Q9" />1/4</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question9" value="b" class="id_Q9" />3/8</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question9" value="c" class="id_Q9" />1/2</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question9" value="d" class="id_Q9" />5/8</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question9" value="e" class="id_Q9" />3/4</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Q10. If 3 and 8 are the lengths of two sides of a triangular region,
                                            which of the following can be the length of the third side?<br>
                                            <p>       
                                                I. 5<br>
                                                II. 8<br>
                                                III. 11<br>
                                            </p>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question10" value="a" class="id_Q10" />II only</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question10" value="b" class="id_Q10" />III only</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question10" value="c" class="id_Q10" />I and II only</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question10" value="d" class="id_Q10" />II and III only</label>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <label><f:radiobutton path="exam.question10" value="e" class="id_Q10" />I, II, and III</label>
                                            </div>
                                            <br />  
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td colspan="2" align="center">
                                            <button id="id_btn" type="submit" class="btn btn-primary btn-block">Submit Test</button><br /><br />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </f:form>

                    </td>
                </tr>
            </table>
            <footer id="footer" align="center">
                <jsp:include page="include/footer.jsp"/>
            </footer>
        </div>
    </body>
</html>
