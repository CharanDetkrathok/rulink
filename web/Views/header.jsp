<%-- 
    Document   : header
    Created on : Jul 14, 2020, 1:41:09 AM
    Author     : RU-COM9
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="th">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RU-Link</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./assets/css/headerStyle.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    </head>
    <body>
        <header>
            <div class="header-banner form-inline col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <img class="col-12 col-sm-10 col-md-2 col-lg-2 col-xl-2" src="./assets/img/ru.png" style="margin:0 2vw 0 10vw; max-width: 15vw;">
                <div class="">
                    <div class="b0" style="font-size:5vw;">
                        <b>RU-Link</b>
                    </div>
                    <div class="b1" style="font-size:3vw;">
                        <b>เว็ปไซต์สำหรับรวบรวม Link ของ</b>
                    </div>
                    <div class="b2" style="font-size:3vw;">
                        <b>มหาวิทยาลัยรามคำแหง เพื่อการจัดการภายใน</b>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <nav>
                <div class="site-title form-inline">
                    <img src="./assets/img/ru.png" class="ru-logo-title">
                    <p class="logo-ru-link-p-tag">RU-Link</p>
                </div>
                <c:choose>
                    <c:when test="${session_user.level_Status == '1'}">
                        <ul id="btn-active-button-group">
                            <li><a class="btn-active-button" href="mainManagement">หน้าหลัก</a></li>
                            <li><a class="btn-active-button" href="userManagement">จัดการผู้ใช้งาน</a></li>
                            <li><a class="btn-active-button" href="linkManagement">จัดการลิ้งค์</a></li>                            
                            <li><a class="btn-active-button" href="facultyManagement">จัดการสังกัด</a></li>
                            <li><a class="btn-active-button" href="levelManagement">จัดการสิทธิ์</a></li>
                            <li><b class=""> | </b></li>
                            <li>
                                <font class="logout-username"><b>${session_user.userName}</b></font>&nbsp;
                                <a href="Logout" class="logout-now" onclick="return confirm('คุณต้องการ ออกจากระบบ ใช่หรือไม่ ?');">
                                    <i class="fa fa-power-off" aria-hidden="true" ></i>&nbsp;ออกจากระบบ
                                </a>
                            </li>
                        </ul>
                    </c:when>    
                    <c:otherwise>
                        <ul id="btn-active-button-group">
                            <li class="user-page">ยินดีต้อนรับ</li>
                            <li><b><font class="logout-username">${session_user.userName}</font></b></li>
                            <li><b class=""> | </b></li>
                            <li>                                
                                <a href="Logout" class="logout-now" onclick="return confirm('คุณต้องการ ออกจากระบบ ใช่หรือไม่ ?');">                                    
                                    <i class="fa fa-power-off" aria-hidden="true" ></i>&nbsp; ออกจากระบบ
                                </a>
                            </li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </nav>
        </header>
        <script src="./assets/js/headerJs.js" type="text/javascript"></script>
        <script src="./assets/js/activeMenuJs.js" type="text/javascript"></script>





