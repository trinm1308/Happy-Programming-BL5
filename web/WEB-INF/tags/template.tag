<%-- 
    Document   : template
    Created on : Aug 13, 2021, 9:00:03 PM
    Author     : TrungNM
--%>

<%@tag description="Boostrap Template" pageEncoding="UTF-8"%>
<%@attribute name="title"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${title}</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
        <link href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
        <link href="themes/krajee-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/select2.min.css" />
        <link rel="stylesheet" href="css/select2-bootstrap-5-theme.min.css" />
        <link rel="stylesheet" href="css/custom.css" />
        <style>
            .footer {
                position: fixed;
                background-color: red;
                bottom: 0px;
                left: 0px;
                right: 0px;
                margin-bottom: 0px;
            }
        </style>
    </head>
    <body>
        <header class="header">
            <nav class="navbar navbar-expand navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="#"><img src="data:image/png;base64,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" width="50px"></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="./">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Ưu đãi hôm nay</a>
                            </li>
                        </ul>
                        <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Đăng nhập</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Đăng ký</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <main class="py-5 main">
            <jsp:doBody/>
        </main>

        <footer class="text-white py-5 bg-dark footer">
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <h5 class="text-success text-center">THEO DÕI CHÚNG TÔI TRÊN</h5>
                        <nav class="nav flex-column">
                            <a class="nav-link text-center text-white" aria-current="page" href="#"><i class="fab fa-facebook fa-2x"></i></a>
                            <a class="nav-link text-center text-white" aria-current="page" href="#"><i class="fab fa-youtube fa-2x"></i></a>
                            <a class="nav-link text-center text-white" aria-current="page" href="#"><i class="fab fa-twitter fa-2x"></i></a>
                        </nav>
                    </div>
                    <div class="col-4">
                        <h5 class="text-success text-center">VỀ FEAST BOOKING</h5>
                        <nav class="nav flex-column">
                            <a class="nav-link text-center text-white pb-0" aria-current="page" href="#">Cách đặt tiệc</a>
                            <a class="nav-link text-center text-white py-0" aria-current="page" href="#">Liên hệ với chúng tôi</a>
                            <a class="nav-link text-center text-white py-0" aria-current="page" href="#">Tuyển dụng</a>
                            <a class="nav-link text-center text-white py-0" aria-current="page" href="#">Về chúng tôi</a>
                        </nav>
                    </div>
                    <div class="col-4">
                        <h5 class="text-success text-center">TRỢ GIÚP</h5>
                        <nav class="nav flex-column">
                            <a class="nav-link text-center text-white pb-0" aria-current="page" href="#">Trung tâm trợ giúp</a>
                            <a class="nav-link text-center text-white py-0" aria-current="page" href="#">Câu hỏi thường gặp</a>
                            <a class="nav-link text-center text-white py-0" aria-current="page" href="#">Chính sách bảo mật</a>
                            <a class="nav-link text-center text-white py-0" aria-current="page" href="#">Điều khoản sử dụng</a>
                        </nav>
                    </div>
                </div>
            </div>
        </footer>
        <footer class="text-white py-2 footer" style="background: #000">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <p class="m-0 text-center">&copy; 2021 Feast Booking. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </footer>
        <script src="js/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
        <script src="js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/star-rating.js" type="text/javascript"></script>
        <script src="themes/krajee-fas/theme.js" type="text/javascript"></script>
        <script src="js/select2.full.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
