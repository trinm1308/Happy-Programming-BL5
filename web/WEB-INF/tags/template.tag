<%-- 
    Document   : template
    Created on : Aug 13, 2021, 9:00:03 PM
    Author     : TrungNM
--%>

<%@tag description="Boostrap Template" pageEncoding="UTF-8"%>
<%@attribute name="title"%>
<!doctype html>
<html lang="en">
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
        <link rel="stylesheet" href="resources/css/vendor/bootstrap.min.css" />
        <link rel="stylesheet" href="resources/css/vendor/OverlayScrollbars.min.css" />
        <link rel="stylesheet" href="resources/css/vendor/select2.min.css" />
        <link rel="stylesheet" href="resources/css/vendor/select2-bootstrap4.min.css" />
        <link rel="stylesheet" href="resources/css/vendor/bootstrap-datepicker3.standalone.min.css" />

        <link href="css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
        <link href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
        <link href="themes/krajee-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/select2.min.css" />
        <link rel="stylesheet" href="css/select2-bootstrap-5-theme.min.css" />
        <link rel="stylesheet" href="css/custom.css" />
        <!-- Vendor Styles End -->
        <!-- Template Base Styles Start -->
        <link rel="stylesheet" href="resources/css/styles.css" />
        <!-- Template Base Styles End -->

        <link rel="stylesheet" href="resources/css/main.css" />
        <script src="resources/js/base/loader.js"></script>
    </head>
    <body>
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
                                        <li> <a href="/profile.jsp">Profile</a></li>
                                        <c:if test="${sessionScope.user.role==2}">
                                            <li> <a href="/admin.jsp">Admin Page</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.user.role!=2}">
                                            <li> <a href="RequestController?service=createRequest">Create Mentee Request</a></li>
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
                            <a href="/home.jsp" data-href="#admin">

                                <i data-cs-icon="home" class="icon" data-cs-size="18"></i>
                                <span class="label">Home</span>
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
                        <li>
                            <a href="SkillController?service=showSkill" data-href="#course">
                                <i data-cs-icon="screen" class="icon" data-cs-size="18"></i>
                                <span class="label">Skill List</span>
                            </a>
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

        <main class="py-5 main">
            <jsp:doBody/>
        </main>

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
        <script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
        <script src="resources/js/vendor/bootstrap.bundle.min.js"></script>
        <script src="resources/js/vendor/OverlayScrollbars.min.js"></script>
        <script src="resources/js/vendor/autoComplete.min.js"></script>
        <script src="resources/js/vendor/clamp.min.js"></script>
        <script src="resources/js/vendor/select2.full.min.js"></script>
        <script src="resources/js/vendor/singleimageupload.js"></script>
        <!-- Vendor Scripts End -->

        <!-- Template Base Scripts Start -->
        <script src="resources/font/CS-Line/csicons.min.js"></script>
        <script src="resources/js/base/helpers.js"></script>
        <script src="resources/js/base/globals.js"></script>
        <script src="resources/js/base/nav.js"></script>
        <script src="resources/js/base/search.js"></script>
        <script src="resources/js/base/settings.js"></script>
        <script src="resources/js/base/init.js"></script>
        <!-- Template Base Scripts End -->
        <!-- Page Specific Scripts Start -->
        <script src="resources/js/pages/profile.settings.js"></script>
        <script src="resources/js/common.js"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="js/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
        <script src="js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/star-rating.js" type="text/javascript"></script>
        <script src="themes/krajee-fas/theme.js" type="text/javascript"></script>
        <script src="js/select2.full.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
