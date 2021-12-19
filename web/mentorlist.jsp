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
                            <img src="${i.ava}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title m-0">${i.fullName}</h5>
                                <p class="card-text text-secondary">Chuyên môn: ${i.skill}</p>
                                <p class="card-text text-secondary">Mô tả: ${i.description}</p>
                                <p class="card-text text-secondary">Giá thuê: ${i.serviceDescription}</p>
                                <p class="card-text"></p>
                                <p class="card-text">
                                    <input value="${i.rate}" type="hidden" class="rating" data-display-only="true" 
                                           data-show-clear="false" data-show-caption="false" 
                                           data-theme="krajee-fas" data-min="0" data-max="5" 
                                           data-step="0.1" data-size="sm" title="">
                                </p>
                                <a href="MentorDetailController?mentorID=${i.id}" class="btn btn-success">Xem thêm</a>
                                <c:if test="${sessionScope.user!=null}">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">Thuê</button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <p>Nhập thông tin</p>
                                </div>
                                <form action="RequestMentorController" method="Get" id="request_mentor">
                                    <div class="form-group row" hidden="true">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Số giờ</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" id="inputPassword" name="mentorID" value="${i.id}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Số giờ</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" id="inputPassword" name="hourse" placeholder="Số giờ muốn thuê">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Ghi chú</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputPassword" name="note" placeholder="Nhập thông tin ghi chú">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-2 col-form-label">Ngày bắt đầu</label>
                                        <div class="col-sm-10">
                                            <input type="datetime-local" class="form-control" id="birthdaytime"  name="time">
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-success" data-dismiss="modal" id="request">Thuê</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="pagination">    
                <button onclick="pagingHandle(${pageIndex}, '${searchCode}')" class="btn-success rounded-50">Trang trước</button>
                <span id="pagination-index">${pageIndex}</span>
                <button onclick="pagingHandle(${pageIndex}, '${searchCode}', ${maxPage})" class="btn-success rounded-50"  >Trang sau</button>
            </div>
        </div>
        <!-- Modal -->

    </jsp:body>
</t:template>
