<%-- 
    Document   : create-faculty-information
    Created on : Aug 4, 2020, 10:56:57 AM
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
                    <li class="breadcrumb-item" ><a href="facultyManagement" class="item">จัดการสังกัด</a></li>
                    <li class="breadcrumb-item" aria-current="page">เพิ่มสังกัด</li>
                </ol>
            </div>
        </div>
        <div class="container">
            <div class="row create-user-header">
                <h3><b>Faculty Management : การจัดการข้อมูลสังกัด</b></h3>
            </div>
            <br>
            <div class="row create-user-wrapper">
                <div class="col-3"></div>
                <div class="col-6 create-user-content">
                    <div class="text-center">
                        <img src="./assets/img/ru.png" width="50vw" >
                        <h3 class="mt-1"><b>เพิ่มสังกัด</b></h3>
                    </div>
                    <form class="create-user-form" action="createFacultyInformation" method="POST">
                        <div class="form-group">
                            <label for="">ชื่อสังกัด</label>
                            <c:choose>
                                <c:when test="${DUPLICATE_NAME_ERROR == true}">
                                    <p style="color: red;">*** ชื่อสังกัดนี้มีอยู่แล้ว ! ***</p>
                                    <input type="text" class="form-control duplicate-error"  placeholder="Faculty name" name="fac_name" value="${facName.fac_Name}" required="true" style="border-color: red;">
                                </c:when>    
                                <c:otherwise>
                                    <input type="text" class="form-control"  placeholder="Faculty name" name="fac_name" required="true">
                                </c:otherwise>
                            </c:choose>                            
                        </div>
                        <div class="form-group">
                            <label for="">รหัสสังกัด</label>
                            <c:choose>
                                <c:when test="${DUPLICATE_NUMBER_ERROR == true}">
                                    <p style="color: red;">*** รหัสสังกัดนี้มีอยู่แล้ว ! ***</p>
                                    <input type="text" class="form-control duplicate-error" placeholder="Faculty No." name="fac_no" value="${facNo.fac_No}" required="true" style="border-color: red;">
                                </c:when>    
                                <c:otherwise>
                                    <input type="text" class="form-control"  placeholder="Faculty No." name="fac_no" required="true">
                                </c:otherwise>
                            </c:choose>                            
                        </div>                       
                        <c:if test="${FAC_MESSAGE_ERROR != null}">
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
