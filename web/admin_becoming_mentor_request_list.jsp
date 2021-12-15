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
        <link rel="stylesheet" href="css/pagination.css" />
        <script src="js/base/loader.js"></script>
    </head>

    <body>
        <div id="root">
            <%@include file="header_new.jsp" %>

            <!--Insert code here-->
            <main>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <!-- Title and Top Buttons Start -->
                            <div class="page-title-container">
                                <div class="row">
                                    <!-- Title Start -->
                                    <div class="col-12 col-md-7">
                                        <h1 class="mb-0 pb-0 display-4" id="title">Becoming Mentor Requests List</h1>
                                        <nav class="breadcrumb-container d-inline-block" aria-label="breadcrumb">
                                            <ul class="breadcrumb pt-0">
                                                <li class="breadcrumb-item"><a href="/HappyProgramming">Home</a></li>
                                                <li class="breadcrumb-item"><a href="AdminDashboardController">Admin Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="AdminBecomingMentorRequestList">Becoming Mentor Requests List</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Title End -->

                                </div>
                            </div>
                            <!-- Title and Top Buttons End -->

                            <!-- Content Start -->
                            <div class="data-table-rows slim">                             
                                <!-- Table Start -->
                                <div class="data-table-responsive-wrapper">
                                    <h2>Pending Requests</h2>
                                    <table id="rmsTable" class="data-table nowrap hover">
                                        <thead>
                                            <tr>
                                                <th class="text-muted text-small text-uppercase">Request ID</th>
                                                <th class="text-muted text-small text-uppercase">User</th>
                                                <th class="text-muted text-small text-uppercase">Skill</th>
                                                <th class="text-muted text-small text-uppercase">Status</th>                                                    

                                                <th class="empty">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${rms}" var="rm">
                                                <tr style="cursor: pointer" onclick="showIntroduceModal('${rm.introduce}')">
                                                    <td>${rm.id}</td>
                                                    <td>${rm.userName}</td>
                                                    <td>${rm.skillName}</td>
                                                    <td>Pending</td>

                                                    <td style="display: flex; align-items: center;">
                                                        <form action="AdminBecomingMentorRequestList?action=accept&requestId=${rm.id}&userId=${rm.userId}" method="POST">
                                                            <input class="btn btn-primary" type="submit" value="Accept"/>
                                                        </form>
                                                        <form action="AdminBecomingMentorRequestList?action=reject&requestId=${rm.id}" method="POST">
                                                            <input class="btn btn-danger" type="submit" value="Reject"/>
                                                        </form>
                                                    </td>

                                                </tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                    <div class="pagination">
                                        <a href="AdminBecomingMentorRequestList?pendingPage=1">&laquo;</a>
                                        <c:forEach var = "i" begin = "1" end = "${pendingPages}">
                                            <a class="${i==pendingPage?'active':''}" href="AdminBecomingMentorRequestList?pendingPage=${i}">${i}</a>
                                        </c:forEach>                                        
                                        <a href="AdminBecomingMentorRequestList?pendingPage=${pendingPages}">&raquo;</a>
                                    </div>
                                </div>

                                <!-- Table End -->

                            </div>
                            <!-- Content End -->

                            <!-- History Start -->
                            <div class="data-table-rows slim">                             
                                <!-- Table Start -->
                                <div class="data-table-responsive-wrapper">
                                    <h2>History</h2>
                                    <table id="rmsHistoryTable" class="data-table nowrap hover">
                                        <thead>
                                            <tr>
                                                <th class="text-muted text-small text-uppercase">Request ID</th>
                                                <th class="text-muted text-small text-uppercase">User</th>
                                                <th class="text-muted text-small text-uppercase">Skill</th>
                                                <th class="text-muted text-small text-uppercase">Status</th>                                                    

                                                <th class="empty">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${rmsHistory}" var="rm">
                                                <tr style="cursor: pointer" onclick="showIntroduceModal('${rm.introduce}')">
                                                    <td>${rm.id}</td>
                                                    <td>${rm.userName}</td>
                                                    <td>${rm.skillName}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${rm.status==1}">Accepted</c:when>
                                                            <c:when test="${rm.status==2}">Rejected</c:when>                                                            
                                                        </c:choose>
                                                    </td>

                                                    <td style="display: flex; align-items: center;">
                                                        <form action="AdminBecomingMentorRequestList?action=revert&requestId=${rm.id}&userId=${rm.userId}&status=${rm.status}" method="POST">
                                                            <input class="btn btn-link" type="submit" value="Revert"/>
                                                        </form>
                                                    </td>

                                                </tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                    <div class="pagination">
                                        <a href="AdminBecomingMentorRequestList?historyPage=1">&laquo;</a>
                                        <c:forEach var = "i" begin = "1" end = "${historyPages}">
                                            <a class="${i==historyPage?'active':''}" href="AdminBecomingMentorRequestList?historyPage=${i}">${i}</a>
                                        </c:forEach>                                        
                                        <a href="AdminBecomingMentorRequestList?historyPage=${historyPages}">&raquo;</a>
                                    </div>
                                </div>

                                <!-- Table End -->

                            </div>
                            <!-- History End -->

                            <!-- Confirm Modal --> 
                            <div class="modal fade" id="introduceModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Request Message</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure want to demote these mentors ?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Cancel</button>                                            
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Add User Modal End --> 
                        </div>
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
        <script src="js/vendor/datatables.min.js"></script>
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
        <script src="js/cs/datatable.extend.js"></script>
        <!--<script src="js/plugins/datatable.admin_mentor_list.js"></script>-->
        <script src="js/common.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Page Specific Scripts End -->
        <script>
                                                    const introduceModal = new bootstrap.Modal(document.getElementById('introduceModal'));
                                                    $('#rmsTable').DataTable({
                                                        "info": false,
                                                        "searching": false,
                                                        "paging": false,
                                                    });
                                                    $('#rmsHistoryTable').DataTable({
                                                        "info": false,
                                                        "searching": false,
                                                        "paging": false,
                                                    });
                                                    function showIntroduceModal(introduce) {
                                                        $('#introduceModal .modal-body p').html(introduce);
                                                        $('#introduceModal').modal('show');
                                                    }
        </script>
    </body>
</html>
