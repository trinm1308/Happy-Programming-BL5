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
            User user = (User) session.getAttribute("user");
            List<Request> requestsByMentee = dao.getListRequestById(user.getId());
//            String requestId = request.getParameter("requestId");
//            if (requestId != null) {
//                for (Request item : requestsByMentee) {
//                    if (item.getId() == Integer.parseInt(requestId)) {
//                        request.setAttribute("title", item.getTitle());
//                        request.setAttribute("content", item.getMess());
//                        request.setAttribute("deadline", item.getDeadline());
//                        request.setAttribute("deadlineHours", item.getDeadlineHour());
////                    request.setAttribute("title", item.get());
//                    }
//                }
//            }

        %>
        <c:if test="${msg != null}">
            <script>alert('${msg}')</script>
        </c:if>
        <main>
            <%@include file="header.jsp" %>
            <div class="container">
                <div class="row">
                    <div class="col-auto d-none d-lg-flex">
                        <div class="col-auto d-none d-lg-flex">
                            <ul class="sw-25 side-menu mb-0 primary" id="menuSide">
                                <li>
                                    <a href="#" data-bs-target="#dashboard">
                                        <i data-cs-icon="grid-1" class="icon" data-cs-size="18"></i>
                                        <span class="label">Dashboard</span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="Dashboard.GettingStarted.html">
                                                <i data-cs-icon="navigate-diagonal" class="icon" data-cs-size="18"></i>
                                                <span class="label">Getting Started</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="Dashboard.Analysis.html">
                                                <i data-cs-icon="chart-4" class="icon" data-cs-size="18"></i>
                                                <span class="label">Analysis</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" data-bs-target="#services">
                                        <i data-cs-icon="grid-1" class="icon" data-cs-size="18"></i>
                                        <span class="label">Services</span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="Services.Database.html">
                                                <i data-cs-icon="database" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Database</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="Services.Storage.html">
                                                <i data-cs-icon="file-image" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Storage</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="Services.Hosting.html">
                                                <i data-cs-icon="router" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Hosting</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="Services.Users.html">
                                                <i data-cs-icon="user" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Users</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" data-bs-target="#account">
                                        <i data-cs-icon="user" class="icon" data-cs-size="18"></i>
                                        <span class="label">Account</span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="Account.Settings.html">
                                                <i data-cs-icon="gear" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Settings</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="Account.Billing.html">
                                                <i data-cs-icon="credit-card" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Billing</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="Account.Security.html">
                                                <i data-cs-icon="shield" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Security</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" data-bs-target="#support">
                                        <i data-cs-icon="help" class="icon" data-cs-size="18"></i>
                                        <span class="label">Support</span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="Support.Docs.html">
                                                <i data-cs-icon="file-empty" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Docs</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="Support.KnowledgeBase.html">
                                                <i data-cs-icon="notebook-1" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Knowledge Base</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="Support.Tickets.html">
                                                <i data-cs-icon="bookmark" class="icon d-none" data-cs-size="18"></i>
                                                <span class="label">Tickets</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
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
                                        <h1 class="mb-0 pb-0 display-4" id="title">Mentee Request</h1>
                                    </div>
                                </div>
                                <!-- Title End -->

                                <!-- Top Buttons Start -->
                                <div class="w-100 d-md-none"></div>
                                <div class="col-12 col-sm-6 col-md-auto d-flex align-items-end justify-content-end mb-2 mb-sm-0 order-sm-3">
                                    <button
                                        id="btnAdd"
                                        type="button"
                                        class="btn btn-outline-primary btn-icon btn-icon-start ms-0 ms-sm-1 w-100 w-md-auto"
                                        data-bs-toggle="modal"
                                        data-bs-target="#discountAddModal"
                                        >
                                        <i data-cs-icon="plus"></i>
                                        <span>Add Mentee request</span>
                                    </button>
                                </div>
                                <!-- Top Buttons End -->
                                <div class="row">
                                    <div class="col-12 mb-5">                   
                                        <table id="tblRequest" class="display" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Title</th>
                                                    <th>Deadline</th>
                                                    <th>Content</th>
                                                    <th>Hour</th>
                                                    <th>Skills</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%                                                    for (Request req : requestsByMentee) {
                                                %>
                                                <tr>
                                                    <%
                                                        request.setAttribute("o", req);
                                                    %>
                                                    <td>${o.id}</td>
                                                    <td>${o.title}</td>
                                                    <td>${o.deadline}</td>
                                                    <td style="white-space: pre-wrap;">${o.mess}</td>
                                                    <td>${o.deadlineHour}</td>
                                                    <td>
                                                        <%
                                                            SkillDao skillDAO = new SkillDao(dc);
                                                            List<Skill> listSkill = skillDAO.getSkillListByRequestId(req.getId());
                                                            request.setAttribute("listSkillItem", listSkill);
                                                        %>
                                                        <c:forEach items="${listSkillItem}" var="i">
                                                            ${i.name}<br/>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:if test="${o.status == 1}">
                                                            <input style="width: 100px;" class="mb-1 btn btn-success btnEdit" data-id="${o.id}"  type="button" value="Edit">

                                                            <form action="RequestController?service=cancelRequest" method="post">
                                                                <!--<input type="hidden" value="${o.id}" name="requestId">-->
                                                                <input style="width: 100px;" class="mb-1 btn btn-danger" type="submit" value="Cancel" id="submit" onclick ="return confirm('Do you want to cancel your request?')">
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${o.status == 0}">
                                                            Finish Date: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${o.finishDate}"/>
                                                        </c:if>
                                                        <c:if test="${o.status == 3}">
                                                Cancelled Date: <fmt:formatDate pattern = "dd/MM/yyyy" value = "${o.finishDate}"/>
                                            </c:if>
                                            </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- Discount Add Modal Start -->
                                <div class="modal modal-right fade" id="discountAddModal" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Add New Mente Request</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="RequestController?service=createRequestAfter" id="frmForm" method="POST">

                                                    <div class="menter-register__body">
                                                        <p style="color:red; text-align:center" >${alertMess1}</p>
                                                        <div class="mb-3 row menter-register__item">
                                                            <label for="request_title" class="col-lg-2 col-md-3 col-sm-4 col-form-label">
                                                                Title:
                                                            </label>
                                                            <input type="text" name="title" class="form-control" id="txtTitle" value="${title}" required> 
                                                        </div>
                                                        <div class="mb-3 row menter-register__item">
                                                            <label for="request_content" class="col-lg-2 col-md-3 col-sm-4 col-form-label">
                                                                Deadline:
                                                            </label>
                                                            <input type="date" name="deadline" class="form-control" id="txtDeadline" value="${deadline}" required>
                                                        </div>
                                                        <div class="mb-3 row menter-register__item">
                                                            <label for="request_content" class="col-lg-2 col-md-3 col-sm-4 col-form-label">
                                                                Content:
                                                            </label>
                                                            <input type="text" name="content" class="form-control" id="txtContent" value="${content}" required> 
                                                        </div>
                                                        <div class="mb-3 row menter-register__item">
                                                            <label for="skill" class="col-lg-2 col-md-3 col-sm-4 col-form-label">
                                                                Choose Skill:
                                                            </label>
                                                            <select name="skill" class="form-control" multiple="true" id="cboSkill" size="6" multiple required>
                                                                <c:forEach items="${listSkill}" var="i">                                                   
                                                                    <option value="${i.id}" >${i.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3 row menter-register__item">
                                                            <label for="request_deadlineHours" class="col-lg-2 col-md-3 col-sm-4 col-form-label">
                                                                Deadline Hours:
                                                            </label>
                                                            <input type="number" min="0" step=".01" name="deadlineHours" id="txtDeadline" class="form-control" value="${deadlineHours}" required> 
                                                        </div>
                                                        <div> 
                                                            <input style="margin-left: 350px" type="submit" value="Create" />
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer border-0">
                                                        <button href="#" class="btn btn-icon btn-icon-end btn-primary" type="submit" id="btnModify">
                                                            <span>Add</span>
                                                            <i data-cs-icon="send"></i>
                                                            </a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Discount Add Modal End -->
                            </div>
                        </div>
                    </div>
                    <!-- Title and Top Buttons End -->

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
//                                                                        $('.btnEdit').click(function () {
//                                                                            location.href = "RequestController?service=createRequest&requestId=" + $(this).data('id');
//                                                                        });
//                                                                        if ($('#currentRequestId').val() && $('#currentRequestId').val() !== 'null') {
//                                                                            $('#btnAdd').click();
//                                                                            $('#btnModify span').text('Update');
//                                                                            $("#frmForm").attr('action', "RequestController?service=updateRequestAfter");
//                                                                        } else {
//                                                                            $('#btnModify span').text('Update');
//                                                                            $("#frmForm").attr('action', "RequestController?service=createRequestAfter");
//                                                                        }
                                                                    });
    </script>
    <!-- Page Specific Scripts End -->
</body>
</html>
