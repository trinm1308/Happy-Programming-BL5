
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
        <link rel="stylesheet" href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
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
                User user = (User) session.getAttribute("user");
                List<Skill> skillPopular = dao.getSkillHaveManyRequest();
                List<Skill> skillList = dao.getSkillList();
                List<Skill> topSkill = dao.getTopSkill();
                String service = request.getParameter("service");
                String message = request.getParameter("message");

            %>
            <%@include file="header.jsp" %>
            <div class="container" style="max-width: 1340px;">
                <input type="hidden" id="txtService" value="<%=service%>" />
                <input type="hidden" id="txtMessage" value="<%=message%>" />
                <input type="hidden" id="txtId" value="<%=request.getParameter("id")%>" />
                <div class="row">
                    <div class="col-auto d-none d-lg-flex">
                        <!--                        <div class="col-auto d-none d-lg-flex">
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
                                                </div>-->
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
                                        <h1 class="mb-0 pb-0 display-4" id="title">Skill Dashboard</h1>
                                    </div>
                                </div>
                                <!-- Title End -->
                                <div class="col-12 col-sm-6 col-md-auto d-flex align-items-end justify-content-end mb-2 mb-sm-0 order-sm-3">
                                    <c:if test="${sessionScope.user!=null && sessionScope.user.role==2}">
                                        <button type="button" class="btn btn-outline-primary btn-icon btn-icon-start ms-0 ms-sm-1 w-100 w-md-auto" id="btnAddSkill" data-bs-toggle="modal"
                                                data-bs-target="#discountAddModal">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="cs-icon cs-icon-plus"><path d="M10 17 10 3M3 10 17 10"></path></svg>
                                            <span>Add Skill</span>
                                        </button>
                                    </c:if>
                                </div>
                                <div class="modal modal-right fade" id="discountAddModal" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Add Skill</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form class="d-flex flex-column mb-4" action="UploadController?page=skill.jsp?service=addSkill" method="POST" id="frmUpload" enctype="multipart/form-data">
                                                    <div class="mb-3 mx-auto position-relative" id="singleImageUploadExample">

                                                        <img
                                                            src="${fileName}"
                                                            alt="user"
                                                            name="ava"
                                                            class="rounded-xl border border-separator-light border-4 sw-12 sh-12"
                                                            id="contactThumbModal"
                                                            />

                                                        <button class="btn btn-sm btn-icon btn-icon-only btn-separator-light position-absolute rounded-xl e-0 b-0" type="button">
                                                            <i data-cs-icon="upload"></i>
                                                        </button>
                                                        <input class="file-upload d-none" type="file" name="photo" accept="image/*" />
                                                    </div>
                                                </form>
                                                <form action="SkillController?service=addSkill" id="frmForm" method="POST">
                                                    <c:if test="${fileName != null}">
                                                        <input type="hidden" name="image" value="${fileName}" id="txtImage" />
                                                    </c:if>
                                                    <div class="menter-register__body">
                                                        <p style="color:red; text-align:center" >${alertMess1}</p>
                                                        <div class="mb-3 row menter-register__item">
                                                            <label for="request_title" class="col-lg-2 col-md-3 col-sm-4 col-form-label">
                                                                Name
                                                            </label>
                                                            <input type="text" name="name" class="form-control" value="${skill.name}" id="txtName" required> 
                                                        </div>
                                                        <div class="mb-3 row menter-register__item">
                                                            <label for="request_content" class="col-lg-2 col-md-3 col-sm-4 col-form-label">
                                                                Description
                                                            </label>
                                                            <textarea name="description" value="${skill.content}" class="form-control" id="txtDes">${skill.content}
                                                            </textarea>
                                                        </div>
                                                        <div class="mb-3 row menter-register__item">
                                                            <label for="request_deadlineHours" class="col-lg-2 col-md-3 col-sm-4 col-form-label">
                                                                Status:
                                                            </label>
                                                            <select class="select-single-no-search form-control" value="${skill.status}" name="status" data-width="100%" id="cboStatus">
                                                                <option value="Active" selected>Active</option>
                                                                <option value="Deactive" >Deactive</option>
                                                            </select>
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
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-xl-6 mb-n5">
                                <!-- Price Start -->
                                <div class="mb-5">
                                    <h2 class="small-title">Skills popular</h2>
                                    <div class="row g-2">
                                        <%                                            for (Skill item : skillPopular) {
                                        %>
                                        <div class="col-12 col-sm-6 col-lg-6">
                                            <div class="card sh-13 sh-lg-15 sh-xl-14">
                                                <div class="h-100 row g-0 card-body align-items-center py-3">
                                                    <div class="col-auto pe-3">
                                                        <div class="col-auto">
                                                            <!--<i class="fa fa-user-circle" aria-hidden="true"></i>-->
                                                            <img src="<%=item.getImage()%>" alt="user" class="card-img card-img-horizontal sw-11" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="d-flex align-items-center lh-1-25"><%=item.getName()%></div>
                                                        <div class="text-primary"><%=item.getCountRequest()%></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                                <!-- Price End -->

                                <!-- History Start -->
                                <div class="mb-5">
                                    <h2 class="small-title">Skill List</h2>
                                    <div class="scroll-out mb-n2">
                                        <div class="scroll-by-count" data-count="4">
                                            <%
                                                for (Skill item : topSkill) {
                                            %>
                                            <div class="card mb-2">
                                                <div class="row g-0 sh-14 sh-md-10">
                                                    <div class="col-auto">
                                                        <a href="SkillController?service=showDetail&id=<%=item.getId()%>">
                                                            <img src="<%=item.getImage()%>" alt="user" class="card-img card-img-horizontal sw-11" />
                                                        </a>
                                                    </div>
                                                    <div class="col">
                                                        <div class="card-body pt-0 pb-0 h-100">
                                                            <div class="row g-0 h-100 align-content-center">
                                                                <div class="col-12 col-md-6 d-flex align-items-center mb-2 mb-md-0">
                                                                    <a href="SkillController?service=showDetail&id=<%=item.getId()%>"><%=item.getName()%></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <!-- History End -->

                            </div>
                            <div class="col-xl-6">
                                <div id="checkboxTable">
                                    <table id="tblRequest" class="display" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Description</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (Skill item : skillList) {
                                            %>
                                            <tr>
                                                <td><%=item.getId()%></td>
                                                <td><a href="SkillController?service=showDetail&id=<%=item.getId()%>"><%=item.getName()%></a></td>
                                                <td><%=item.getContent()%></td>
                                                <td><%=item.getStatus()%></td>
                                                <td>
                                                    <c:if test="${sessionScope.user.role==2}">
                                                    <%
                                                        if ("Active".equals(item.getStatus())) {
                                                    %>
                                                    <form action="SkillController?service=changeStatus&status=Deactive&id=<%=item.getId()%>" method="post">
                                                        <input style="width: 100px;" class="mb-1 btn btn-success" type="submit" value="Deactive">
                                                    </form>
                                                    <%
                                                    } else {
                                                    %>
                                                    <form action="SkillController?service=changeStatus&status=Active&id=<%=item.getId()%>" method="post">
                                                        <input style="width: 100px;" class="mb-1 btn btn-success"  type="submit" value="Active">
                                                    </form>
                                                    <%
                                                        }
                                                    %>
                                                    
                                                        <form action="SkillController?service=editSkill&id=<%=item.getId()%>" method="post">
                                                            <input style="width: 100px;" class="mb-1 btn btn-success btnEdit"  type="submit" value="Edit">
                                                        </form>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>

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
            if ($("#txtService").val() === 'addSkill') {
                $('#btnAddSkill').click();
            }
            if ($("#txtService").val() === 'edit') {
                $('#btnAddSkill').click();
                $('#discountAddModal modal-title').text('Edit Skill');
                $('#btnModify').text('Update');
                $('#frmForm').attr('action', 'SkillController?service=adminUpdateSkillAfter&id=' + $('#txtId').val());
                var link = 'SkillController?service=editSkill&id=' + $('#txtId').val();
                $('#frmUpload').attr('action', 'UploadController?page=skill.jsp?service=editSkill&id='+ $('#txtId').val());
            }
            if ($('#txtMessage').val() === 'success') {
                alert('Action success');
            }
            $('#btnAddSkill').click(function() {
                if ($("#txtService").val() !== 'edit') {
                $('#discountAddModal modal-title').text('Add Skill');
                $('#btnModify').text('Add');
                $('#frmForm').attr('action', 'SkillController?service=addSkill');
                $('#frmUpload').attr('action', 'UploadController?page=skill.jsp?service=addSkill');
            }
            });
        });
    </script>
    <!-- Page Specific Scripts End -->
</body>
</html>