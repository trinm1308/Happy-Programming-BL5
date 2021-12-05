<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" data-footer="true" data-override='{"attributes":{"layout": "boxed"}}'>
    <c:set var="context" value=""/>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <title>Thông tin cá nhân</title>
        <meta name="description" content="Settings Profile Page" />
        <!-- Favicon Tags Start -->
        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/img/favicon/apple-touch-icon-57x57.png" />
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/img/favicon/apple-touch-icon-114x114.png" />
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/img/favicon/apple-touch-icon-72x72.png" />
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/img/favicon/apple-touch-icon-144x144.png" />
        <link rel="apple-touch-icon-precomposed" sizes="60x60" href="/img/favicon/apple-touch-icon-60x60.png" />
        <link rel="apple-touch-icon-precomposed" sizes="120x120" href="/img/favicon/apple-touch-icon-120x120.png" />
        <link rel="apple-touch-icon-precomposed" sizes="76x76" href="/img/favicon/apple-touch-icon-76x76.png" />
        <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/img/favicon/apple-touch-icon-152x152.png" />
        <link rel="icon" type="image/png" href="/img/favicon/favicon-196x196.png" sizes="196x196" />
        <link rel="icon" type="image/png" href="/img/favicon/favicon-96x96.png" sizes="96x96" />
        <link rel="icon" type="image/png" href="/img/favicon/favicon-32x32.png" sizes="32x32" />
        <link rel="icon" type="image/png" href="/img/favicon/favicon-16x16.png" sizes="16x16" />
        <link rel="icon" type="image/png" href="/img/favicon/favicon-128.png" sizes="128x128" />
        <meta name="application-name" content="&nbsp;" />
        <meta name="msapplication-TileColor" content="#FFFFFF" />
        <meta name="msapplication-TileImage" content="/img/favicon/mstile-144x144.png" />
        <meta name="msapplication-square70x70logo" content="/img/favicon/mstile-70x70.png" />
        <meta name="msapplication-square150x150logo" content="/img/favicon/mstile-150x150.png" />
        <meta name="msapplication-wide310x150logo" content="/img/favicon/mstile-310x150.png" />
        <meta name="msapplication-square310x310logo" content="/img/favicon/mstile-310x310.png" />
        <!-- Favicon Tags End -->
        <!-- Font Tags Start -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="/font/CS-Interface/style.css" />
        <!-- Font Tags End -->
        <!-- Vendor Styles Start -->
        <link rel="stylesheet" href="/resources/css/vendor/bootstrap.min.css" />
        <link rel="stylesheet" href="/resources/css/vendor/OverlayScrollbars.min.css" />
        <link rel="stylesheet" href="/resources/css/vendor/select2.min.css" />
        <link rel="stylesheet" href="/resources/css/vendor/select2-bootstrap4.min.css" />
        <link rel="stylesheet" href="/resources/css/vendor/bootstrap-datepicker3.standalone.min.css" />
        <!-- Vendor Styles End -->
        <!-- Template Base Styles Start -->
        <link rel="stylesheet" href="/resources/css/styles.css" />
        <!-- Template Base Styles End -->

        <link rel="stylesheet" href="/resources/css/main.css" />
        <script src="/resources/js/base/loader.js"></script>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <main>
            <div class="container">
                <%
                    //response.sendRedirect("UserController?action=getProfile");
                %>
                <div class="row">
                    <div class="col-auto d-none d-lg-flex">
                        <div class="nav flex-column sw-25 mt-n2" id="settingsColumn">
                            <!-- Content of this will be moved from #settingsMoveContent div based on the responsive breakpoint.  -->
                        </div>
                    </div>

                    <div class="col">
                        <!-- Title and Top Buttons Start -->
                        <div class="page-title-container">
                            <div class="row">
                                <!-- Title Start -->
                                <div class="col">
                                    <h1 class="mb-0 pb-0 display-4" id="title">Thông tin tài khoản</h1>
                                    <nav class="breadcrumb-container d-inline-block" aria-label="breadcrumb">
                                        <ul class="breadcrumb pt-0">
                                            <li class="breadcrumb-item"><a href="/home">Trang chủ</a></li>

                                            <li class="breadcrumb-item"><a href="/profile">Thông tin tài khoản</a></li>
                                        </ul>
                                    </nav>
                                </div>
                                <!-- Title End -->

                                <!-- Top Buttons Start -->
                                <div class="col-12 col-sm-auto d-flex align-items-start justify-content-end d-block d-lg-none">
                                    <button type="button" class="btn btn-icon btn-icon-start btn-outline-primary w-100 w-sm-auto" data-bs-toggle="dropdown">
                                        <i data-cs-icon="gear"></i>
                                        <span>Cài đặt</span>
                                    </button>
                                    <!-- Content of below will be moved to #settingsColumn or back in here based on the data-move-breakpoint attribute below -->
                                    <!-- Content will be here if the screen size is smaller than lg -->

                                    <!-- In Page Menu Start -->
                                    <div
                                        class="dropdown-menu dropdown-menu-end sw-25 py-3 px-4"
                                        id="settingsMoveContent"
                                        data-move-target="#settingsColumn"
                                        data-move-breakpoint="lg"
                                        >
                                        <div class="mb-2">
                                            <a class="nav-link active px-0" href="#">
                                                <i data-cs-icon="activity" class="me-2" data-cs-size="17"></i>
                                                <span class="align-middle">Thông tin cá nhân</span>
                                            </a>
                                            <div>
                                                <a class="nav-link active py-1 my-1 px-0" href="#">
                                                    <i class="me-2 sw-2 d-inline-block"></i>
                                                    <span class="align-middle">Cá nhân</span>
                                                </a>
                                                <a class="nav-link py-1 my-1 px-0" href="#">
                                                    <i class="me-2 sw-2 d-inline-block"></i>
                                                    <span class="align-middle">Bạn bè</span>
                                                </a>
                                                <a class="nav-link py-1 my-1 px-0" href="#">
                                                    <i class="me-2 sw-2 d-inline-block"></i>
                                                    <span class="align-middle">Tài khoản</span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="mb-2">
                                            <a class="nav-link px-0" href="#">
                                                <i data-cs-icon="credit-card" class="me-2" data-cs-size="17"></i>
                                                <span class="align-middle">Thanh toán</span>
                                            </a>
                                            <div>
                                                <a class="nav-link py-1 my-1 px-0" href="#">
                                                    <i class="me-2 sw-2 d-inline-block"></i>
                                                    <span class="align-middle">Phương thức</span>
                                                </a>
                                                <a class="nav-link py-1 my-1 px-0" href="#">
                                                    <i class="me-2 sw-2 d-inline-block"></i>
                                                    <span class="align-middle">Hoá đơn</span>
                                                </a>

                                            </div>
                                        </div>
                                        <div class="mb-2">
                                            <a class="nav-link px-0" href="profile?action=chgpass">
                                                <i data-cs-icon="shield" class="me-2" data-cs-size="17"></i>
                                                <span class="align-middle">Bảo mật</span>
                                            </a>
                                            <div>



                                            </div>
                                        </div>
                                        <div class="mb-2">
                                            <a class="nav-link px-0" href="#">
                                                <i data-cs-icon="notification" class="me-2" data-cs-size="17"></i>
                                                <span class="align-middle">Thông báo</span>
                                            </a>
                                        </div>
                                        <div class="mb-2">
                                            <a class="nav-link px-0" href="#">
                                                <i data-cs-icon="tablet" class="me-2" data-cs-size="17"></i>
                                                <span class="align-middle">Ứng dụng</span>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- In Page Menu End -->
                                </div>
                                <!-- Top Buttons End -->
                            </div>
                        </div>
                        <!-- Title and Top Buttons End -->

                        <!-- Public Info Start -->
                        <h2 class="small-title">Cập nhật thông tin </h2>
                        <div class="card mb-5">
                            <div class="card-body">
                                <form id="profileForm" class="d-flex flex-column mb-4">
                                    <div class="mb-3 mx-auto position-relative" id="singleImageUploadExample">
                                        <img
                                            src="img/profile/profile-9.jpg"
                                            alt="user"
                                            class="rounded-xl border border-separator-light border-4 sw-12 sh-12"
                                            id="contactThumbModal"
                                            />
                                        <button class="btn btn-sm btn-icon btn-icon-only btn-separator-light position-absolute rounded-xl e-0 b-0" type="button">
                                            <i data-cs-icon="upload"></i>
                                        </button>
                                        <input class="file-upload d-none" type="file" accept="image/*" />
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Email</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <input type="email" name="email" class="form-control" value="${sessionScope.user.email}" disabled />
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Name</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <input type="text" class="form-control" name="name" value="${sessionScope.user.fullName}" />
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Gender</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <select class="select-single-no-search" name="gender" data-width="100%" id="genderSelect" value="sessionScope.user.gender">

                                                <option value="1">Female</option>
                                                <option value="2" selected>Male</option>
                                                <option value="3">Other</option>

                                            </select>
                                        </div>
                                    </div>

