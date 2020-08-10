<%-- 
    Document   : detail-link-information
    Created on : Aug 3, 2020, 2:01:56 PM
    Author     : RU-COM9
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

        <div class="container" aria-label="breadcrumb">
            <div class="row">
                <ol class="breadcrumb breadcrumb-menu">
                    <li class="breadcrumb-item"><a href="mainManagement">หน้าหลัก</a></li>
                    <li class="breadcrumb-item"><a href="linkManagement">จัดการลิ้งค์</a></li>
                    <li class="breadcrumb-item " aria-current="page">ข้อมูลรายละเอียด Link URL</li>
                </ol>
            </div>
        </div>

        <div class="container">            
            <div class="row create-user-header">
                <h3><b>User Management : การจัดการข้อมูลลิ้งค์</b></h3>
            </div>
            <br>
            <div class="row create-user-wrapper">
                <div class="col-2"></div>
                <div class="col-8 create-user-content">
                    <div class="text-center">
                        <img src="./assets/img/ru.png" width="50vw" >
                        <h3 class="mt-1">ข้อมูลลิ้งค์</h3>
                    </div>
                    <div class="mt-5 ml-4">
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>ลำดับ id :</b></label>
                            <p class="mt-3 ml-3">${ link.link_Id }</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>ชื่อลิ้งค์ :</b></label>
                            <p class="mt-3 ml-3">${ link.link_Name }</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>URL :</b></label>
                            <p class="mt-3 ml-3">${ link.link_Tag }</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>คณะที่ผู้ใช้ระบบสังกัดอยู่ :</b></label>
                            <p class="mt-3 ml-3">${ fac.fac_Name }</p>
                        </div>
                        <hr>
                        <div class="form-inline">
                            <label for=""><b>รายละเอียด :</b></label>
                            <p class="mt-3 ml-3">${ link.link_Description }</p>
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