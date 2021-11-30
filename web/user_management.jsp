<%-- 
    Document   : template
    Created on : Oct 13, 2021, 11:16:31 PM
    Author     : Tri
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Boostrap CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--Boostrap JS-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <!--Boostrap Table CSS-->
        <link rel="stylesheet" href="http://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">

        <!--Boostrap Table JS-->
        <script src="http://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

        <title>Happy Programming</title>

        <!--Custom CSS-->
        <link rel="stylesheet" href="css/template.css" />
    </head>
    <body>
        <div class="body-container">
            <%@include file="header.jsp" %>
            <!--Thay code vao day-->
            <div class="main-content">
                <div class="mentor-table-container">
                    <h2>Mentor List</h2>
                    <table id="example" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Account</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Gender</th>
                                <th>Address</th>
                                <!--<th>Action</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <th>${user.id}</th>
                                    <th>${user.fullName}</th>
                                    <th>${user.account}</th>
                                    <th>${user.email}</th>
                                    <th>${user.phone}</th>
                                    <th>
                                        <c:choose >
                                            <c:when test="${user.gender == true}">Male</c:when>
                                            <c:when test="${user.gender == false}">Female</c:when>
                                        </c:choose>

                                    </th>
                                    <th>${user.address}</th>
                                    <!--<th><a style="color: red; cursor: pointer" onclick="setConfirmModal(${user.id}, '${user.fullName}')">Demote</a></th>-->
                                </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </body>
</html>
