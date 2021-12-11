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
        <div class="container" style=" margin-bottom:300px">
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
                    <p class="mb-0">Mô tả:</p>
                    <p>                    
                        ${mentor.description}<br/>
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
                        <span d-inline-block><strong>${mentor.rate}/5</strong> dựa trên ${mentor.rate} đánh giá</span>
                    </p>
                </div>
            </div>

        </div>          
    </jsp:body>

</t:template>