<%@page import="context.DBConnect"%>
<%@page import="dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="resources/css/vendor/bootstrap.min.css" />
        <link rel="stylesheet" href="resources/css/vendor/OverlayScrollbars.min.css" />
        <link rel="stylesheet" href="resources/css/vendor/select2.min.css" />
        <link rel="stylesheet" href="resources/css/vendor/select2-bootstrap4.min.css" />
        <link rel="stylesheet" href="resources/css/vendor/bootstrap-datepicker3.standalone.min.css" />
        <!-- Vendor Styles End -->
        <!-- Template Base Styles Start -->
        <link rel="stylesheet" href="resources/css/styles.css" />
        <!-- Template Base Styles End -->

        <link rel="stylesheet" href="resources/css/main.css" />
        <script src="resources/js/base/loader.js"></script>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <%            
            int id = Integer.parseInt(request.getParameter("id"));
            UserDAO uc = new UserDAO(new DBConnect());
            request.setAttribute("user", uc.getUserById(id));
            
        %>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-auto d-none d-lg-flex">
                    </div>
                    <div class="col">
                        <div class="card mb-5">
                            <div class="card-body">
                                <form class="d-flex flex-column mb-4" action="UploadController" method="POST" id="frmUpload" enctype="multipart/form-data">
                                    <div class="mb-3 mx-auto position-relative" id="singleImageUploadExample">
                                        <img
                                                src="${user.ava}"
                                                alt="user"
                                                name="ava"
                                                class="rounded-xl border border-separator-light border-4 sw-12 sh-12"
                                                id="contactThumbModal"
                                                />
                                    </div>
                                </form>
                                <form id="profileForm" action="ProfileController?action=updateProfile" method="POST" class="d-flex flex-column mb-4">
                                    <c:if test="${fileName == null && sessionScope.user.ava != null}">
                                        <input type="hidden" name="avatar" value="${sessionScope.user.ava}"/>
                                    </c:if>
                                    <c:if test="${fileName != null}">
                                        <input type="hidden" name="avatar" value="${fileName}"/>
                                    </c:if>
                                    
<!--                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Email</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <input type="email" name="email" class="form-control" value="${sessionScope.user.email}" disabled />
                                        </div>
                                    </div>-->

                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Name</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">${user.fullName}</label>
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Gender</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <c:if test="${sessionScope.user.gender}">
                                                <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Male</label>
                                            </c:if>
                                            <c:if test="${!sessionScope.user.gender}">
                                                 <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Female</label>
                                            </c:if>
                                           
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Phone</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">${user.phone}</label>
                                        </div>
                                    </div>


                                    <div class="mb-3 row">
                                        <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">Address</label>
                                        <div class="col-sm-8 col-md-9 col-lg-10">
                                            <label class="col-lg-2 col-md-3 col-sm-4 col-form-label">${user.address}</label>
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
        <!-- Page Specific Scripts End -->
    </body>
</html>