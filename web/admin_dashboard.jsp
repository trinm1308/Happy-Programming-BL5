<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-footer="true">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <title>Happy Programming</title>
        <meta
            name="description"
            content="A table enhancing plug-in for the jQuery Javascript library, adding sorting, paging and filtering abilities to plain HTML tables with minimal effort."
            />
        <!-- Favicon Tags Start -->
        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="img/favicon/apple-touch-icon-57x57.png" />
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/favicon/apple-touch-icon-114x114.png" />
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/favicon/apple-touch-icon-72x72.png" />
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/favicon/apple-touch-icon-144x144.png" />
        <link rel="apple-touch-icon-precomposed" sizes="60x60" href="img/favicon/apple-touch-icon-60x60.png" />
        <link rel="apple-touch-icon-precomposed" sizes="120x120" href="img/favicon/apple-touch-icon-120x120.png" />
        <link rel="apple-touch-icon-precomposed" sizes="76x76" href="img/favicon/apple-touch-icon-76x76.png" />
        <link rel="apple-touch-icon-precomposed" sizes="152x152" href="img/favicon/apple-touch-icon-152x152.png" />
        <link rel="icon" type="image/png" href="img/favicon/favicon-196x196.png" sizes="196x196" />
        <link rel="icon" type="image/png" href="img/favicon/favicon-96x96.png" sizes="96x96" />
        <link rel="icon" type="image/png" href="img/favicon/favicon-32x32.png" sizes="32x32" />
        <link rel="icon" type="image/png" href="img/favicon/favicon-16x16.png" sizes="16x16" />
        <link rel="icon" type="image/png" href="img/favicon/favicon-128.png" sizes="128x128" />
        <meta name="application-name" content="&nbsp;" />
        <meta name="msapplication-TileColor" content="#FFFFFF" />
        <meta name="msapplication-TileImage" content="img/favicon/mstile-144x144.png" />
        <meta name="msapplication-square70x70logo" content="img/favicon/mstile-70x70.png" />
        <meta name="msapplication-square150x150logo" content="img/favicon/mstile-150x150.png" />
        <meta name="msapplication-wide310x150logo" content="img/favicon/mstile-310x150.png" />
        <meta name="msapplication-square310x310logo" content="img/favicon/mstile-310x310.png" />
        <!-- Favicon Tags End -->
        <!-- Font Tags Start -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="font/CS-Interface/style.css" />
        <!-- Font Tags End -->
        <!-- Vendor Styles Start -->
        <link rel="stylesheet" href="css/vendor/bootstrap.min.css" />
        <link rel="stylesheet" href="css/vendor/OverlayScrollbars.min.css" />
        <link rel="stylesheet" href="css/vendor/datatables.min.css" />
        <!-- Vendor Styles End -->
        <!-- Template Base Styles Start -->
        <link rel="stylesheet" href="css/styles.css" />
        <!-- Template Base Styles End -->

        <link rel="stylesheet" href="css/main.css" />
        <script src="js/base/loader.js"></script>
    </head>

    <body>
        <div id="root">
            <%@include file="header_new.jsp" %>

            <!--Insert code here-->
            <main>
                <div class="container">
                    <!-- Title and Top Buttons Start -->
                    <div class="page-title-container">
                        <div class="row">
                            <!-- Title Start -->
                            <div class="col-12 col-sm-6">
                                <h1 class="mb-0 pb-0 display-4" id="title">Admin Dashboard</h1>
                                <nav class="breadcrumb-container d-inline-block" aria-label="breadcrumb">
                                    <ul class="breadcrumb pt-0">
                                        <li class="breadcrumb-item"><a href="Dashboards.Default.html">Home</a></li>
                                        <li class="breadcrumb-item"><a href="Dashboards.html">Dashboards</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <!-- Title End -->
                        </div>
                    </div>
                    <!-- Title and Top Buttons End -->

                    <div class="row">
                        <div class="col-12 col-xl-6">
                            <!-- Sales & Stocks Charts Start -->
                            <div class="mb-5" data-title="Fancy Charts" data-intro="Some charts over here!" data-step="1">
                                <h2 class="small-title">Site Traffics</h2>
                                <div class="card mb-2 h-auto sh-xl-24">
                                    <div class="card-body">
                                        <div class="row g-0 h-100 chart-container">
                                            <!-- Contents for below are provided from js -->
                                            <div class="col-12 col-sm-auto d-flex flex-column justify-content-between custom-tooltip pe-0 pe-sm-4">
                                                <p class="heading title mb-1"></p>
                                                <div>
                                                    <div>
                                                        <div class="cta-2 text-primary value d-inline-block align-middle sw-4"></div>
                                                        <i class="icon d-inline-block align-middle text-primary" data-cs-size="15"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1 text"></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-auto">
                                                        <div class="cta-3 text-alternate">84</div>
                                                        <div class="text-small text-muted mb-1">THIS WEEK</div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="cta-3 text-alternate">792</div>
                                                        <div class="text-small text-muted mb-1">THIS MONTH</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm sh-17">
                                                <canvas id="largeLineChart1"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card h-auto sh-xl-24">
                                    <div class="card-body">
                                        <div class="row g-0 h-100 chart-container">
                                            <!-- Contents for below are provided from js -->
                                            <div class="col-12 col-sm-auto d-flex flex-column justify-content-between custom-tooltip pe-0 pe-sm-4">
                                                <p class="heading title"></p>
                                                <div>
                                                    <div>
                                                        <div class="cta-2 text-primary value d-inline-block align-middle sw-4"></div>
                                                        <i class="icon d-inline-block align-middle text-primary" data-cs-size="15"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1 text"></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-auto">
                                                        <div class="cta-3 text-alternate">84</div>
                                                        <div class="text-small text-muted mb-1">THIS WEEK</div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="cta-3 text-alternate">792</div>
                                                        <div class="text-small text-muted mb-1">THIS MONTH</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm sh-17">
                                                <canvas id="largeLineChart2"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Sales & Stocks Charts End -->

                            <!-- Stats Start -->
                            <h2 class="small-title">Requests Statistics</h2>
                            <div class="row gx-2">
                                <div class="col-12 p-0">
                                    <div class="glide glide-small" id="statsCarousel">
                                        <div class="glide__track" data-glide-el="track">
                                            <div class="glide__slides" style="display: flex;">
                                                <div class="glide__slide">
                                                    <div class="card mb-5 sh-20 hover-border-primary">
                                                        <div class="h-100 p-4 text-center align-items-center d-flex flex-column justify-content-between">
                                                            <div class="d-flex flex-column justify-content-center align-items-center sh-5 sw-5 rounded-xl bg-gradient-primary mb-2">
                                                                <i data-cs-icon="alarm" class="text-white"></i>
                                                            </div>
                                                            <p class="mb-0 lh-1">Pending Requests</p>
                                                            <p class="cta-3 mb-0 text-primary">${requestScope.requestCounts[0]}</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="glide__slide">
                                                    <div class="card mb-5 sh-20 hover-border-primary">
                                                        <div class="h-100 p-4 text-center align-items-center d-flex flex-column justify-content-between">
                                                            <div class="d-flex flex-column justify-content-center align-items-center sh-5 sw-5 rounded-xl bg-gradient-primary mb-2">
                                                                <i data-cs-icon="check-circle" class="text-white"></i>
                                                            </div>
                                                            <p class="mb-0 lh-1">Accepted Requests</p>
                                                            <p class="cta-3 mb-0 text-primary">${requestScope.requestCounts[1]}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="glide__slide">
                                                    <div class="card mb-5 sh-20 hover-border-primary">
                                                        <div class="h-100 p-4 text-center align-items-center d-flex flex-column justify-content-between">
                                                            <div class="d-flex flex-column justify-content-center align-items-center sh-5 sw-5 rounded-xl bg-gradient-primary mb-2">
                                                                <i data-cs-icon="arrow-bottom-left" class="text-white"></i>
                                                            </div>
                                                            <p class="mb-0 lh-1">Rejected Requests</p>
                                                            <p class="cta-3 mb-0 text-primary">${requestScope.requestCounts[2]}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Stats Start -->
                        </div>

                        <!-- Products Start -->
                        <div class="col-12 col-xl-6 mb-5">
                            <div class="d-flex justify-content-between">
                                <h2 class="small-title">New Mentors</h2>                                
                            </div>

                            <div class="scroll-out">
                                <div class="scroll-by-count" data-count="${requestScope.newMentors.size()}">
                                    <c:forEach items="${requestScope.newMentors}" var="mentor">
                                        <div class="card mb-2" data-title="Product Card" data-intro="Here is a product card with buttons!" data-step="2">
                                            <div class="row g-0 sh-12">
                                                <div class="col-auto" style="height: inherit">                                                    
                                                    <a href="RatingController?mentorId=${mentor.id}">
                                                        <img src=${mentor.ava ? mentor.ava : "img/profile/profile-10.jpg"} alt="user" class="card-img card-img-horizontal sw-13 sw-lg-15" />
                                                    </a>
                                                </div>
                                                <div class="col">
                                                    <div class="card-body pt-0 pb-0 h-100">
                                                        <div class="row g-0 h-100 align-content-center">
                                                            <div class="col-12 col-md-7 d-flex flex-column mb-2 mb-md-0 position-static">
                                                                <a href="RatingController?mentorId=${mentor.id}">${mentor.fullName}</a>
                                                                <div class="text-small text-muted text-truncate">${mentor.address}</div>
                                                            </div>
                                                            <div class="col-12 col-md-5 d-flex align-items-center justify-content-md-end">                                                                
                                                                <a href="RatingController?mentorId=${mentor.id}" class="btn btn-sm btn-icon btn-icon-start btn-outline-primary ms-1" type="button">
                                                                    <i data-cs-icon="edit-square" data-cs-size="15"></i>
                                                                    <span class="d-none d-xxl-inline-block">View Profile</span>
                                                                </a>                                                                                        
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- Products End -->
                    </div>

                    <div class="row">
                        <!-- Logs Start -->
                        <div class="col-lg-6 mb-5">
                            <h2 class="small-title">Recent Requests</h2>
                            <div class="card sh-40 h-lg-100-card">
                                <div class="card-body mb-n2 scroll-out h-100">
                                    <div class="scroll h-100">
                                        <c:forEach items="${requestScope.requests}" var="rq">
                                            <div class="row g-0 mb-2">
                                                <div class="col-auto">
                                                    <div class="sw-3 d-inline-block d-flex justify-content-start align-items-center h-100">
                                                        <div class="sh-3">
                                                            <c:choose>
                                                                <c:when test="${rq.status==0}"><i data-cs-icon="circle" class="text-primary align-top"></i></c:when>
                                                                <c:when test="${rq.status==1}"><i data-cs-icon="square" class="text-secondary align-top"></i></c:when>
                                                                <c:when test="${rq.status==2}"><i data-cs-icon="triangle" class="text-warning align-top"></i></c:when>
                                                            </c:choose>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="card-body d-flex flex-column pt-0 pb-0 ps-3 pe-4 h-100 justify-content-center">
                                                        <div class="d-flex flex-column">
                                                            <div class="text-alternate mt-n1 lh-1-25">
                                                                <c:choose>
                                                                    <c:when test="${rq.status==0}"><b>${rq.menteeName}</b> sent mentor <b>${rq.mentorName}</b> a request</c:when>
                                                                    <c:when test="${rq.status==1}">Mentor <b>${rq.mentorName}</b> <i style="color: #00cc00">accepted</i> <b>${rq.menteeName}</b>'s request</c:when>
                                                                    <c:when test="${rq.status==2}">Mentor <b>${rq.mentorName}</b> <i style="color: red">rejected</i> <b>${rq.menteeName}</b>'s request</c:when>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <div class="d-inline-block d-flex justify-content-end align-items-center h-100">
                                                        <div class="text-muted ms-2 mt-n1 lh-1-25">${rq.requestDate}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Logs End -->

                        <!-- Categories Start -->
                        <div class="col-lg-6 mb-5">
                            <div class="d-flex justify-content-between">
                                <h2 class="small-title">Skills Available</h2>
                                <button class="btn btn-icon btn-icon-end btn-xs btn-background-alternate p-0 text-small" type="button">
                                    <span class="align-bottom">View All</span>
                                    <i data-cs-icon="chevron-right" class="align-middle" data-cs-size="12"></i>
                                </button>
                            </div>
                            <div class="row g-2">
                                <c:forEach items="${requestScope.skills}" var="skill">
                                    <div class="col-6 col-xl-4 sh-19" data-title="More Cards" data-intro="Category card with an icon!" data-step="3">
                                        <div class="card h-100 hover-scale-up">
                                            <a class="card-body text-center" href="#">
                                                <i data-cs-icon="c" class="text-primary"></i>
                                                <p class="heading mt-3 text-body">${skill.name}</p>
                                                <div class="text-extra-small fw-medium text-muted">Programming Language</div>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- Categories End -->
                    </div>

                    <!-- Banners Start -->

                    <!-- Banners End -->

                </div>
            </main>

            <!-- Layout Footer Start -->
            <%@include file="footer.jsp" %>
            <!-- Layout Footer End -->
        </div>


        <%@include file="theme_settings.jsp" %>

        <!-- Vendor Scripts Start -->
        <script src="js/vendor/jquery-3.5.1.min.js"></script>
        <script src="js/vendor/bootstrap.bundle.min.js"></script>
        <script src="js/vendor/OverlayScrollbars.min.js"></script>
        <script src="js/vendor/autoComplete.min.js"></script>
        <script src="js/vendor/clamp.min.js"></script>
        <script src="js/vendor/Chart.bundle.min.js"></script>
        <script src="js/vendor/chartjs-plugin-datalabels.js"></script>
        <script src="js/vendor/chartjs-plugin-rounded-bar.min.js"></script>
        <script src="js/vendor/glide.min.js"></script>
        <script src="js/vendor/intro.min.js"></script>
        <script src="js/vendor/select2.full.min.js"></script>
        <script src="js/vendor/plyr.min.js"></script>
        <!-- Vendor Scripts End -->

        <!-- Template Base Scripts Start -->
        <script src="font/CS-Line/csicons.min.js"></script>
        <script src="js/base/helpers.js"></script>
        <script src="js/base/globals.js"></script>
        <c:if test="${sessionScope.user!=null}">
            <script src="js/base/nav.js"></script>
        </c:if>
        <script src="js/base/search.js"></script>
        <script src="js/base/settings.js"></script>
        <script src="js/base/init.js"></script>
        <!-- Template Base Scripts End -->
        <!-- Page Specific Scripts Start -->
        <script src="js/cs/glide.custom.js"></script>
        <script src="js/cs/charts.extend.js"></script>
        <script src="js/pages/dashboard.default.js"></script>
        <script src="js/common.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Page Specific Scripts End -->
    </body>
</html>
