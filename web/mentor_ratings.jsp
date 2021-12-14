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
            <main>
                <div class="container">
                    <!-- Title and Top Buttons Start -->
                    <div class="page-title-container">
                        <div class="row">
                            <!-- Title Start -->
                            <div class="col-12 col-md-7">
                                <h1 class="mb-0 pb-0 display-4" id="title">${requestScope.mentor.fullName}</h1>
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
                                                <img src=${requestScope.mentor.ava ? requestScope.mentor.ava :"img/profile/profile-10.jpg"} class="img-fluid rounded-xl" alt="thumb" />
                                            </div>
                                            <div class="h5 mb-0">${requestScope.mentor.fullName}</div>
                                            <div class="text-muted">HappyProgramming Exclusive Mentor</div>
                                            <div class="text-muted">
                                                <i data-cs-icon="pin" class="me-1"></i>
                                                <span class="align-middle">${requestScope.mentor.address}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="nav flex-column" role="tablist">
                                        <a class="nav-link px-0 border-bottom border-separator-light" data-bs-toggle="tab" href="#overviewTab" role="tab">
                                            <i data-cs-icon="activity" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">Overview</span>
                                        </a>
                                        <a class="nav-link px-0 border-bottom border-separator-light" data-bs-toggle="tab" href="#projectsTab" role="tab">
                                            <i data-cs-icon="suitcase" class="me-2" data-cs-size="17"></i>
                                            <span class="align-middle">Projects</span>
                                        </a>
                                        <a class="nav-link active px-0 border-bottom border-separator-light" data-bs-toggle="tab" href="#friendsTab" role="tab">
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
                            <div class="tab-pane fade" id="overviewTab" role="tabpanel">
                                <!-- Stats Start -->
                                <h2 class="small-title">Stats</h2>
                                <div class="mb-5">
                                    <div class="row g-2">
                                        <div class="col-12 col-sm-6 col-lg-3">
                                            <div class="card hover-border-primary">
                                                <div class="card-body">
                                                    <div class="heading mb-0 d-flex justify-content-between lh-1-25 mb-3">
                                                        <span>Projects</span>
                                                        <i data-cs-icon="suitcase" class="text-primary"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1">ACTIVE</div>
                                                    <div class="cta-1 text-primary">14</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-lg-3">
                                            <div class="card hover-border-primary">
                                                <div class="card-body">
                                                    <div class="heading mb-0 d-flex justify-content-between lh-1-25 mb-3">
                                                        <span>Tasks</span>
                                                        <i data-cs-icon="check-square" class="text-primary"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1">PENDING</div>
                                                    <div class="cta-1 text-primary">153</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-lg-3">
                                            <div class="card hover-border-primary">
                                                <div class="card-body">
                                                    <div class="heading mb-0 d-flex justify-content-between lh-1-25 mb-3">
                                                        <span>Notes</span>
                                                        <i data-cs-icon="file-empty" class="text-primary"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1">RECENT</div>
                                                    <div class="cta-1 text-primary">24</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-lg-3">
                                            <div class="card hover-border-primary">
                                                <div class="card-body">
                                                    <div class="heading mb-0 d-flex justify-content-between lh-1-25 mb-3">
                                                        <span>Views</span>
                                                        <i data-cs-icon="screen" class="text-primary"></i>
                                                    </div>
                                                    <div class="text-small text-muted mb-1">THIS MONTH</div>
                                                    <div class="cta-1 text-primary">524</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Stats End -->

                                <!-- Timeline Start -->
                                <h2 class="small-title">Timeline</h2>
                                <div class="card mb-5">
                                    <div class="card-body">
                                        <div class="row g-0">
                                            <div class="col-auto sw-1 d-flex flex-column justify-content-center align-items-center position-relative me-4">
                                                <div class="w-100 d-flex sh-1"></div>
                                                <div class="rounded-xl shadow d-flex flex-shrink-0 justify-content-center align-items-center">
                                                    <div class="bg-gradient-primary sw-1 sh-1 rounded-xl position-relative"></div>
                                                </div>
                                                <div class="w-100 d-flex h-100 justify-content-center position-relative">
                                                    <div class="line-w-1 bg-separator h-100 position-absolute"></div>
                                                </div>
                                            </div>
                                            <div class="col mb-4">
                                                <div class="h-100">
                                                    <div class="d-flex flex-column justify-content-start">
                                                        <div class="d-flex flex-column">
                                                            <a href="#" class="heading stretched-link">Developing Components</a>
                                                            <div class="text-alternate">21.12.2020</div>
                                                            <div class="text-muted mt-1">
                                                                Jujubes tootsie roll liquorice cake jelly beans pudding gummi bears chocolate cake donut. Jelly-o sugar plum fruitcake bonbon
                                                                bear claw cake cookie chocolate bar. Tiramisu soufflé apple pie.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row g-0">
                                            <div class="col-auto sw-1 d-flex flex-column justify-content-center align-items-center position-relative me-4">
                                                <div class="w-100 d-flex sh-1 position-relative justify-content-center">
                                                    <div class="line-w-1 bg-separator h-100 position-absolute"></div>
                                                </div>
                                                <div class="rounded-xl shadow d-flex flex-shrink-0 justify-content-center align-items-center">
                                                    <div class="bg-gradient-primary sw-1 sh-1 rounded-xl position-relative"></div>
                                                </div>
                                                <div class="w-100 d-flex h-100 justify-content-center position-relative">
                                                    <div class="line-w-1 bg-separator h-100 position-absolute"></div>
                                                </div>
                                            </div>
                                            <div class="col mb-4">
                                                <div class="h-100">
                                                    <div class="d-flex flex-column justify-content-start">
                                                        <div class="d-flex flex-column">
                                                            <a href="#" class="heading stretched-link pt-0">HTML Structure</a>
                                                            <div class="text-alternate">14.12.2020</div>
                                                            <div class="text-muted mt-1">
                                                                Pudding gummi bears chocolate chocolate apple pie powder tart chupa chups bonbon. Donut biscuit chocolate cake pie topping.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row g-0">
                                            <div class="col-auto sw-1 d-flex flex-column justify-content-center align-items-center position-relative me-4">
                                                <div class="w-100 d-flex sh-1 position-relative justify-content-center">
                                                    <div class="line-w-1 bg-separator h-100 position-absolute"></div>
                                                </div>
                                                <div class="rounded-xl shadow d-flex flex-shrink-0 justify-content-center align-items-center">
                                                    <div class="bg-gradient-primary sw-1 sh-1 rounded-xl position-relative"></div>
                                                </div>
                                                <div class="w-100 d-flex h-100 justify-content-center position-relative">
                                                    <div class="line-w-1 bg-separator h-100 position-absolute"></div>
                                                </div>
                                            </div>
                                            <div class="col mb-4">
                                                <div class="h-100">
                                                    <div class="d-flex flex-column justify-content-start">
                                                        <div class="d-flex flex-column">
                                                            <a href="#" class="heading stretched-link">Sass Structure</a>
                                                            <div class="text-alternate">03.11.2020</div>
                                                            <div class="text-muted mt-1">
                                                                Jelly-o wafer sesame snaps candy canes. Danish dragée toffee bonbon. Jelly-o marshmallow cake oat cake caramels jujubes.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row g-0">
                                            <div class="col-auto sw-1 d-flex flex-column justify-content-center align-items-center position-relative me-4">
                                                <div class="w-100 d-flex sh-1 position-relative justify-content-center">
                                                    <div class="line-w-1 bg-separator h-100 position-absolute"></div>
                                                </div>
                                                <div class="rounded-xl shadow d-flex flex-shrink-0 justify-content-center align-items-center">
                                                    <div class="bg-gradient-primary sw-1 sh-1 rounded-xl position-relative"></div>
                                                </div>
                                                <div class="w-100 d-flex h-100 justify-content-center position-relative">
                                                    <div class="line-w-1 bg-separator h-100 position-absolute"></div>
                                                </div>
                                            </div>
                                            <div class="col mb-4">
                                                <div class="h-100">
                                                    <div class="d-flex flex-column justify-content-start">
                                                        <div class="d-flex flex-column">
                                                            <a href="#" class="heading stretched-link pt-0">Final Design</a>
                                                            <div class="text-alternate">15.10.2020</div>
                                                            <div class="text-muted mt-1">Chocolate apple pie powder tart chupa chups bonbon. Donut biscuit chocolate cake pie topping.</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row g-0">
                                            <div class="col-auto sw-1 d-flex flex-column justify-content-center align-items-center position-relative me-4">
                                                <div class="w-100 d-flex sh-1 position-relative justify-content-center">
                                                    <div class="line-w-1 bg-separator h-100 position-absolute"></div>
                                                </div>
                                                <div class="rounded-xl shadow d-flex flex-shrink-0 justify-content-center align-items-center">
                                                    <div class="bg-gradient-primary sw-1 sh-1 rounded-xl position-relative"></div>
                                                </div>
                                                <div class="w-100 d-flex h-100 justify-content-center position-relative"></div>
                                            </div>
                                            <div class="col">
                                                <div class="h-100">
                                                    <div class="d-flex flex-column justify-content-start">
                                                        <div class="d-flex flex-column">
                                                            <a href="#" class="heading stretched-link pt-0">Wireframe Design</a>
                                                            <div class="text-alternate">08.06.2020</div>
                                                            <div class="text-muted mt-1">Chocolate apple pie powder tart chupa chups bonbon. Donut biscuit chocolate cake pie topping.</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Timeline End -->

                            </div>
                            <!-- Overview Tab End -->

                            <!-- Projects Tab Start -->
                            <div class="tab-pane fade" id="projectsTab" role="tabpanel">
                                <h2 class="small-title">Projects</h2>

                                <!-- Search Start -->
                                <div class="row mb-3 g-2">
                                    <div class="col mb-1">
                                        <div class="d-inline-block float-md-start me-1 mb-1 search-input-container w-100 shadow bg-foreground">
                                            <input class="form-control" placeholder="Search" />
                                            <span class="search-magnifier-icon">
                                                <i data-cs-icon="search"></i>
                                            </span>
                                            <span class="search-delete-icon d-none">
                                                <i data-cs-icon="close"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-auto text-end mb-1">
                                        <div class="dropdown-as-select d-inline-block" data-childselector="span">
                                            <button class="btn p-0 shadow" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="btn btn-foreground-alternate dropdown-toggle sw-13">All</span>
                                            </button>
                                            <div class="dropdown-menu shadow dropdown-menu-end">
                                                <a class="dropdown-item active" href="#">All</a>
                                                <a class="dropdown-item" href="#">Active</a>
                                                <a class="dropdown-item" href="#">Inactive</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Search End -->

                                <!-- Projects Content Start -->
                                <div class="row row-cols-1 row-cols-sm-2 g-2">
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">Basic Introduction to Bread Making</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 4</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-up" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Active</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="check-square" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Completed</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">4 Facts About Old Baking Techniques</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 3</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-up" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Active</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="clock" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Pending</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">Apple Cake Recipe for Starters</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 8</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="lock-on" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Locked</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="sync-horizontal" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Continuing</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">A Complete Guide to Mix Dough for the Molds</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 12</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-up" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Active</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="check-square" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Completed</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">14 Facts About Sugar Products</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 2</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-down" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Inactive</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="box" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Archived</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">Easy and Efficient Tricks for Baking Crispy Breads</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 2</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-up" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Active</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="clock" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Pending</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">Apple Cake Recipe for Starters</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 6</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-down" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Inactive</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="box" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Archived</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">Simple Guide to Mix Dough</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 22</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="lock-on" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Locked</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="check-square" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Completed</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">10 Secrets Every Southern Baker Knows</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 3</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-up" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Active</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="sync-horizontal" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Continuing</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">Recipes for Sweet and Healty Treats</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 1</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-down" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Inactive</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="clock" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Pending</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">Better Ways to Mix Dough for the Molds</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 20</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-up" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Active</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="clock" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Pending</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h6 class="heading mb-3">
                                                    <a href="#" class="stretched-link">
                                                        <span class="clamp-line sh-5" data-line="2">Introduction to Baking Cakes</span>
                                                    </a>
                                                </h6>
                                                <div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="diagram-2" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Contributors: 13</span>
                                                    </div>
                                                    <div class="mb-2">
                                                        <i data-cs-icon="trend-up" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Active</span>
                                                    </div>
                                                    <div>
                                                        <i data-cs-icon="check-square" class="text-muted me-2" data-cs-size="17"></i>
                                                        <span class="align-middle text-alternate">Completed</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Projects Content End -->
                            </div>
                            <!-- Projects Tab End -->                         

                            <!-- Friends Tab Start -->

                            <div class="tab-pane fade show active" id="friendsTab" role="tabpanel">
                                <c:if test="${hasPermission}">
                                    <h2 class="small-title">Your Ratings</h2>
                                    <c:if test="${!hasRated}">
                                        <div class="card mb-5">
                                            <div class="card-body">
                                                <!-- tooltip-label-end inputs should be wrapped in form-group class -->
                                                <form method="POST" action="RatingController?mentorId=${requestScope.mentor.id}&action=add">
                                                    <div class="mb-1">
                                                        <label class="d-block form-label">${sessionScope.user.fullName}</label>
                                                        <div class="br-wrapper br-theme-css-stars">
                                                            <div class="br-wrapper">
                                                                <select name="rating" autocomplete="off" id="ratingCSSIconInteractive" style="display: none;">
                                                                    <option value="1">1</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
                                                                </select>                                                       
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3 position-relative form-group">
                                                        <label class="form-label">Comment</label>
                                                        <textarea class="form-control error" rows="5" name="comment" required="true" aria-invalid="true" aria-describedby="basicValidationDetail-error"></textarea>                                                
                                                    </div>
                                                    <button type="submit" class="btn btn-primary mb-0">Add Rating</button>
                                                </form>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${hasRated}">
                                        <div class="card mb-5">
                                            <div class="card-body">
                                                <!-- tooltip-label-end inputs should be wrapped in form-group class -->                                                
                                                <div class="mb-1">
                                                    <label class="d-block form-label">${sessionScope.user.fullName}</label>
                                                    <div class="br-wrapper br-theme-css-stars">
                                                        <div class="br-wrapper">
                                                            <select name="rating" data-readonly="true" autocomplete="off" id="ratingCSSIconReadonly" style="display: none;">
                                                                <option value="1" ${currentUserRating.stars==1?'selected':''}>1</option>
                                                                <option value="2" ${currentUserRating.stars==2?'selected':''}>2</option>
                                                                <option value="3" ${currentUserRating.stars==3?'selected':''}>3</option>
                                                                <option value="4" ${currentUserRating.stars==4?'selected':''}>4</option>
                                                                <option value="5" ${currentUserRating.stars==5?'selected':''}>5</option>
                                                            </select>                                                       
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3 position-relative form-group">                                                        
                                                    <p>${currentUserRating.comment}</p>
                                                </div>
                                                <button class="btn btn-primary mb-0" onclick="editModal.show();">Edit Rating</button>
                                                <button class="btn btn-danger mb-0" onclick="deleteModal.show();">Delete Rating</button>    
                                            </div>
                                        </div>

                                    </c:if>
                                </c:if>
                                <div style="display: flex; justify-content: space-between">
                                    <h2 class="small-title">Other Ratings</h2>
                                    <div class="br-wrapper br-theme-css-stars">
                                        <select name="other-rating" autocomplete="off" data-readonly="true" id="avg">
                                            <option value="1" ${averageStars==1?'selected':''}>1</option>
                                            <option value="2" ${averageStars==2?'selected':''}>2</option>
                                            <option value="3" ${averageStars==3?'selected':''}>3</option>
                                            <option value="4" ${averageStars==4?'selected':''}>4</option>
                                            <option value="5" ${averageStars==5?'selected':''}>5</option>
                                        </select>
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
                                                <span class="align-middle">${requestScope.mentor.phone}</span>
                                            </a>
                                            <a href="#" class="d-block body-link">
                                                <i data-cs-icon="email" class="me-2" data-cs-size="17"></i>
                                                <span class="align-middle">${requestScope.mentor.email}</span>
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

                <!-- Delete Confirm Modal -->
                <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Confirm Deletion</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="RatingController?mentorId=${requestScope.mentor.id}&action=delete" method="POST">
                                    <div class="modal-body">
                                        Are you sure want to delete your rating & comment ?
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-danger" value="Delete">
                                        <button type="button" class="btn btn-link" style="color: #272727" data-bs-dismiss="modal">Cancel</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Edit Modal -->
                <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Edit Rating</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="card mb-5">
                                    <div class="card-body">
                                        <!-- tooltip-label-end inputs should be wrapped in form-group class -->     
                                        <form action="RatingController?mentorId=${requestScope.mentor.id}&action=edit" method="POST">
                                            <div class="mb-1">
                                                <label class="d-block form-label">${sessionScope.user.fullName}</label>
                                                <div class="br-wrapper br-theme-css-stars">
                                                    <div class="br-wrapper">
                                                        <select name="rating" data-readonly="true" autocomplete="off" id="ratingCSSIconInteractivez" style="display: none;">
                                                            <option value="1" ${currentUserRating.stars==1?'selected':''}>1</option>
                                                            <option value="2" ${currentUserRating.stars==2?'selected':''}>2</option>
                                                            <option value="3" ${currentUserRating.stars==3?'selected':''}>3</option>
                                                            <option value="4" ${currentUserRating.stars==4?'selected':''}>4</option>
                                                            <option value="5" ${currentUserRating.stars==5?'selected':''}>5</option>
                                                        </select>                                                       
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3 position-relative form-group">
                                                <label class="form-label">Comment</label>
                                                <textarea class="form-control error" rows="5" name="yourComment" required="true" aria-invalid="true" aria-describedby="basicValidationDetail-error">${currentUserRating.comment}</textarea>                                                
                                            </div>
                                            <button class="btn btn-primary mb-0" type="submit">Edit Rating</button> 
                                        </form>
                                    </div>
                                </div>
                            </div>
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
        <script src="js/vendor/jquery.barrating.min.js"></script>
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
        <script src="js/common.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Page Specific Scripts End -->
        <script>
                                                    const deleteModal = new bootstrap.Modal(document.getElementById('deleteConfirmModal'));
                                                    const editModal = new bootstrap.Modal(document.getElementById('editModal'));
                                                    jQuery('#ratingCSSIconInteractive').barrating();
                                                    jQuery('#ratingCSSIconInteractivez').barrating();
                                                    jQuery('#avg').barrating({
                                                        initialRating: null,
                                                        readonly: true,
                                                        showSelectedRating: true
                                                    });
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
