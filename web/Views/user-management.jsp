<%-- 
    Document   : user-management
    Created on : Jul 21, 2020, 9:50:30 AM
    Author     : RU-COM9
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="shortcut icon" href="./assets/img/ru.png">     
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.css"/>
    <link rel="stylesheet" href="./assets/css/dataTableStyle.css">
    <link rel="stylesheet" href="./assets/css/userManagementStyle.css">
</head>
<header>
    <%@include file="/Views/header.jsp" %>
</header>
<content>     
    <section class="content">
        <div>
            <h3><b>User Management : การจัดการข้อมูลผู้ใช้ระบบ</b></h3>
        </div>
        <div class="user-management-btn">
            <a class="btn btn-success" href="createUserInformation"><i class="fa fa-plus-circle" aria-hidden="true"></i> เพิ่มผู้ใช้</a>
        </div>
        <div class="container tb-wrapper mt-2">
            <div class="row tb-row">
                <div class="col-12">
                    <table id="datatable" class="table table-hover table-light table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">ลำดับ</th>
                                <th scope="col">ชื่อผู้ใช้งาน</th>
                                <th scope="col">รหัสผ่าน</th>
                                <th scope="col">สังกัด</th>
                                <th scope="col">สิทธิ์</th>
                                <th scope="col">วันที่เพิ่ม</th>
                                <th scope="col">วันที่แก้ไข</th>
                                <th scope="col">ดูรายละเอียด</th>
                                <th scope="col">แก้ไข</th>
                                <th scope="col">ลบ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${user}" var="user">
                                <tr class="text-center">
                                    <td>${user._id}</td>
                                    <td>${user.userName}</td>
                                    <td>${user.passWord}</td>
                                    <td>
                                        <c:forEach items="${fac}" var = "fac" >
                                            <c:if test="${fac.fac_No == user.facC}">
                                                ${fac.fac_Name}
                                            </c:if>    
                                        </c:forEach>
                                    </td>
                                    <td>${user.level_Status}</td>
                                    <td>${user.passWord}</td>
                                    <td>${user.passWord}</td>
                                    <td><a class="btn btn-primary" href="detailUserInformation?userName=${user.userName}"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                                    <td><a class="btn btn-warning" href="editUserInformation?userName=${user.userName}"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                                    <td><a class="btn btn-danger" href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section> 
</content>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.js"></script>
<script type="text/javascript" src="./assets/js/dataTableJs.js"></script>
<footer>
    <%@include file="/Views/footer.jsp" %>
</footer>
