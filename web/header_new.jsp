<%-- 
    Document   : header_new
    Created on : Dec 3, 2021, 10:05:39 AM
    Author     : Tri
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <body>
        <div id="nav" class="nav-container d-flex">
            <div class="nav-content d-flex">
                <!-- Logo Start -->
                <div class="logo position-relative">
                    <a href="/HappyProgramming">
                        <!-- Logo can be added directly -->
                        <!-- <img src="img/logo/logo-white.svg" alt="logo" /> -->
                        <h1>Happy Programming</h1>
                        <!-- Or added via css to provide different ones for different color themes -->
                        <!--<div class="img"></div>-->
                    </a>
                </div>
                <!-- Logo End -->

                <!-- User Menu Start -->
                <c:if test="${sessionScope.user!=null}">
                    <div class="user-container d-flex">
                        <a href="#" class="d-flex user position-relative" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="profile" alt="profile" src="img/profile/profile-9.jpg" />
                            <div class="name">${sessionScope.user.fullName}</div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end user-menu wide">
                            <div class="row mb-3 ms-0 me-0">
                                <div class="col-12 ps-1 mb-2">
                                    <div class="text-extra-small text-primary">ACCOUNT</div>
                                </div>
                                <div class="col-12 ps-1 pe-1">
                                    <ul class="list-unstyled">
                                        <li>
                                            <a href="#">User Info</a>
                                        </li>
                                        <li>
                                            <a href="#">Preferences</a>
                                        </li>
                                        <li>
                                            <a href="#">Calendar</a>
                                        </li>
                                    </ul>
                                </div>                              
                            </div>
                            <div class="row mb-1 ms-0 me-0">
                                <div class="col-12 p-1 mb-3 pt-3">
                                    <div class="separator-light"></div>
                                </div>
                                <div class="col-12 pe-1 ps-1">
                                    <ul class="list-unstyled">                                   
                                        <li>
                                            <a href="#">
                                                <i data-cs-icon="logout" class="me-2" data-cs-size="17"></i>
                                                <span class="align-middle">Logout</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.user==null}">
                    <div class="user-container d-flex">
                        <a href="LoginController" style="color: var(--light-text)">                            
                            <div class="name">Login</div>
                        </a>
                        <div style="text-align: center;width: 30px"><a href="#" style="color: var(--light-text)">or</a></div>
                        <a href="signup.jsp" style="color: var(--light-text)">                            
                            <div class="name">Register</div>
                        </a>
                    </div>
                </c:if>
                <!-- User Menu End -->

                <!-- Icons Menu Start -->

                <!-- Icons Menu End -->

                <!-- Menu Start -->
                <div class="menu-container flex-grow-1">
                    <c:if test="${sessionScope.user==null}"></c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <ul id="menu" class="menu">                        
                            <li>
                                <a href="/HappyProgramming" data-href="Dashboards.html">
                                    <i data-cs-icon="home" class="icon" data-cs-size="18"></i>
                                    <span class="label">
                                        <c:choose>
                                            <c:when test="${sessionScope.user.role==0}">Mentor Actions</c:when>
                                            <c:when test="${sessionScope.user.role==1}">Mentee Actions</c:when>
                                            <c:when test="${sessionScope.user.role==2}">Admin Actions</c:when>
                                        </c:choose>
                                    </span>
                                </a>
                                <c:choose>
                                    <c:when test="${sessionScope.user.role==0}">
                                        <ul id="dashboards">
                                            <li>
                                                <a href="Dashboards.Default.html">
                                                    <span class="label">Mentor Action #1</span>
                                                </a>
                                            </li>                                            
                                        </ul>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role==1}">
                                        <ul id="dashboards">
                                            <li>
                                                <a href="Dashboards.Default.html">
                                                    <span class="label">Mentee Action #1</span>
                                                </a>
                                            </li>                                            
                                        </ul>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role==2}">
                                        <ul id="dashboards">
                                            <li>
                                                <a href="AdminDashboardController">
                                                    <span class="label">Admin Dashboard</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="AdminMentorList">
                                                    <span class="label">Mentor List</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </c:when>
                                </c:choose>
                            </li>
                        </ul>
                    </c:if>
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
    </body>
</html>
