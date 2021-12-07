<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="root">

    <%
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <div id="nav" class="nav-container d-flex">
        <div class="nav-content d-flex">
            <!-- Logo Start -->
            <div class="logo position-relative">
                <a href="/home">
                    <!-- Logo can be added directly -->
                    <!-- <img src="img/logo/logo-white.svg" alt="logo" /> -->

                    <!-- Or added via css to provide different ones for different color themes -->
                    <div class="img"></div>
                </a>
            </div>
            <!-- Logo End -->

            <!-- Language Switch Start -->

            <!-- Language Switch End -->

            <!-- User Menu Start -->
            <div class="user-container d-flex">
                <c:if test="${sessionScope.user!=null}">
                    <a href="#" class="d-flex user position-relative" data-bs-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        <img class="profile" alt="profile" src="images/${sessionScope.user.ava}" />
                        <div class="name">Nguyễn Minh Đức</div>

                    </a>
                    <div class="dropdown-menu dropdown-menu-end user-menu wide">
                        <div class="row mb-3 ms-0 me-0">
                            <div class="col-12 ps-1 mb-2">
                                <div class="text-extra-small text-primary">Account</div>
                            </div>
                            <div class="col-6 ps-1 pe-1">
                                <ul class="list-unstyled">
                                    <li> <a href="/profile.jsp?action=general">Profile</a></li>
                                        <c:if test="${sessionScope.user.role==2}">
                                        <li> <a href="/admin.jsp">Admin Page</a></li>
                                        </c:if>

                                </ul>
                            </div>

                        </div>
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
                                        <a href="changepass.jsp">
                                            <i data-cs-icon="file-text" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">Change pass</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-6 pe-1 ps-1">
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="#">
                                            <i data-cs-icon="gear" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">Cài đặt</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="LogoutController">
                                            <i data-cs-icon="logout" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">Logout</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </c:if>
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

                                <li class="mb-3 pb-3 border-bottom border-separator-light d-flex">
                                    <img src="" class="me-3 sw-4 sh-4 rounded-xl align-self-center" alt="..." />
                                    <div class="align-self-center">
                                        <a href="#"></a>
                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>
                </li>

            </ul>
            <!-- Icons Menu End -->

            <!-- Menu Start -->
            <div class="menu-container flex-grow-1">
                <ul id="menu" class="menu">
                    <li>
                        <a href="/home" data-href="#admin">

                            <i data-cs-icon="home" class="icon" data-cs-size="18"></i>
                            <span class="label">Homepage</span>
                        </a>

                    </li>
                    <c:if test="${sessionScope.user.role==2}">
                        <li>
                            <a href="./admin" data-href="#admin">
                                <i data-cs-icon="home" class="icon" data-cs-size="18"></i>
                                <span class="label">Admin Board</span>
                            </a>

                        </li>
                    </c:if>
                    <li>
                        <a href="#course" data-href="#course">
                            <i data-cs-icon="screen" class="icon" data-cs-size="18"></i>
                            <span class="label">Mentor List</span>
                        </a>
                        <ul id="apps">
                            <li>
                                <a href="MentorListController">
                                    <span class="label">Mentor List</span>
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
<a href="/home.jsp" data-href="#admin">
