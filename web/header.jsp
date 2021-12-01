<%-- 
    Document   : header
    Created on : Oct 13, 2021, 11:22:42 PM
    Author     : Tri
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Custom CSS-->
        <link rel="stylesheet" href="css/template.css" />

        <title>Header</title>
    </head>
    <body>
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark" style="background-color: #272727; font-family: Nunito Sans, Arial, sans-serif;">
            <button type="button" id="sidebarCollapse" class="btn-link" style="margin-right: 10px">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" style="margin-right: 4rem" href="homepage.jsp">Happy Programming</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto" style="flex: auto; justify-content: space-between">

                    <li class="nav-item dropdown">
                        <c:if test="${sessionScope.user!=null}">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <b>
                                    <c:choose>
                                        <c:when test="${sessionScope.user.role==0}">Mentor</c:when>
                                        <c:when test="${sessionScope.user.role==1}">Mentee</c:when>
                                        <c:when test="${sessionScope.user.role==2}">Admin</c:when>
                                    </c:choose>
                                </b>
                                actions
                            </a>

            <!-- Language Switch Start -->

            <!-- Language Switch End -->

            <!-- User Menu Start -->
            <div class="user-container d-flex">
                <a href="#" class="d-flex user position-relative" data-bs-toggle="dropdown" aria-haspopup="true"
                   aria-expanded="false">
                    <c:if test="${sessionScope.AuthenticationUser != null}">
                        <img class="profile" alt="profile" src="${pageContext.request.contextPath}${sessionScope.AuthenticationUser.avatar}" />
                        <div class="name">${sessionScope.AuthenticationUser.name}</div>
                    </c:if>
                    <c:if test="${sessionScope.AuthenticationUser == null}">
                        <img class="profile" alt="profile" src="${pageContext.request.contextPath}/resources/img/profile/default.jpg" />
                        <div class="name">Khách</div>
                    </c:if>
                </a>
                <div class="dropdown-menu dropdown-menu-end user-menu wide">
                    <div class="row mb-3 ms-0 me-0">
                        <div class="col-12 ps-1 mb-2">
                            <div class="text-extra-small text-primary">TÀI KHOẢN</div>
                        </div>
                        <div class="col-6 ps-1 pe-1">
                            <ul class="list-unstyled">
                                <c:if test="${sessionScope.AuthenticationUser != null}">
                                    <li> <a href="${pageContext.request.contextPath}/profile?action=general">Thông tin</a></li>
                                        <c:if test="${sessionScope.AuthenticationUser.role == 1}">
                                        <li> <a href="${pageContext.request.contextPath}/admin">Bảng quản trị</a></li>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.AuthenticationUser == null}">
                                    <li> <a href="${pageContext.request.contextPath}/auth?action=login">Đăng nhập</a></li>
                                    <li> <a href="${pageContext.request.contextPath}/auth?action=register">Đăng ký</a></li>
                                    </c:if>
                            </ul>
                        </div>

                    </div>
                    <c:if test="${sessionScope.AuthenticationUser != null}">
                        <div class="row mb-1 ms-0 me-0">
                            <div class="col-12 p-1 mb-2 pt-2">
                                <div class="text-extra-small text-primary">KHOÁ HỌC</div>
                            </div>
                            <div class="col-6 ps-1 pe-1">
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="#">Đang học</a>
                                    </li>
                                    <li>
                                        <a href="#">Chứng chỉ</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-6 pe-1 ps-1">
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="#">Wishlist</a>
                                    </li>
                                    <li>
                                        <a href="#">Đã học</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                    <div class="row mb-1 ms-0 me-0">
                        <div class="col-12 p-1 mb-3 pt-3">
                            <div class="separator-light"></div>
                        </div>
                        <div class="col-6 ps-1 pe-1">
                            <ul class="list-unstyled">
                                <li>
                                    <a href="#">
                                        <i data-cs-icon="help" class="me-2" data-cs-size="17"></i>
                                        <span class="align-middle">Trợ giúp</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i data-cs-icon="file-text" class="me-2" data-cs-size="17"></i>
                                        <span class="align-middle">Tài liệu</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <c:if test="${sessionScope.AuthenticationUser != null}">
                            <div class="col-6 pe-1 ps-1">
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="#">
                                            <i data-cs-icon="gear" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">Cài đặt</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/auth?action=logout">
                                            <i data-cs-icon="logout" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">Logout</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- User Menu End -->

            <!-- Icons Menu Start -->
            <ul class="list-unstyled list-inline text-center menu-icons">

                <li class="list-inline-item">
                    <a href="#" id="pinButton" class="pin-button">
                        <i data-cs-icon="lock-on" class="unpin" data-cs-size="18"></i>
                        <i data-cs-icon="lock-off" class="pin" data-cs-size="18"></i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a href="#" id="colorButton">
                        <i data-cs-icon="light-on" class="light" data-cs-size="18"></i>
                        <i data-cs-icon="light-off" class="dark" data-cs-size="18"></i>
                    </a>
                </li>
                <c:if test="${sessionScope.AuthenticationUser != null}">
                    <c:if test="${sessionScope.AuthenticationUser.wishlist != null}">
                        <li class="list-inline-item">
                            <a href="#" data-bs-toggle="dropdown" data-bs-target="#notifications" aria-haspopup="true" aria-expanded="false" class="notification-button">
                                <div class="position-relative d-inline-flex">
                                    <i data-cs-icon="heart" data-cs-size="18"></i>
                                    <span class="position-absolute notification-dot rounded-xl"></span>
                                </div>
                            </a>

                            <div class="dropdown-menu dropdown-menu-end wide notification-dropdown scroll-out" id="notifications">
                                <div class="scroll">
                                    <ul class="list-unstyled border-last-none">
                                        <c:forEach var="o" items="${sessionScope.AuthenticationUser.wishlist}">
                                            <li class="mb-3 pb-3 border-bottom border-separator-light d-flex">
                                                <img src="${o.course.thumbnail}" class="me-3 sw-4 sh-4 rounded-xl align-self-center" alt="..." />
                                                <div class="align-self-center">
                                                    <a href="#">${o.course.name}</a>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </c:if>
                </c:if>
            </ul>
            <!-- Icons Menu End -->

            <!-- Menu Start -->
            <div class="menu-container flex-grow-1">
                <ul id="menu" class="menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/home" data-href="#admin">
                            <i data-cs-icon="home" class="icon" data-cs-size="18"></i>
                            <span class="label">Trang chủ</span>
                        </a>

                    </li>
                    <c:if test="${sessionScope.AuthenticationUser.role == 1}">
                        <li>
                            <a href="./admin" data-href="#admin">
                                <i data-cs-icon="home" class="icon" data-cs-size="18"></i>
                                <span class="label">Bảng quản trị</span>
                            </a>

                        </li>
                    </c:if>
                    <li>
                        <a href="#course" data-href="#course">
                            <i data-cs-icon="screen" class="icon" data-cs-size="18"></i>
                            <span class="label">Khoá học</span>
                        </a>
                        <ul id="apps">
                            <li>
                                <a href="${pageContext.request.contextPath}/course/list">
                                    <span class="label">Danh sách khóa học</span>
                                </a>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/quiz" data-href="#quiz">
                            <i data-cs-icon="home" class="icon" data-cs-size="18"></i>
                            <span class="label">Quiz</span>
                        </a>

                    </li>
                    <li>
                        <a href="#teacher" data-href="#teacher">
                            <i data-cs-icon="book" class="icon" data-cs-size="18"></i>
                            <span class="label">Blog</span>
                        </a>
                        <ul>
                            <li>
                                <a href="/blog/list" data-href="#hot">
                                    <span class="label">HOT</span>
                                </a>

                            </li>
                        </ul>
                    </li>
                </ul>

            </div>
            <!-- Menu End -->

            <!-- Mobile Buttons Start -->
            <div class="mobile-buttons-container">
                <!-- Scrollspy Mobile Button Start -->
                <a href="#" id="scrollSpyButton" class="spy-button" data-bs-toggle="dropdown">
                    <i data-cs-icon="menu-dropdown"></i>
                </a>
                <!-- Scrollspy Mobile Button End -->

                <!-- Scrollspy Mobile Dropdown Start -->
                <div class="dropdown-menu dropdown-menu-end" id="scrollSpyDropdown"></div>
                <!-- Scrollspy Mobile Dropdown End -->

                <!-- Menu Button Start -->
                <a href="#" id="mobileMenuButton" class="menu-button">
                    <i data-cs-icon="menu"></i>
                </a>
                <!-- Menu Button End -->
            </div>
            <!-- Mobile Buttons End -->
        </div>
        <div class="nav-shadow"></div>
    </div>


    <!-- Layout Footer Start -->
    <footer>
        <div class="footer-content">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-sm-6">
                        <p class="mb-0 text-muted text-medium">Acorn 2021</p>
                    </div>
                    <div class="col-sm-6 d-none d-sm-block">
                        <ul class="breadcrumb pt-0 pe-0 mb-0 float-end">
                            <li class="breadcrumb-item mb-0 text-medium">
                                <a href="#" target="_blank" class="btn-link">Facebook</a>
                            </li>
                            <li class="breadcrumb-item mb-0 text-medium">
                                <a href="#" target="_blank" class="btn-link">Terms</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Layout Footer End -->
</div>
