<%@page import="dao.UserDAO"%>
<%@page import="entity.Skill"%>
<%@page import="dao.SkillDao"%>
<%@page import="context.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="entity.Request"%>
<%@page import="entity.User"%>
<%@page import="dao.RequestDao"%>
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
        <link rel="stylesheet" href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
        <!-- Vendor Styles End -->
        <!-- Template Base Styles Start -->
        <link rel="stylesheet" href="resources/css/styles.css" />
        <!-- Template Base Styles End -->

        <link rel="stylesheet" href="resources/css/main.css" />
        <script src="resources/js/base/loader.js"></script>
    </head>
    <body>
        <%
            DBConnect dc = new DBConnect();
            RequestDao dao = new RequestDao(dc);
            UserDAO userDao = new UserDAO(dc);
            User user = (User) session.getAttribute("user");
            List<Request> requestsByMentee = dao.getListRequestById(user.getId());
            //String requestId = request.getParameter("requestId");
        %>
        <c:if test="${msg != null}">
            <script>alert('${msg}')</script>
        </c:if>
        <main>
            <%@include file="header.jsp" %>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <!-- Title Start -->
                        <section class="scroll-section" id="title">
                            <div class="page-title-container">
                                <h1 class="mb-0 pb-0 display-4">Mentee List</h1>
                                <nav class="breadcrumb-container d-inline-block" aria-label="breadcrumb">
                                    <!--                    <ul class="breadcrumb pt-0">
                                                          <li class="breadcrumb-item"><a href="Dashboards.Default.html">Home</a></li>
                                                          <li class="breadcrumb-item"><a href="Blocks.html">Blocks</a></li>
                                                        </ul>-->
                                </nav>
                            </div>
                        </section>
                        <!-- Title End -->

                        <!-- Content Start --
                        <div>
                        -->                          <div class="card mb-5">
                            <div class="card-body">
                                <div class="card mb-2">
                                    <a href="#" class="row g-0 sh-10">
                                        <div class="col">
                                            <div class="card-body d-flex flex-row pt-0 pb-0 h-100 align-items-center justify-content-between">
<!--                                                <div class="d-flex flex-column justify-content-center">
                                                    <div class="mb-1">${item.name}</div>
                                                    <div class="mb-1">${item.accountName}</div>
                                                </div>-->
                                                <div class="d-flex flex-row ms-3">
                                                    <div class="d-flex flex-column align-items-center">
                                                        <div class="text-muted text-small">Total Mentees</div>
                                                        <div class="text-alternate"><%=userDao.getTotalMentee()%></div>
                                                    </div>
                                                    <div class="d-flex flex-column align-items-center ms-3">
                                                        <div class="text-muted text-small">Total Requests</div>
                                                        <div class="text-alternate"><%=userDao.getTotalRequest()%></div>
                                                    </div>
                                                    <div class="d-flex flex-column align-items-center">
                                                        <div class="text-muted text-small">Total Hours</div>
                                                        <div class="text-alternate"><%=userDao.getTotalHour()%></div>
                                                    </div>
                                                    <div class="d-flex flex-column align-items-center">
                                                        <div class="text-muted text-small">Total Skils</div>
                                                        <div class="text-alternate"><%=userDao.getTotalSkill()%></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div><!--
        
                        <div class="row">
        
                        <!-- Additional Info Start -->
                        <div class="col-xl-12 mb-5 h-100-card">
                            <section class="scroll-section" id="additionalInfo">
                                <!--                                <div class="d-flex justify-content-between">
                                                                    <h2 class="small-title">Additional Info</h2>
                                                                    <div class="dropdown-as-select">
                                                                        <button
                                                                            class="btn btn-sm pe-0 btn-link align-top mt-n1"
                                                                            type="button"
                                                                            data-bs-toggle="dropdown"
                                                                            aria-expanded="false"
                                                                            aria-haspopup="true"
                                                                            >
                                                                            Week
                                                                        </button>
                                                                        <div class="dropdown-menu dropdown-menu-sm dropdown-menu-end shadow">
                                                                            <div class="nav flex-column" role="tablist">
                                                                                <a class="active" data-bs-toggle="tab" href="#additionalInfoWeek" aria-selected="true" role="tab">Week</a>
                                                                                <a class="" data-bs-toggle="tab" href="#additionalInfoMonth" aria-selected="false" role="tab">Month</a>
                                                                                <a class="" data-bs-toggle="tab" href="#additionalInfoYear" aria-selected="false" role="tab">Year</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
<!--                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="additionalInfoWeek">
                                        <c:forEach items="${menteeList}" var="item">
                                            <div class="card mb-2">
                                                <a href="#" class="row g-0 sh-10">
                                                    <div class="col-auto h-100">
                                                        <img src="${item.avatar}" alt="user" class="card-img card-img-horizontal sw-11" />
                                                    </div>
                                                    <div class="col">
                                                        <div class="card-body d-flex flex-row pt-0 pb-0 h-100 align-items-center justify-content-between">
                                                            <div class="d-flex flex-column justify-content-center">
                                                                <div class="mb-1">${item.name}</div>
                                                                <div class="mb-1">${item.accountName}</div>
                                                            </div>
                                                            <div class="d-flex flex-row ms-3">
                                                                <div class="d-flex flex-column align-items-center">
                                                                    <div class="text-muted text-small">Total Hours</div>
                                                                    <div class="text-alternate">${item.totalHours}</div>
                                                                </div>
                                                                <div class="d-flex flex-column align-items-center ms-3">
                                                                    <div class="text-muted text-small">Total skill</div>
                                                                    <div class="text-alternate">${item.totalSkill}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>-->
                            </section>
                        </div>
                        <!-- Additional Info End -->
                    </div>
                </div>
                <!-- Content End -->
            </div>

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
                function handleClick(cb) {
                    if (cb.checked) {
                        document.getElementById('txtMentor').value = "need suggestion"
                        document.getElementById("txtMentor").disabled = true;
                    } else {
                        document.getElementById('txtMentor').value = ""
                        document.getElementById("txtMentor").disabled = false;
                    }
                }
</script>

<script>
// Get the modal
    var modal = document.getElementById("myModal");

// Get the button that opens the modal

// Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
    $(".myBtn").on('click', function (e) {
        modal.style.display = "block";
        console.log($(this).parent().siblings()[0].innerText);
        document.getElementById('txtETitle').value = $(this).parent().siblings()[1].innerText
        document.getElementById('txtEDeadline').value = $(this).parent().siblings()[2].innerText
        document.getElementById('txtEContent').value = $(this).parent().siblings()[3].innerText
        document.getElementById('txtENumDeadline').value = $(this).parent().siblings()[4].innerText
        $("#editForm").attr('action', 'RequestController?service=EditRequest&requestId=' + $(this).parent().siblings()[0].innerText);
    })

// When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

// When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
<!-- Page Specific Scripts End -->
</body>
</html>
