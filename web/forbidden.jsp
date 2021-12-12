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
            <main style="padding-right: 0">
                <!-- Background Start -->
                <div class="fixed-background"></div>
                <!-- Background End -->

                <div class="container-fluid p-0 h-100 position-relative">
                    <div class="row g-0 h-100">
                        <!-- Left Side Start -->
                        <div class="offset-0 col-12 d-none d-lg-flex offset-md-1 col-lg h-lg-100"></div>
                        <!-- Left Side End -->

                        <!-- Right Side Start -->
                        <div class="col-12 col-lg-auto h-100 pb-4 px-4 pt-0 p-lg-0">
                            <div class="sw-lg-80 min-h-100 bg-foreground d-flex justify-content-center align-items-center shadow-deep py-5 full-page-content-right-border">
                                <div class="sw-lg-60 px-5">
                                    <div class="sh-11">
                                        <a href="/HappyProgramming">
                                            <!-- Logo can be added directly -->
                                            <!-- <img src="img/logo/logo-white.svg" alt="logo" /> -->
                                            <h1>Happy Programming</h1>
                                            <!-- Or added via css to provide different ones for different color themes -->
                                            <!--<div class="img"></div>-->
                                        </a>
                                    </div>
                                    <div class="mb-5">
                                        <h2 class="cta-1 mb-0 text-primary">Forbidden Resources</h2>
                                        <h2 class="display-2 text-primary">Error 403</h2>
                                    </div>
                                    <div class="mb-5">
                                        <p class="h6">It looks like the page you are looking for is not available.</p>
                                        <p class="h6">If you think that is a mistake, please contact us.</p>
                                    </div>
                                    <div>
                                        <a href="/HappyProgramming" class="btn btn-icon btn-icon-start btn-primary">
                                            <i data-cs-icon="arrow-left"></i>
                                            <span>Back to Home</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Right Side End -->
                    </div>
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
        <script src="js/vendor/bootstrap-submenu.js"></script>
        <script src="js/vendor/mousetrap.min.js"></script>
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

        <script src="js/common.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Page Specific Scripts End -->
    </body>
</html>
