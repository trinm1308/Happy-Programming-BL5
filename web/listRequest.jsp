<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template>
    <jsp:attribute name="title">
        List request
    </jsp:attribute>
    <jsp:body>
        <div class="container"style=" margin-top:100px">

            <div class="row">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Mentor ID</th>
                            <th scope="col">Message</th>
                            <th scope="col">Start Date</th>
                            <th scope="col">Created Date</th>
                            <th scope="col">Hours</th>
                            <th scope="col">Skill</th>
                            <th scope="col">Author</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestEntitys}" var="i">
                            <tr>
                                <td>${i.id}</td>
                                <td>${i.mentorID}</td>
                                <td>${i.message}</td>
                                <td>${i.startDate}</td>
                                <td>${i.createdDate}</td>
                                <td>${i.hours}</td>
                                <td>${i.title}</td>
                                <td>${i.author}</td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>

        </jsp:body>
    </t:template>