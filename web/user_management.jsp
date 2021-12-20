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
            <main>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <!-- Title and Top Buttons Start -->
                            <div class="page-title-container">
                                <div class="row">
                                    <!-- Title Start -->
                                    <div class="col-12 col-md-7">
                                        <h1 class="mb-0 pb-0 display-4" id="title">Users List</h1>
                                        <nav class="breadcrumb-container d-inline-block" aria-label="breadcrumb">
                                            <ul class="breadcrumb pt-0">
                                                <li class="breadcrumb-item"><a href="/HappyProgramming">Home</a></li>
                                                <li class="breadcrumb-item"><a href="UserController">User Controller</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Title End -->

                                    <!-- Top Buttons Start -->
                                    <div class="col-12 col-md-5 d-flex align-items-start justify-content-end">
                                        <!-- Add New Button Start -->
                                        <button type="button" onclick="showAddModal()" class="btn btn-outline-primary btn-icon btn-icon-start w-100 w-md-auto add-datatable" data-toggle="modal" data-target="#addUserModal">
                                            <i data-cs-icon="plus"></i>
                                            <span>Add New</span>
                                        </button>
                                        <!-- Add New Button End -->
                                    </div>
                                    <!-- Top Buttons End -->
                                </div>
                            </div>
                            <!-- Title and Top Buttons End -->

                            <!-- Content Start -->
                            <div class="data-table-rows slim">                                
                                <!-- Table Start -->
                                <div class="data-table-responsive-wrapper">
                                    <table id="userTable" class="data-table nowrap hover">
                                        <thead>
                                            <tr>
                                                <th class="text-muted text-small text-uppercase">ID</th>
                                                <th class="text-muted text-small text-uppercase">Full Name</th>
                                                <th class="text-muted text-small text-uppercase">Gender</th>
                                                <th class="text-muted text-small text-uppercase">Email</th>
                                                <th class="text-muted text-small text-uppercase">Phone</th> 
                                                <th class="text-muted text-small text-uppercase">Role</th>
                                                <th class="text-muted text-small text-uppercase">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${users}" var="user">
                                                <tr>
                                                    <td>${user.id}</td>
                                                    <td>${user.fullName}</td>
                                                    <td>
                                                        <c:choose >
                                                            <c:when test="${user.gender == true}">Male</c:when>
                                                            <c:when test="${user.gender == false}">Female</c:when>
                                                        </c:choose>

                                                    </td>
                                                    <td>${user.email}</td>
                                                    <td>${user.phone}</td>

                                                    <td>
                                                        <c:choose >
                                                            <c:when test="${user.role == 0}">Mentor</c:when>
                                                            <c:when test="${user.role == 1}">Mentee</c:when>
                                                            <c:when test="${user.role == 2}">Admin</c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td style="display: flex; align-items: center;">
                                                        <button class="btn btn-primary" onclick="showEditModal(${user.id}, '${user.fullName}',${user.gender}, '${user.email}', '${user.phone}',${user.role})">Edit</button>
                                                        <button class="btn btn-danger" onclick="showDeleteModal(${user.id})">Delete</button>
                                                    </td>                                                
                                                </tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                </div>

                                <!-- Table End -->

                            </div>
                            <!-- Content End -->

                            <!-- Edit Modal Start -->
                            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="modalTitle">Edit User</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form method="POST" action="UserController?action=edit">
                                            <div class="modal-body">                                          
                                                <div class="mb-3">
                                                    <label class="form-label">ID</label>
                                                    <input id="editId" name="ID" type="text" class="form-control" readonly="readonly" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Full Name</label>
                                                    <input id="editName" name="FullName" type="text" class="form-control" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Gender</label>
                                                    <div>
                                                        <div class="form-check">
                                                            <input type="radio" id="male" name="Gender" value="Male" class="form-check-input" checked>
                                                            <label class="form-check-label" for="male">Male</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input type="radio" id="female" name="Gender" value="Female" class="form-check-input" >
                                                            <label class="form-check-label" for="female">Female</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input id="editEmail" name="Email" type="text" class="form-control" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Phone</label>
                                                    <input id="editPhone" name="Phone" type="text" class="form-control" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Role</label>
                                                    <div>
                                                        <div class="form-check">
                                                            <input type="radio" id="mentor" name="Role" value="0" class="form-check-input" checked>
                                                            <label class="form-check-label" for="mentor">Mentor</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input type="radio" id="mentee" name="Role" value="1" class="form-check-input" >
                                                            <label class="form-check-label" for="mentee">Mentee</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input type="radio" id="admin" name="Role" value="2" class="form-check-input" >
                                                            <label class="form-check-label" for="admin">Admin</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Cancel</button>                                            
                                                <input type="submit" class="btn btn-primary" value="Update">  
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Edit Modal End -->

                            <!-- Add User Modal Start -->
                            <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="modalTitle">Add New User</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="POST" action="UserController?action=add">
                                                <div class="mb-3">
                                                    <label class="form-label">Full Name</label>
                                                    <input name="FullName" type="text" class="form-control" required/>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Username</label>
                                                    <input name="addUsername" type="text" class="form-control" required/>
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input name="Email" type="email" class="form-control" required/>
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Phone</label>
                                                    <input name="Phone" type="tel" pattern="[0-9]{10}" class="form-control" required/>
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Gender</label>
                                                    <div>
                                                        <div class="form-check">
                                                            <input type="radio" id="male" name="addGender" value="true" class="form-check-input" checked/>
                                                            <label class="form-check-label" for="male">Male</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input type="radio" id="female" name="addGender" value="false" class="form-check-input" />
                                                            <label class="form-check-label" for="female">Female</label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Address</label>
                                                    <input name="Address" type="text" class="form-control" required/>
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Role</label>
                                                    <div>
                                                        <div class="form-check">
                                                            <input type="radio" id="mentor" name="Role" value="0" class="form-check-input" checked>
                                                            <label class="form-check-label" for="mentor">Mentor</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input type="radio" id="mentee" name="Role" value="1" class="form-check-input" >
                                                            <label class="form-check-label" for="mentee">Mentee</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input type="radio" id="admin" name="Role" value="2" class="form-check-input" >
                                                            <label class="form-check-label" for="admin">Admin</label>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Cancel</button>
                                            <input type="submit" class="btn btn-primary" value="Add New User">
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Add User Modal End --> 
                            <!-- Confirm Modal --> 
                            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Delete Confirm</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure want to delete user ?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <form id="deleteForm" method="POST">
                                                <input type="submit" class="btn btn-danger" value="Delete">
                                            </form>
                                            <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Cancel</button>                                            
                                        </div>                                        
                                    </div>
                                </div>
                            </div>
                            <!-- Confirm Modal End --> 
                        </div>
                    </div>
                </div>
            </main>

            <%@include file="footer.jsp" %>
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
        <script src="js/base/nav.js"></script>
        <script src="js/base/search.js"></script>
        <script src="js/base/settings.js"></script>
        <script src="js/base/init.js"></script>
        <!-- Template Base Scripts End -->
        <!-- Page Specific Scripts Start -->
        <script src="js/cs/datatable.extend.js"></script>
        <!--<script src="js/plugins/datatable.editablerows.js"></script>-->
        <script src="js/common.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Page Specific Scripts End -->
        <script>
                                                            function showDeleteModal(id) {
                                                                $('#deleteForm').attr('action', 'UserController?action=delete&deleteId=' + id);
                                                                $('#deleteModal').modal('show');
                                                            }
                                                            function showAddModal() {
                                                                $('#addUserModal').modal('show');
                                                            }
                                                            $('#userTable').DataTable({
                                                                "order": [[0, "desc"]],
                                                                "info": false,
                                                            });
                                                            function showEditModal(id, fullName, gender, email, phone, role) {
                                                                const html = `
                                                <div class="mb-3">
                                                    <label class="form-label">ID</label>
                                                    <input value="` + id + `" name="ID" type="text" class="form-control" readonly="readonly" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Full Name</label>
                                                    <input value="` + fullName + `" name="FullName" type="text" class="form-control" required/>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Gender</label>
                                                    <div>
                                                        <div class="form-check">
                                                            <input type="radio" id="male" name="Gender" value="Male" class="form-check-input" ` + (gender ? 'checked' : '') + `>
                                                            <label class="form-check-label" for="male">Male</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input type="radio" id="female" name="Gender" value="Female" class="form-check-input" ` + (gender ? '' : 'checked') + `>
                                                            <label class="form-check-label" for="female">Female</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input value="` + email + `" name="Email" type="email" class="form-control" required/>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Phone</label>
                                                    <input value="` + phone + `" name="Phone" type="tel" pattern="[0-9]{10}" class="form-control" required/>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Role</label>
                                                    <div>
                                                        <div class="form-check">
                                                            <input type="radio" id="mentor" name="Role" value="0" class="form-check-input" ` + (role == 0 ? 'checked' : '') + `>
                                                            <label class="form-check-label" for="mentor">Mentor</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input type="radio" id="mentee" name="Role" value="1" class="form-check-input" ` + (role == 1 ? 'checked' : '') + `>
                                                            <label class="form-check-label" for="mentee">Mentee</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input type="radio" id="admin" name="Role" value="2" class="form-check-input" ` + (role == 2 ? 'checked' : '') + `>
                                                            <label class="form-check-label" for="admin">Admin</label>
                                                        </div>
                                                    </div>
                                        </div>`
                                                                $('#editModal .modal-body').html(html);
                                                                $('#editModal').modal('show');
                                                            }
        </script>
    </body>
</html>
