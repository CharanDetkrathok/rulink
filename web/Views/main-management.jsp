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
        <div class="container-main-wrap">
            <div class="row">
                <div class="col-12  mt-5">
                    <div class="jumbotron main-management-jumbotron text-center">
                        <h3><b>Management information : การจัดการข้อมูลสำหรับผู้ดูแลระบบ</b></h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="jumbotron main-management-jumbotron">
                        <h5 class="display-5"><b>User Management : จัดการผู้ใช้งาน</b></h5>
                        <p class="lead">ผู้ดูแลระบบสามารถทำการเพิ่มข้อมูล ดูรายละเอียดข้อมูล แก้ไขข้อมูล และลบข้อมูลได้</p>
                        <hr class="my-4">
                        <a class="btn btn-primary-click btn-block btn-lg" href="userManagement" role="button">จัดการข้อมูลผู้ใช้</a>
                    </div>
                </div>
                <div class="col-6">
                    <div class="jumbotron main-management-jumbotron">
                        <h5 class="display-5"><b>Faculty Management : การจัดการข้อมูลสังกัด</b></h5>
                        <p class="lead">ผู้ดูแลระบบสามารถทำการเพิ่มข้อมูล แก้ไขข้อมูล และลบข้อมูลได้</p>
                        <hr class="my-4">
                        <a class="btn btn-primary-click btn-block btn-lg" href="facultyManagement" role="button">จัดการข้อมูลสังกัด</a>
                    </div>
                </div>
            </div>
            <div class="row">               
                <div class="col-6">
                    <div class="jumbotron main-management-jumbotron">
                        <h5 class="display-5"><b>Link Management : การจัดการข้อมูลลิ้งค์ทั้งหมด</b></h5>
                        <p class="lead">ผู้ดูแลระบบสามารถทำการเพิ่มข้อมูล ดูรายละเอียดข้อมูล แก้ไขข้อมูล และลบข้อมูลได้</p>
                        <hr class="my-4">
                        <a class="btn btn-primary-click btn-block btn-lg" href="linkManagement" role="button">จัดการข้อมูลลิ้งค์</a>
                    </div>
                </div>         
                <div class="col-6">
                    <div class="jumbotron main-management-jumbotron">
                        <h5 class="display-5"><b>Level Status Management : การจัดการสิทธิ์การเข้าถึงข้อมูล</b></h5>
                        <p class="lead">ผู้ดูแลระบบสามารถทำการเพิ่มข้อมูล แก้ไขข้อมูล และลบข้อมูลได้</p>
                        <hr class="my-4">
                        <a class="btn btn-primary-click btn-block btn-lg" href="levelManagement" role="button">จัดการข้อมูลสิทธิ์</a>
                    </div>
                </div>                
            </div>
        </div>

    </section> 
</content>
<footer>
    <%@include file="/Views/footer.jsp" %>
</footer>
