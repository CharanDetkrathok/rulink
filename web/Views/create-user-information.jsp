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
                    <form class="create-user-form">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">ชื่อผู้ใช้ระบบ</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">รหัสผ่าน</label>
                            <input type="password" class="form-control" id="exampleFormControlInput1" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">ยืนยันรหัสผ่าน</label>
                            <input type="password" class="form-control" id="exampleFormControlInput1" placeholder="Confirm Password">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">คณะที่ผู้ใช้ระบบสังกัดอยู่</label>
                            <select class="form-control" id="exampleFormControlSelect1">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">สิทธิ์การเข้าถึงข้อมูล</label>
                            <select class="form-control" id="exampleFormControlSelect1">
                                <option>(Admin) ผู้ดูแลระบบ</option>
                                <option>(User) ผู้ใช้งานทั่วไป</option>
                            </select>
                        </div>
                        <div class="float-right">
                            <button type="button" class="btn btn-success">บันทึก</button>
                            <button type="button" class="btn btn-warning">ยกเลิก</button>
                        </div>
                    </form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>       
    </section> 
</content>
<footer>
    <%@include file="/Views/footer.jsp" %>
</footer>