<!--                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Birthday</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <input type="text" name="dob" class="form-control date-picker-close" id="birthday" value="sessionScope.user.fullName" />
                                        </div>
                                    </div>-->

                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Phone</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <input type="text" name="phone" class="form-control" value="${sessionScope.user.phone}"/>
                                        </div>
                                    </div>


                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Address</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <input type="text" name="address" class="form-control" value="${sessionScope.user.address}"/>
                                        </div>
                                    </div>

                                    <div class="mb-3 row mt-5">
                                        <div class="col-sm-8 col-md-9 col-lg-10 ms-auto">
                                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                                            <a style="margin-left: 10px" id="message"></a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Public Info End -->




                    </div>
                </div>
            </div>
        </main>

        <!-- Search Modal Start -->
        <div class="modal fade modal-under-nav modal-search modal-close-out" id="searchPagesModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header border-0 p-0">
                        <button type="button" class="btn-close btn btn-icon btn-icon-only btn-foreground" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body ps-5 pe-5 pb-0 border-0">
                        <input id="searchPagesInput" class="form-control form-control-xl borderless ps-0 pe-0 mb-1 auto-complete" type="text" autocomplete="off" />
                    </div>
                    <div class="modal-footer border-top justify-content-start ps-5 pe-5 pb-3 pt-3 border-0">
                        <span class="text-alternate d-inline-block m-0 me-3">
                            <i data-cs-icon="arrow-bottom" data-cs-size="15" class="text-alternate align-middle me-1"></i>
                            <span class="align-middle text-medium">Navigate</span>
                        </span>
                        <span class="text-alternate d-inline-block m-0 me-3">
                            <i data-cs-icon="arrow-bottom-left" data-cs-size="15" class="text-alternate align-middle me-1"></i>
                            <span class="align-middle text-medium">Select</span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Search Modal End -->

        <!-- Vendor Scripts Start -->
        <script src="/resources/js/vendor/jquery-3.5.1.min.js"></script>
        <script src="/resources/js/vendor/bootstrap.bundle.min.js"></script>
        <script src="/resources/js/vendor/OverlayScrollbars.min.js"></script>
        <script src="/resources/js/vendor/autoComplete.min.js"></script>
        <script src="/resources/js/vendor/clamp.min.js"></script>
        <script src="/resources/js/vendor/movecontent.js"></script>
        <script src="/resources/js/vendor/select2.full.min.js"></script>
        <script src="/resources/js/vendor/datepicker/bootstrap-datepicker.min.js"></script>
        <!-- Vendor Scripts End -->

        <!-- Template Base Scripts Start -->
        <script src="/resources/font/CS-Line/csicons.min.js"></script>
        <script src="/resources/js/base/helpers.js"></script>
        <script src="/resources/js/base/globals.js"></script>
        <script src="/resources/js/base/nav.js"></script>
        <script src="/resources/js/base/search.js"></script>
        <script src="/resources/js/base/settings.js"></script>
        <script src="/resources/js/base/init.js"></script>
        <!-- Template Base Scripts End -->
        <!-- Page Specific Scripts Start -->
        <script src="/resources/js/pages/profile.settings.js"></script>
        <script src="/resources/js/common.js"></script>
        <script src="/resources/js/scripts.js"></script>
        <!-- Page Specific Scripts End -->
    </body>
</html>
