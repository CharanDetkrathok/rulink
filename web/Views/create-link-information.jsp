<%-- 
    Document   : create-link-information
    Created on : Jul 31, 2020, 9:29:13 AM
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
                <li class="breadcrumb-item"><a href="mainManagement" class="item">หน้าหลัก</a></li>
                <li class="breadcrumb-item"><a href="linkManagement" class="item">จัดการลิ้งค์</a></li>
                <li class="breadcrumb-item " aria-current="page">เพิ่มลิ้งค์</li>
            </ol>
        </div>
        <div class="container">
            <div class="row create-user-header">
                <h3><b>Link Management : การจัดการข้อมูลลิ้งค์</b></h3>
            </div>
            <br>
            <div class="row create-user-wrapper">
                <div class="col-3"></div>
                <div class="col-6 create-user-content">
                    <div class="text-center">
                        <img src="./assets/img/ru.png" width="50vw" >
                        <h3 class="mt-1"><b>เพิ่มลิ้งค์</b></h3>
                    </div>
                    <form class="create-user-form" action="createLinkInformation" method="POST">
                        <div class="form-group">
                            <label for="">ชื่อลิ้งค์</label>
                            <input type="text" class="form-control" id="" placeholder="Link name" name="link_name">
                        </div>
                        <div class="form-group">
                            <label for="">URL</label>
                            <input type="text" class="form-control" id="" placeholder="Link URL" name="link_tag">
                        </div>
                        <div class="form-group">
                            <label for="">สังกัดคณะ</label>
                            <select class="form-control" id="" name="link_fac" required="true">
                                <c:forEach items="${fac}" var = "fac" >
                                    <option value="${fac.fac_No}">${fac.fac_Name}</option>                                        
                                </c:forEach>
                            </select>                            
                        </div>
                        <div class="form-group">
                            <label for="">รายละเอียดลิ้งค์</label>           
                            <textarea class="form-control" name="link_description" rows="4" cols="50"></textarea>
                        </div>        
                        <c:if test="${link_create_error != null}">
                            <div class="form-group">
                                <p style="color: red;">*** กรุณากรอกข้อมูลให้ครบถ้วน ! ***</p>
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