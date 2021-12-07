<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Mentor List</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/mentor.css" rel="stylesheet" />
        
        
        
    </head>
    <body>
          <%--<%@include file="header.jsp" %>--%>
          
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="#!">Mentor List</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Mentor Register</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://i.doanhnhansaigon.vn/2019/10/13/vin4447-1570967950.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">Mentor of month</h1>
                    <p>Description about Mentor of month</p>
                    <a class="btn btn-primary" href="#!">See more info</a>
                </div>
            </div>
            <!-- 
            Call to Action
            -->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">This call to action card is a great place to showcase some important information or display a clever tagline!</p></div>
            </div>

            <div class="row gx-4 gx-lg-5">
                <c:forEach items="${listMentor}" var="i">
                    <div class="col-md-4 mb-5">
                        <div class="card h-100">
                            <div class="card-body">
                                <h2 class="card-title">${i.fullName}</h2>
                                <p class="card-text">${i.description}</p>
                            </div>
                            <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
             
            <c:if test="${listMentor.size() eq 0}">
                <p style="color: red; font-style: italic">No Result</p>
            </c:if>
            <c:if test="${listMentor.size() ne 0}">
                <div class="pagination">  
                    <span id="pagination-index" style="display:none">${pageIndex}</span>
                    <button onclick="pagingHandle(${pageIndex}, '${searchCode}')" class="${pageIndex==1? 'btn-current':'btn-success'} rounded-50">Preview</button>
                <c:if test="${pageIndex - 3 > 0}">...</c:if>
                <c:forEach begin="1" end="${maxPage}" step="1" var="x">
                    <c:if test="${pageIndex - 3 < x && x < pageIndex + 3}">
                        <button onclick="selectPage(${x}, ${searchCode})" class="${x == pageIndex? 'btn-current':'btn-success'} rounded-50">${x}</button>
                    </c:if>
                </c:forEach>
                <c:if test="${pageIndex + 2 < maxPage}">...</c:if>
                <button onclick="pagingHandle(${pageIndex}, '${searchCode}', ${maxPage})" class="${pageIndex==maxPage? 'btn-current':'btn-success'} rounded-50">Next</button>
            </div>
            </c:if>
            
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
