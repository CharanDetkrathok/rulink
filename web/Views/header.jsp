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

        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    </head>
    <body>
        <header>
            <div class="header-banner">
                <img src="./assets/img/ru.png" class="ru-logo">
                <h1 class="h1-b0">RU-Link</h1>
                <h2 class="h2-b1">เว็ปไซต์สำหรับรวบรวม Link ของ</h2>
                <h2 class="h2-b2">มหาวิทยาลัยรามคำแหง เพื่อการจัดการภายใน</h2>
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
                            <li><b class="" style="color: #ffe254;"> | </b></li>
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
                            <li class="user-page"><b>ยินดีต้อนรับ</b></li>
                            <li><b><font class="logout-username">${session_user.userName}</font></b></li>
                            <li><b class="" style="color: #ffe254;"> | </b></li>
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
       



