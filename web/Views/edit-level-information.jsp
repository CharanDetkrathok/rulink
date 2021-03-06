<%-- 
    Document   : edit-level-information
    Created on : Aug 5, 2020, 10:22:00 AM
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
        <div class="container" aria-label="breadcrumb">
            <div class="row">
                <ol class="breadcrumb breadcrumb-menu">
                    <li class="breadcrumb-item"><a href="mainManagement" class="item">หน้าหลัก</a></li>
                    <li class="breadcrumb-item" ><a href="levelManagement" class="item">จัดการสิทธิ์</a></li>
                    <li class="breadcrumb-item" aria-current="page">แก้ไขสิทธิ์</li>
                </ol>
            </div>
        </div>
        <div class="container">
            <div class="row create-user-header">
                <h3><b>Level Status Management : การจัดการสิทธิ์การเข้าถึงข้อมูล</b></h3>
            </div>
            <br>
            <div class="row create-user-wrapper">
                <div class="col-3"></div>
                <div class="col-6 create-user-content">
                    <div class="text-center">
                        <img src="./assets/img/ru.png" width="50vw" >
                        <h3 class="mt-1"><b>แก้ไขสิทธิ์</b></h3>
                    </div>
                    <form class="create-user-form" action="updateLevelInformation" method="POST">
                        <div class="form-group">
                            <label for="">ชื่อสิทธิ์การเข้าใช้งาน</label>
                            <c:choose>
                                <c:when test="${DUPLICATE_NAME_ERROR == true}">
                                    <p style="color: red;">*** ชื่อนี้มีอยู่แล้ว ! ***</p>
                                    <input type="text" class="form-control duplicate-error"  placeholder="Level Status name" name="level_name" value="${level.level_Name}"  style="border-color: red;" >
                                </c:when>    
                                <c:otherwise>
                                    <input type="text" class="form-control"  placeholder="Level Status name" name="level_name" value="${level.level_Name}" required="true">
                                </c:otherwise>
                            </c:choose>                            
                        </div>
                        <div class="form-group">
                            <label for="">รหัสสิทธิ์การเข้าใช้งาน</label>
                            <c:choose>
                                <c:when test="${DUPLICATE_NUMBER_ERROR == true}">
                                    <p style="color: red;">*** รหัสนี้มีอยู่แล้ว ! ***</p>
                                    <input type="text" class="form-control duplicate-error" placeholder="Level No." name="level_no" value="${level.level_No}"  style="border-color: red;" required="true">
                                </c:when>    
                                <c:otherwise>
                                    <input type="text" class="form-control"  placeholder="Level No." name="level_no" value="${level.level_No}" required="true">
                                </c:otherwise>
                            </c:choose>                            
                        </div>  
                        <div class="form-group" type="hidden" >
                            <input type="hidden" class="form-control" name="_id_" value="${ level.id_level }" height>
                        </div>
                        <c:if test="${LEVEL_MESSAGE_ERROR != null}">
                            <div class="form-group">
                                <p style="color: red;">*** กรุณากรอกข้อมูลให้ครบถ้วน ! ***</p>
                            </div>
                        </c:if>                       
                        <div class="float-right">
                            <button type="submit" name="submit" class="btn btn-success" onclick="return confirm('คุณต้องการ เพิ่มข้อมูลใช่หรือไม่?');">บันทึก</button>&nbsp;
                            <button type="reset" class="btn btn-warning">ยกเลิก</button>
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
