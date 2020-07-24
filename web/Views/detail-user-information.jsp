<%-- 
    Document   : user-data-detail
    Created on : Jul 22, 2020, 2:18:13 PM
    Author     : RU-COM9
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="shortcut icon" href="./assets/img/ru.png"> 
    <link rel="stylesheet" href="./assets/css/userManagementStyle.css">   
</head>
<header>
    <%@include file="/Views/header.jsp" %>
</header>
<content>     
    <section class="content">
        <div class="container">
            <div class="row create-user-header">
                <h3><b>User Management : การจัดการข้อมูลผู้ใช้ระบบ</b></h3>
            </div>
            <br>
            <div class="row create-user-wrapper">
                <div class="col-2"></div>
                <div class="col-8 create-user-content">
                    <div class="text-center">
                        <img src="./assets/img/ru.png" width="50vw" >
                        <h3 class="mt-1">ข้อมูลผู้ใช้ระบบ</h3>
                    </div>
                    <div class="mt-5 ml-4">
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>ลำดับ id :</b></label>
                            <p class="mt-3 ml-3">${ user._id }</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>ชื่อผู้ใช้ระบบ :</b></label>
                            <p class="mt-3 ml-3">${ user.userName }</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>รหัสผ่าน :</b></label>
                            <p class="mt-3 ml-3">${ user.passWord }</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>คณะที่ผู้ใช้ระบบสังกัดอยู่ :</b></label>
                            <p class="mt-3 ml-3">${ fac.fac_Name }</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>สิทธิ์การเข้าถึงข้อมูล :</b></label>
                            <p class="mt-3 ml-3">${ level.level_Name }</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>วันที่สร้าง Account :</b></label>
                            <p class="mt-3 ml-3">00-00-0000</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>วันที่แก้ไข Account :</b></label>
                            <p class="mt-3 ml-3">00-00-0000</p>
                        </div>
                        <hr>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
        </div>       
    </section> 
</content>
<footer>
    <%@include file="/Views/footer.jsp" %>
</footer>