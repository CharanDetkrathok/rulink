<%-- 
    Document   : create-user-information
    Created on : Jul 22, 2020, 2:22:53 PM
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
        <div aria-label="breadcrumb">
            <ol class="breadcrumb breadcrumb-menu">
                <li class="breadcrumb-item"><a href="mainManagement">หน้าหลัก</a></li>
                <li class="breadcrumb-item"><a href="userManagement">จัดการผู้ใช้งาน</a></li>
                <li class="breadcrumb-item " aria-current="page">เพิ่มผู้ใช้งาน</li>
            </ol>
        </div>
        <div class="container">
            <div class="row create-user-header">
                <h3><b>User Management : การจัดการข้อมูลผู้ใช้ระบบ</b></h3>
            </div>
            <br>
            <div class="row create-user-wrapper">
                <div class="col-3"></div>
                <div class="col-6 create-user-content">
                    <div class="text-center">
                        <img src="./assets/img/ru.png" width="50vw" >
                        <h3 class="mt-1"><b>เพิ่มผู้ใช้ระบบ</b></h3>
                    </div>
                    <form class="create-user-form" action="createUserInformation" method="POST">
                        <div class="form-group">
                            <label for="">ชื่อผู้ใช้ระบบ</label>
                            <input type="text" class="form-control" id="" placeholder="Username" name="username">
                        </div>
                        <div class="form-group">
                            <label for="">รหัสผ่าน</label>
                            <div class="input-group" id="show_hide_password">
                                <input type="password" class="form-control" id="" placeholder="Password" name="password" aria-describedby="basic-addon1">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button">
                                        <i class="fa fa-eye-slash" aria-hidden="true"></i>
                                    </button>                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">ยืนยันรหัสผ่าน</label>           
                            <div class="input-group" id="show_hide_confirm_password">
                                <input type="password" class="form-control" id="" placeholder="Confirm Password" name="confirm_password" aria-describedby="basic-addon1">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button">
                                        <i class="fa fa-eye-slash" aria-hidden="true"></i>
                                    </button>                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">คณะที่ผู้ใช้ระบบสังกัดอยู่</label>
                            <select class="form-control" id="" name="fac" required="true">
                                <c:forEach items="${fac}" var = "fac" >
                                    <c:choose>
                                        <c:when test="${fac.fac_No == user.facC}">
                                            <option value="${fac.fac_No}" selected>${fac.fac_Name}</option>
                                        </c:when>    
                                        <c:otherwise>
                                            <option value="${fac.fac_No}">${fac.fac_Name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>                            
                        </div>
                        <div class="form-group">
                            <label for="">สิทธิ์การเข้าถึงข้อมูล</label>
                            <select class="form-control" id="" name="level" required="true">
                                <c:forEach items="${level}" var = "level" >
                                    <c:choose>
                                        <c:when test="${level.level_No == user.level_Status}">
                                            <option value="${level.level_No}" selected>${level.level_Name}</option>
                                        </c:when>    
                                        <c:otherwise>
                                            <option value="${level.level_No}">${level.level_Name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <c:if test="${error_confirm_password != null}">
                            <div class="form-group">
                                <p style="color: red;">*** Password ไม่ตรงกัน ! ***</p>
                            </div>
                        </c:if>
                        <div class="float-right">
                            <button type="submit" class="btn btn-success" onclick="return confirm('คุณต้องการ เพิ่มข้อมูลใช่หรือไม่?');">บันทึก</button>
                            <button type="reset" class="btn btn-warning">ยกเลิก</button>
                        </div>
                    </form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>       
    </section> 
</content>
<script type="text/javascript" src="./assets/js/hiddenPasswordJs.js"></script>
<footer>
    <%@include file="/Views/footer.jsp" %>
</footer>