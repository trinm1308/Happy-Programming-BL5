<%-- 
    Document   : homepage
    Created on : Sep 24, 2021, 2:21:52 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <title>User Profile</title>
        <meta name="description" content="Service Provider Settings" />

        <!-- Favicon Tags Start -->
        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="images/favicon/apple-touch-icon-57x57.png" />
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/favicon/apple-touch-icon-114x114.png" />
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/favicon/apple-touch-icon-72x72.png" />
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/favicon/apple-touch-icon-144x144.png" />
        <link rel="apple-touch-icon-precomposed" sizes="60x60" href="images/favicon/apple-touch-icon-60x60.png" />
        <link rel="apple-touch-icon-precomposed" sizes="120x120" href="images/favicon/apple-touch-icon-120x120.png" />
        <link rel="apple-touch-icon-precomposed" sizes="76x76" href="images/favicon/apple-touch-icon-76x76.png" />
        <link rel="apple-touch-icon-precomposed" sizes="152x152" href="images/favicon/apple-touch-icon-152x152.png" />
        <link rel="icon" type="image/png" href="images/favicon/favicon-196x196.png" sizes="196x196" />
        <link rel="icon" type="image/png" href="images/favicon/favicon-96x96.png" sizes="96x96" />
        <link rel="icon" type="image/png" href="images/favicon/favicon-32x32.png" sizes="32x32" />
        <link rel="icon" type="image/png" href="images/favicon/favicon-16x16.png" sizes="16x16" />
        <link rel="icon" type="image/png" href="images/favicon/favicon-128.png" sizes="128x128" />
        <meta name="application-name" content="&nbsp;" />
        <meta name="msapplication-TileColor" content="#FFFFFF" />
        <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png" />
        <meta name="msapplication-square70x70logo" content="images/favicon/mstile-70x70.png" />
        <meta name="msapplication-square150x150logo" content="images/favicon/mstile-150x150.png" />
        <meta name="msapplication-wide310x150logo" content="images/favicon/mstile-310x150.png" />
        <meta name="msapplication-square310x310logo" content="images/favicon/mstile-310x310.png" />
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
        <link rel="stylesheet" href="css/vendor/select2.min.css" />
        <link rel="stylesheet" href="css/vendor/select2-bootstrap4.min.css" />
        <!-- Vendor Styles End -->
        <!-- Template Base Styles Start -->
        <link rel="stylesheet" href="css/styles.css" />
        <!-- Template Base Styles End -->

        <link rel="stylesheet" href="css/main.css" />
        <script src="js/base/loader.js"></script>
    </head>
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        #main{

        }
        #header{
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 50px;
            background-color: #21130d;
        }
        #nav{

        }
        #nav li{
            display: inline-block;
        }
        #nav li a{
            color: #fff;
            text-decoration: none;
            line-height: 50px;
            padding: 0 25px;
            display: inline-block;

        }
        #nav li:hover a{
            color: #000;
            background-color: #ccc;
        }
        html{
            font-family: Arial;
        }
        #slider{
            position: relative;
            margin-top: 50px;
            padding-top: 65%;
          background: url("../img/background/background-blue.jpg") no-repeat center center fixed;
        }
        #slider .text-content{
            position: absolute;
            bottom: 700px;
            color: #fff;
            left: 0;
            right: 0;

            text-align: center;
        }
        #slider .text-heading{
            font-weight: 400;
            font-size: 30px;
        }
        #slider .text-description{
            font-size: 20px;
        }
        #footer{
            padding: 60px 20px;
            text-align: center;
            background-color: #21130d;
            color: #fff;
        }
        .avatar {
            vertical-align: middle;
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }
    </style>
    <body>
        <div id="main">
            <div id="header">
                <ul id=nav>
                    <li><a href="homepage.jsp">Happy Programming</a></li>
                        <c:if test="${sessionScope.user==null}">
                    </c:if>

                    <c:if test="${sessionScope.user!=null}">
                        <li><a href="#" style="padding-right:0">Hello: ${sessionScope.user.account}                              
                            </a></li>
                        <!-- Phân quyền cho mentee = 1-->
                        <c:if test="${sessionScope.user.role==1}">
                            <li><a href="RequestController?service=statisticRequestAfter">Mentee Dashboard</a></li>
                            </c:if>

                            <!-- Phân quyền cho mentor = 0-->
                            <c:if test="${sessionScope.user.role==0}">
                            <li><a href="changepass.jsp">Change Password</a></li>
                            </c:if>
                            <li><a href="LogoutServlet">Logout</a>
                            <!-- Phân quyền cho admin = 2--> 
                            <c:if test="${sessionScope.user.role==2}">
                            <li><a href="template.jsp">Admin Dasboard</a></li>
                            </c:if>

                        <c:if test="${sessionScope.user.role==0}">
                            <li><a href="UserController?service=logout">List Mentor</a></li>

                        </c:if>

                    </c:if>

                </ul>
            </div>

            <div id=slider>
                <div class="text-content">
                    <h2 class="text-heading">What Are The Advantages Of Online Learning?</h2>
                    <div class="text-description">1. Efficiency
                        Online learning offers teachers an efficient way to deliver lessons to students. Online learning has a number of tools such as videos, PDFs, podcasts, and teachers can use all these tools as part of their lesson plans. By extending the lesson plan beyond traditional textbooks to include online resources, teachers are able to become more efficient educators.
                    </div>
                </div>
            </div>
            <div id="content">
            </div>
            <div id="footer">
                <div>©2021 Web học lập trình uy tín hàng đầu Việt Nam - Được tài trợ bởi SWP291</div>
            </div>
        </div>

    </body>
</html>