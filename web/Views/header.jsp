<%-- 
    Document   : header
    Created on : Jul 14, 2020, 1:41:09 AM
    Author     : RU-COM9
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RU-Link</title>
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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
                <h1>RU-Link</h1>
                <h2 class="h2-b1">เว็ปไซต์สำหรับรวบรวม Link ของ</h2>
                <h2 class="h2-b2">มหาวิทยาลัยรามคำแหง เพื่อการจัดการภายใน</h2>
            </div>
            <div class="clear"></div>
            <nav>
                <div class="site-title form-inline">
                    <img src="./assets/img/ru.png" class="ru-logo-title">
                    <p>RU-Link</p>
                </div>
                <ul>
                    <li><a href="#">หน้าหลัก</a></li>
                    <li><a href="#">จัดการลิ้งค์</a></li>
                    <li><a href="#">จัดการผู้ใช้งาน</a></li>
                    <li><a href="#">จัดการ Event-Log</a></li>
                    <li><b style="color: #ffe254;"> | </b></li>
                    <li class="logout-now">
                        ${user.userName}
                        <a href="Logout" class="logout-now" onclick="return confirm('คุณต้องการ ออกจากระบบ ใช่หรือไม่ ?');">                                    
                            <i class="fa fa-power-off" aria-hidden="true"> &nbsp;ออกจากระบบ</i>
                        </a>
                    </li>
                </ul>
            </nav>
        </header>
        <script src="./assets/js/headerJs.js" type="text/javascript"></script>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

