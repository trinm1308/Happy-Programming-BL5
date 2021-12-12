<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template>
    <jsp:attribute name="title">
        Mentor List
    </jsp:attribute>
    <jsp:body>
        <div class="container"style=" margin-bottom:300px">
            <div class="row">
                <div class="col-12">
                    <form method="Post" action="MentorListController">
                        <div class="mb-3 row">
                            <label for="name" class="col-auto col-form-label">Mentor</label>
                            <div class="col">
                                <input type="text" class="form-control" placeholder="input name mentor" name="searchCode" id="name" value="${searchCode}" maxlength="255">
                            </div>
                            <div class="col-auto">
                                <button class="btn btn-success" type="submit">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <h1>${message}</h1>
                <c:forEach items="${listMentor}" var="i">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <img src="images/${i.ava}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title m-0">${i.fullName}</h5>
                                <p class="card-text text-secondary">${i.description}</p>
                                <p class="card-text"></p>
                                <p class="card-text">
                                    <input value="${i.rate}" type="hidden" class="rating" data-display-only="true" 
                                           data-show-clear="false" data-show-caption="false" 
                                           data-theme="krajee-fas" data-min="0" data-max="5" 
                                           data-step="0.1" data-size="sm" title="">
                                </p>
                                <a href="MentorDetailController?mentorID=${i.id}" class="btn btn-success">Xem thêm</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${listMentor.size() ne 0}">
                <div class="pagination">  
                    <span id="pagination-index" style="display:none">${pageIndex}</span>
                    <button onclick="pagingHandle(${pageIndex}, '${searchCode}')" class="${pageIndex==1? 'btn-current':'btn-success'} rounded-50">Trang trước</button>
                    <c:if test="${pageIndex - 3 > 0}">...</c:if>
                    <c:forEach begin="1" end="${maxPage}" step="1" var="x">
                        <c:if test="${pageIndex - 3 < x && x < pageIndex + 3}">
                            <button onclick="selectPage(${x}, ${searchCode})" class="${x == pageIndex? 'btn-current':'btn-success'} rounded-50">${x}</button>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageIndex + 2 < maxPage}">...</c:if>
                    <button onclick="pagingHandle(${pageIndex}, '${searchCode}', ${maxPage})" class="${pageIndex==maxPage? 'btn-current':'btn-success'} rounded-50"  >Trang sau</button>
                </div>
            </c:if>
        </div>

    </jsp:body>
</t:template>
<script>
    const contextPath = "<%=request.getContextPath()%>";
    const pageIndex = document.getElementById("pagination-index").textContent;

    function pagingHandle(index, code, max) {
        if (typeof max === 'undefined') {
            --index;
        } else {
            ++index;
        }
        if (index < 1 || index > max)
            return;
        let url = contextPath + "/MentorListController?index=" + index + "&searchCode=" + code
        window.location.href = url.toString();
    }
    function selectPage(page, code) {
        if (!code)
            code = "";
        let url = contextPath + "/MentorListController?index=" + page + "&searchCode=" + code
        window.location.href = url.toString();
    }
</script>
