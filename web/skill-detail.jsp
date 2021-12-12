
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Skill"%>
<%@page import="dao.SkillDao"%>
<%@page import="context.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="entity.Request"%>
<%@page import="entity.User"%>
<%@page import="dao.RequestDao"%>
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
        <link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/css/font-awesome.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/fonts/FontAwesome.otf">
        <link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/fonts/fontawesome-webfont.eot">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/fonts/fontawesome-webfont.svg">
        <link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/fonts/fontawesome-webfont.ttf">
        <link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/fonts/fontawesome-webfont.woff">
        <!-- Vendor Styles End -->
        <!-- Template Base Styles Start -->
        <link rel="stylesheet" href="resources/css/styles.css" />
        <!-- Template Base Styles End -->

        <link rel="stylesheet" href="resources/css/main.css" />
        <script src="resources/js/base/loader.js"></script>
    </head>

    <body>
        <main>
            <%
                DBConnect dc = new DBConnect();
                SkillDao dao = new SkillDao(dc);
                String skillId = request.getParameter("id");
                List<Skill> skillList = dao.getSkillList();
                Skill skillDetail = dao.getSkill(Integer.valueOf(skillId));

            %>
            <%@include file="header.jsp" %>
            <div class="container" style="max-width: 1340px;">
                <div class="row">
                    <div class="col-auto d-none d-lg-flex">
                    </div>
                    <div class="col">
                        <div class="page-title-container">
                            <div class="row g-0">
                                <!-- Title Start -->
                                <div class="col-auto mb-3 mb-md-0 me-auto">
                                    <div class="w-auto sw-md-30">
                                        <a href="#" class="muted-link pb-1 d-inline-block breadcrumb-back">
                                            <i data-cs-icon="chevron-left" data-cs-size="13"></i>
                                            <span class="text-small align-middle">Home</span>
                                        </a>
                                        <h1 class="mb-0 pb-0 display-4" id="title">Skill Detail</h1>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-xl-6 mb-n5">
                                <div class="mb-5">
                                    <!--<h2 class="small-title">Skill List</h2>-->
                                    <!-- Basic Start -->
                                    <section class="scroll-section" id="basic">
                                        <h2 class="small-title">Basic</h2>
                                        <div class="card mb-5">
                                            <a href="#" class="lightbox">
                                                <img src="images/<%=skillDetail.getImage()%>" class="card-img-top sh-50" alt="card image" />
                                            </a>
                                            <div class="card-body"><%=skillDetail.getContent()%>
                                            </div>
                                        </div>
                                    </section>
                                    <div class="col-12 col-sm-6 col-md-auto d-flex align-items-end justify-content-end mb-2 mb-sm-0 order-sm-3">
                                        <a href="RequestController?service=createRequest"
                                            id="btnAdd"
                                            class="btn btn-outline-primary btn-icon btn-icon-start ms-0 ms-sm-1 w-100 w-md-auto"
                                            >
                                            <i data-cs-icon="plus"></i>
                                            <span>Add Mentee request</span>
                                        </a>
                                    </div>
                                    <!-- Basic End -->

                                </div>
                                <!-- History End -->

                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-2 bg-transparent no-shadow d-none d-md-block">
                                    <div class="card-body pt-0 pb-0 sh-3">
                                        <div class="row g-0 h-100 align-content-center">
                                            <div class="col-12 col-md-2 d-flex align-items-center mb-2 mb-md-0 text-muted text-small">ID</div>
                                            <div class="col-6 col-md-3 d-flex align-items-center text-alternate text-medium text-muted text-small">NAME</div>
                                            <div class="col-6 col-md-2 d-flex align-items-center text-alternate text-medium text-muted text-small">DESCRIPTION</div>
                                        </div>
                                    </div>
                                </div>
                                <div id="checkboxTable">
                                    <%                                        for (Skill item : skillList) {
                                    %>
                                    <div class="card mb-2">
                                        <div class="card-body pt-0 pb-0 sh-21 sh-md-8">
                                            <div class="row g-0 h-100 align-content-center">
                                                <div class="col-11 col-md-2 d-flex flex-column justify-content-center mb-2 mb-md-0 order-1 order-md-1 h-md-100 position-relative">
                                                    <div class="text-muted text-small d-md-none">Id</div>
                                                    <a href="SkillController?service=showDetail&id=<%=item.getId()%>" class="text-truncate h-100 d-flex align-items-center"><%=item.getId()%></a>
                                                </div>
                                                <div class="col-6 col-md-3 d-flex flex-column justify-content-center mb-2 mb-md-0 order-3 order-md-2">
                                                    <!--<div class="text-muted text-small d-md-none"><%=item.getName()%></div>-->
                                                    <a href="SkillController?service=showDetail&id=<%=item.getId()%>" class="text-truncate h-100 d-flex align-items-center"><%=item.getName()%></a>

                                                </div>
                                                <div class="col-6 col-md-2 d-flex flex-column justify-content-center mb-2 mb-md-0 order-4 order-md-3">
                                                    <div class="text-muted text-small d-md-none"></div>
                                                    <div class="text-alternate">
                                                        <span>
                                                            <!--<span class="text-small">$</span>-->
                                                            <%=item.getStatus()%>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Title and Top Buttons End -->
                </div>
            </div>
        </div>
    </main>

    <!-- Search Modal End -->

    <!-- Vendor Scripts Start -->
    <script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
    <script src="resources/js/vendor/bootstrap.bundle.min.js"></script>
    <script src="resources/js/vendor/OverlayScrollbars.min.js"></script>
    <script src="resources/js/vendor/autoComplete.min.js"></script>
    <script src="resources/js/vendor/clamp.min.js"></script>
    <script src="resources/js/vendor/select2.full.min.js"></script>
    <script src="resources/js/vendor/singleimageupload.js"></script>
    <script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
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
    <script>
        $(document).ready(function () {
            $('#tblRequest').DataTable();
            $('.btnEdit').click(function () {
                location.href = "RequestController?service=createRequest&requestId=" + $(this).data('id');
            });
            if ($('#currentRequestId').val() && $('#currentRequestId').val() !== 'null') {
                $('#btnAdd').click();
                $('#btnModify span').text('Update');
                $("#frmForm").attr('action', "RequestController?service=updateRequestAfter");
            } else {
                $('#btnModify span').text('Update');
                $("#frmForm").attr('action', "RequestController?service=createRequestAfter");
            }
        });
    </script>
    <!-- Page Specific Scripts End -->
</body>
</html>