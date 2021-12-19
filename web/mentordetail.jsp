<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template>
    <jsp:attribute name="title">
        Thông tin mentor ${mentor.fullName}
    </jsp:attribute>
    <jsp:body>
        <div class="container" style=" margin-top:100px">
            <div class="row mb-3">
                <div class="col-auto">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <div id="gallerydetail" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <img src="${mentor.ava}" class="d-block w-100">
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#gallerydetail" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#gallerydetail" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                        <div class="carousel-indicators">
                            <c:forEach items="${mentor.ava}" var="image" varStatus="loop">
                                <img src="${mentor.ava}" ${loop.first?'class="active"':''} data-bs-target="#gallerydetail" data-bs-slide-to="${loop.index}">
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-12">
                    <h5 class="m-0">
                        ${mentor.fullName}
                        <span class="d-inline-block">
                            <input value="${mentor.rate}" type="hidden" class="rating" data-display-only="true" 
                                   data-show-clear="false" data-show-caption="false" 
                                   data-theme="krajee-fas" data-min="0" data-max="5" 
                                   data-step="0.1" data-size="sm" title="">
                        </span>
                    </h5>
                    <p class="card-text text-secondary">Chuyên môn: ${mentor.skill}</p>
                    <p class="card-text text-secondary">Mô tả: ${mentor.description}</p>
                    <p class="card-text text-secondary">Giá thuê: ${mentor.serviceDescription}</p>
                </div>
            </div>
            <div class="row mb-3 justify-content-center">
                <div class="col-md-6">
                    <p class="text-center fw-bold mb-0">Bài đánh giá ${mentor.fullName} từ khách hàng</p>
                    <p class="text-center">
                        <span class="d-inline-block">
                            <input value="${mentor.rate}" type="hidden" class="rating" data-display-only="true" 
                                   data-show-clear="false" data-show-caption="false" 
                                   data-theme="krajee-fas" data-min="0" data-max="5" 
                                   data-step="0.1" data-size="sm" title="">
                        </span>
                        <span d-inline-block><strong>${mentor.rate}/5</strong> dựa trên ${mentor.rateCount} đánh giá</span>
                    </p>
                </div>
            </div>
            <div class="row mb-3 justify-content-center">
                <div class="col-md-6">
                    <c:if test="${sessionScope.ratingCreated == true}">
                        <div class="alert alert-success" role="alert">
                            Cảm ơn bạn đã đánh giá chúng tôi.
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.ratingCreated == false}">
                        <div class="alert alert-danger" role="alert">
                            Có lỗi trong quá trình đánh giá. Bạn vui lòng thử lại sau
                        </div>    
                    </c:if>
                    <c:remove var="ratingCreated" scope="session" />
                </div>
            </div>
            <div class="row mb-3 justify-content-center">
                <div class="col-md-8">
                    <form action="RatingController" method="POST" class="rating-form">
                        <input type="hidden" name="mentorID" value="${mentor.id}">
                        <div class="row mb-3 align-items-center">
                            <label for="content" class="col-auto form-label fw-bold mb-0">Đánh giá:</label>
                            <textarea class="form-control col" name="content" placeholder="Nhập đánh giá của bạn" rows="3" required maxlength="255"></textarea>
                            <span class="d-inline-block col-auto">
                                <input type="hidden" class="rating" name="point" data-show-clear="false" data-show-caption="false" 
                                       data-theme="krajee-fas" data-min="0" data-max="5" 
                                       data-step="1" data-size="sm" title="" min="0" max="5" required>
                            </span>
                            <div class="col-auto">
                                <button class="btn btn-success">Đánh giá</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row mb-3 justify-content-center">
                <div class="col-md-6">
                    <ul class="nav nav-pills nav-fill mb-3">
                        <li class="nav-item">
                            <a class="nav-link active btn-load-rating" href="RatingController?mentorID=${mentor.id}&point=0" data-rating="0" data-restaurant-id="${mentor.id}" data-page="1">Tất cả</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="RatingController?mentorID=${mentor.id}&point=5">5 sao</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="RatingController?mentorID=${mentor.id}&point=4">4 sao</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="RatingController?mentorID=${mentor.id}&point=3">3 sao</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="RatingController?mentorID=${mentor.id}&point=2">2 sao</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="RatingController?mentorID=${mentor.id}&point=1">1 sao</a>
                        </li>
                    </ul>
                    <div>
                        <c:forEach items="${ratings}" var="rating">
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
                                <p><small>${rating.createdTime}</small></p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>          
</jsp:body>

</t:template>
