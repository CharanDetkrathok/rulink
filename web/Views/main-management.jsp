<%-- 
    Document   : management
    Created on : Jul 21, 2020, 9:16:29 AM
    Author     : RU-COM9
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="shortcut icon" href="./assets/img/ru.png"> 
</head>
<header>
    <%@include file="/Views/header.jsp" %>
</header>
<content>     
    <section class="content">
        
        <div class="jumbotron main-management-jumbotron">
            <h3>Management information: การจัดการข้อมูลสำหรับผู้ดูแลระบบ</h3>
        </div>

        <div class="content">
            <div class="row">
                <div class="col-6">
                    <div class="jumbotron main-management-jumbotron">
                        <h1 class="display-4">Hello, world!</h1>
                        <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
                        <hr class="my-4">
                        <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
                        <a class="btn btn-primary btn-lg" href="userManagement" role="button">จัดการข้อมูลผู้ใช้</a>
                    </div>
                </div>
            </div>
        </div>
        
    </section> 
</content>
<footer>
    <%@include file="/Views/footer.jsp" %>
</footer>
