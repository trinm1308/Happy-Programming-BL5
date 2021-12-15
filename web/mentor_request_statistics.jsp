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
                    <!-- Title and Top Buttons Start -->
                    <div class="page-title-container">
                        <div class="row">
                            <!-- Title Start -->
                            <div class="col-12 col-md-7">
                                <h1 class="mb-0 pb-0 display-4" id="title">${mentor.fullName}</h1>
                                <nav class="breadcrumb-container d-inline-block" aria-label="breadcrumb">
                                    <ul class="breadcrumb pt-0">
                                        <li class="breadcrumb-item"><a href="Dashboards.Default.html">Home</a></li>
                                        <li class="breadcrumb-item"><a href="Pages.html">Mentors List</a></li>
                                        <li class="breadcrumb-item"><a href="Pages.Profile.html">Mentor Profile</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <!-- Title End -->

                        </div>
                    </div>
                    <!-- Title and Top Buttons End -->

                    <div class="row">
                        <!-- Left Side Start -->
                        <div class="col-12 col-xl-4 col-xxl-3">
                            <!-- Biography Start -->
                            <h2 class="small-title">Profile</h2>
                            <div class="card mb-5">
                                <div class="card-body">
                                    <div class="d-flex align-items-center flex-column mb-4">
                                        <div class="d-flex align-items-center flex-column">
                                            <div class="sw-13 position-relative mb-3">
                                                <img src="${mentor.ava != null ? mentor.ava :'img/profile/profile-10.jpg'}" class="img-fluid rounded-xl" alt="thumb" />
                                            </div>
                                            <div class="h5 mb-0">${mentor.fullName}</div>
                                            <div class="text-muted">HappyProgramming Exclusive Mentor</div>
                                            <div class="text-muted">
                                                <i data-cs-icon="pin" class="me-1"></i>
                                                <span class="align-middle">${mentor.address}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="nav flex-column" role="tablist">
                                        <a class="nav-link active px-0 border-bottom border-separator-light" data-bs-toggle="tab" href="#overviewTab" role="tab">
                                            <i data-cs-icon="activity" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">Overview</span>
                                        </a>
                                        <a class="nav-link px-0 border-bottom border-separator-light" data-bs-toggle="tab" href="#friendsTab" role="tab">
                                            <i data-cs-icon="heart" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">Ratings</span>
                                        </a>
                                        <a class="nav-link px-0" data-bs-toggle="tab" href="#aboutTab" role="tab">
                                            <i data-cs-icon="user" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">About</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Biography End -->
                        </div>
                        <!-- Left Side End -->

                        <!-- Right Side Start -->
                        <div class="col-12 col-xl-8 col-xxl-9 mb-5 tab-content">
                            <!-- Overview Tab Start -->
                            <div class="tab-pane fade show active" id="overviewTab" role="tabpanel">
                                <!-- Stats Start -->
                                <h2 class="small-title">Stats</h2>
                                <div class="mb-5">
                                    <div class="row g-2">
                                        <div class="col-12 col-sm-6 col-lg-3">
                                            <div class="card hover-border-primary">
                                                <div class="card-body">
                                                    <div class="heading mb-0 d-flex justify-content-between lh-1-25 mb-3">
                                                        <span>Pending Requests</span>
                                                        <i data-cs-icon="alarm" class="text-primary"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1">ALL TIME</div>
                                                    <div class="cta-1 text-primary">${requests[0]}</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-lg-3">
                                            <div class="card hover-border-primary">
                                                <div class="card-body">
                                                    <div class="heading mb-0 d-flex justify-content-between lh-1-25 mb-3">
                                                        <span>Accepted Requests</span>
                                                        <i data-cs-icon="check-square" class="text-primary"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1">ALL TIME</div>
                                                    <div class="cta-1 text-primary">${requests[1]}</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-lg-3">
                                            <div class="card hover-border-primary">
                                                <div class="card-body">
                                                    <div class="heading mb-0 d-flex justify-content-between lh-1-25 mb-3">
                                                        <span>Rejected Requests</span>
                                                        <i data-cs-icon="arrow-bottom-left" class="text-primary"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1">ALL TIME</div>
                                                    <div class="cta-1 text-primary">${requests[2]}</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-lg-3">
                                            <div class="card hover-border-primary">
                                                <div class="card-body">
                                                    <div class="heading mb-0 d-flex justify-content-between lh-1-25 mb-3">
                                                        <span>Total Requests</span>
                                                        <i data-cs-icon="suitcase" class="text-primary"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1">ALL TIME</div>
                                                    <div class="cta-1 text-primary">${requests[0] + requests[1] + requests[2]}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Stats End -->

                                <!-- Chart Start -->
                                <h2 class="small-title">Chart</h2>
                                <div class="card mb-5">
                                    <div class="card-body">
                                        <div class="sh-35">
                                            <canvas id="doughnutChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <!-- Chart End -->


                                <!-- Requests Start -->
                                <h2 class="small-title">Requests History</h2>
                                <div class="card mb-5">
                                    <div class="card-body">
                                        <!-- Content Start -->
                                        <div class="data-table-rows slim">                             
                                            <!-- Table Start -->
                                            <div class="data-table-responsive-wrapper">                                                
                                                <table id="pendingTable" class="data-table nowrap hover">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-muted text-small text-uppercase">Request ID</th>
                                                            <th class="text-muted text-small text-uppercase">Mentee</th>
                                                            <th class="text-muted text-small text-uppercase">Title</th>
                                                            <th class="text-muted text-small text-uppercase">Status</th>   
                                                            <th class="text-muted text-small text-uppercase">Created at</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${pendingRequests}" var="r">
                                                            <tr style="cursor: pointer" onclick="showIntroduceModal('${r.mess}')">
                                                                <td>${r.id}</td>
                                                                <td>${r.menteeName}</td>
                                                                <td>${r.title}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${r.status==0}">Pending</c:when>
                                                                        <c:when test="${r.status==1}">Accepted</c:when>
                                                                        <c:when test="${r.status==2}">Rejected</c:when>                                                            
                                                                    </c:choose>
                                                                </td>     
                                                                <td>${r.creationDate}</td>
                                                            </tr>
                                                        </c:forEach> 
                                                    </tbody>
                                                </table>
                                                <div class="pagination">
                                                    <a href="MentorRequestStatistics?pendingPage=1">&laquo;</a>
                                                    <c:forEach var = "i" begin = "1" end = "${pendingPages}">
                                                        <a class="${i==pendingPage?'active':''}" href="MentorRequestStatistics?pendingPage=${i}">${i}</a>
                                                    </c:forEach>                                        
                                                    <a href="MentorRequestStatistics?pendingPage=${pendingPages}">&raquo;</a>
                                                </div>
                                            </div>

                                            <!-- Table End -->

                                        </div>
                                        <!-- Content End -->
                                    </div>
                                </div>
                                <!-- Requests End -->


                            </div>
                            <!-- Overview Tab End -->

                            <!-- Friends Tab Start -->

                            <div class="tab-pane fade" id="friendsTab" role="tabpanel">
                                <div style="display: flex; justify-content: space-between">
                                    <h2 class="small-title">Ratings</h2>
                                    <div class="mb-1">                                        
                                        <div class="br-wrapper br-theme-css-stars">
                                            <select name="other-rating" autocomplete="off" data-readonly="true" id="ratingCSSIconReadonly">
                                                <option value="1" ${averageStars>=1?'selected':''}>1</option>
                                                <option value="2" ${averageStars>=2?'selected':''}>2</option>
                                                <option value="3" ${averageStars>=3?'selected':''}>3</option>
                                                <option value="4" ${averageStars>=4?'selected':''}>4</option>
                                                <option value="5" ${averageStars==5?'selected':''}>5</option>
                                            </select>
                                        </div>                                                
                                    </div>
                                </div>
                                <c:forEach items="${requestScope.ratings}" var="rating">
                                    <div class="card mb-5">
                                        <div class="card-body">
                                            <!-- tooltip-label-end inputs should be wrapped in form-group class -->
                                            <div class="mb-1">
                                                <label class="d-block form-label">${rating.menteeName}</label>
                                                <div class="br-wrapper br-theme-css-stars">
                                                    <select name="other-rating" autocomplete="off" data-readonly="true" id="ratingCSSIconReadonly${rating.id}">
                                                        <option value="1" ${rating.stars==1?'selected':''}>1</option>
                                                        <option value="2" ${rating.stars==2?'selected':''}>2</option>
                                                        <option value="3" ${rating.stars==3?'selected':''}>3</option>
                                                        <option value="4" ${rating.stars==4?'selected':''}>4</option>
                                                        <option value="5" ${rating.stars==5?'selected':''}>5</option>
                                                    </select>
                                                </div>
                                                <p>${rating.comment}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>


                            </div>
                            <!-- Friends Tab End -->

                            <!-- About Tab Start -->
                            <div class="tab-pane fade" id="aboutTab" role="tabpanel">
                                <h2 class="small-title">About</h2>
                                <div class="card">
                                    <div class="card-body">                                                                              
                                        <div>
                                            <p class="text-small text-muted mb-2">CONTACT</p>
                                            <a href="#" class="d-block body-link mb-1">
                                                <i data-cs-icon="screen" class="me-2" data-cs-size="17"></i>
                                                <span class="align-middle">${mentor.phone}</span>
                                            </a>
                                            <a href="#" class="d-block body-link">
                                                <i data-cs-icon="email" class="me-2" data-cs-size="17"></i>
                                                <span class="align-middle">${mentor.email}</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- About Tab End -->
                        </div>
                        <!-- Right Side End -->
                    </div>
                </div>


            </main>
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
        <script src="js/vendor/jquery.barrating.min.js"></script>
        <script src="js/vendor/Chart.bundle.min.js"></script>
        <script src="js/vendor/datatables.min.js"></script>
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
        <!--<script src="js/forms/controls.rating.js"></script>-->        
        <!--<script src="js/pages/profile.standard.js"></script>-->
        <script src="js/cs/charts.extend.js"></script>
        <!--<script src="js/plugins/charts.js"></script>-->
        <script src="js/cs/datatable.extend.js"></script>
        <script src="js/common.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Page Specific Scripts End -->
        <script>
                                                                const introduceModal = new bootstrap.Modal(document.getElementById('introduceModal'));
                                                                function showIntroduceModal(introduce) {
                                                                    $('#introduceModal .modal-body p').html(introduce);
                                                                    $('#introduceModal').modal('show');
                                                                }
                                                                $('#pendingTable').DataTable({
                                                                    "info": false,
                                                                    "searching": false,
                                                                    "paging": false,
                                                                });
        </script>
        <script>
            if (document.getElementById('doughnutChart')) {
                const doughnutChart = document.getElementById('doughnutChart');
                this._doughnutChart = new Chart(doughnutChart, {
                    plugins: [ChartsExtend.CenterTextPlugin()],
                    type: 'doughnut',
                    data: {
                        labels: ['Pending', 'Accepted', 'Rejected'],
                        datasets: [
                            {
                                label: '',
                                borderColor: ['yellow', 'green', 'red'],
                                backgroundColor: ['yellow', 'green', 'red'],
                                borderWidth: 2,
                                data: [${requests[0]}, ${requests[1]}, ${requests[2]}]
                            }
                        ]
                    },
                    draw: function () {},
                    options: {
                        plugins: {
                            datalabels: {display: false}
                        },
                        responsive: true,
                        maintainAspectRatio: false,
                        cutoutPercentage: 80,
                        title: {
                            display: false
                        },
                        layout: {
                            padding: {
                                bottom: 20
                            }
                        },
                        legend: {
                            position: 'bottom',
                            labels: {
                                padding: 20,
                                usePointStyle: true,
                                fontSize: 14,
                                boxWidth: 10,
                                fontFamily: Globals.font
                            }
                        },
                        tooltips: {
                            display: false
                        }
                    }
                });
            }
        </script>
        <script>
            jQuery("#ratingCSSIconReadonly").barrating({
                initialRating: null,
                readonly: true,
                showSelectedRating: true
            });
            <c:forEach items="${requestScope.ratings}" var="rating">
            jQuery("#ratingCSSIconReadonly${rating.id}").barrating({
                initialRating: null,
                readonly: true,
                showSelectedRating: true
            });
            </c:forEach>

        </script>
    </body>
</html>
