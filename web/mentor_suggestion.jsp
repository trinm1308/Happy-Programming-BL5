<%-- 
    Document   : mentor_suggestion
    Created on : Dec 11, 2021, 11:20:36 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="css/mentorSuggestion.css" rel="stylesheet" media="all">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" media="all">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet" media="all">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet" media="all">

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
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


        <title>JSP Page</title>
    </head>
    <body id="page-top">
        <%@include file="header.jsp" %>
        <div class="container-margin-top">
            <div class="container mt-5 mb-3 page-section portfolio" id="portfolio"">
                <div class="row">

                    <c:forEach items="${mentors}" var="mentor">

                        <div class="col-md-4">
                            <div class="card p-3 mb-2">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex flex-row align-items-center">
                                        <div class="icon"> <i class="bx bxl-mailchimp"></i> </div>
                                        <div class="ms-2 c-details">
                                            <h6 class="mb-0">${mentor.name}</h6> <span>Phone number: ${mentor.phone}</span>
                                        </div>
                                    </div>
                                    <div class="badge"> <span>${mentor.skill}</span> </div>
                                </div>
                                <div class="mt-5">
                                    <h3 class="heading">Email: ${mentor.email}</h3>
                                    <div class="mt-5">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <div class="mt-3"> <span class="text1">${mentor.rate} Stars <span class="text2">of 5 Stars</span></span> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach> 
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/trungNhScripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
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
</html>
