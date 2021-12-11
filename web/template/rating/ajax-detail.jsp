<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${ratings.totalItem == 0}">
    Không có đánh giá nào
</c:if>
<c:if test="${ratings.totalItem > 0}">
    <c:forEach items="${ratings.data}" var="rating">
        <div class="rating-item">
            <div class="d-flex align-items-center">
                <div class="flex-shrink-0">
                    <img src="https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar.png" width="50px" class="img-fluid rounded-pill">
                </div>
                <div class="flex-grow-1 ms-3">
                    <strong>${rating.author}</strong>
                </div>
            </div>
            <input value="${rating.point}" type="hidden" class="rating" data-display-only="true" 
                   data-show-clear="false" data-show-caption="false" 
                   data-theme="krajee-fas" data-min="0" data-max="5" 
                   data-step="1" data-size="sm" title="">
            <p class="m-0 fst-italic">"${rating.content}"</p>
            <p><small><fmt:formatDate value="${rating.createdTime}" pattern="H:m:s dd/MM/yyyy" /></small></p>
        </div>
    </c:forEach>
    <c:if test="${ratings.totalPage > 1}">
        <ul>
            <c:if test="${ratings.currentPage > 1}">
                <a class="btn btn-light btn-load-rating-page" href="#" data-page="${orders.currentPage-1}" data-rating="${point}" data-restaurant-id="${restaurantId}"><b>Trang trước</b></a>
            </c:if>
            <c:forEach var="pageNumber" begin="1" end="${ratings.totalPage}" step="1">
                <c:if test="${ratings.currentPage == pageNumber}">
                    <a class="btn btn-success" href="#">${pageNumber}</a>
                </c:if>
                <c:if test="${ratings.currentPage != pageNumber}">
                    <a class="btn btn-light btn-load-rating-page" href="#" data-page="${pageNumber}" data-rating="${point}" data-restaurant-id="${restaurantId}">${pageNumber}</a>
                </c:if>
            </c:forEach>
            <c:if test="${ratings.currentPage < ratings.totalPage}">
                <a class="btn btn-light btn-load-rating-page" href="#" data-page="${orders.currentPage+1}" data-rating="${point}" data-restaurant-id="${restaurantId}"><b>Trang sau</b></a>
            </c:if>
        </ul>
    </c:if>
</c:if>