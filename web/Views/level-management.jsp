<%-- 
    Document   : level-management
    Created on : Aug 5, 2020, 10:20:53 AM
    Author     : RU-COM9
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
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
            <div class="container" aria-label="breadcrumb">
                <div class="row">
                    <ol class="breadcrumb breadcrumb-menu">
                        <li class="breadcrumb-item"><a href="mainManagement" class="item">หน้าหลัก</a></li>
                        <li class="breadcrumb-item" aria-current="page">จัดการสิทธิ์</li>
                    </ol>
                </div>
            </div>
            <div class="container user-management-btn form-inline">
                <h3><b>Level Status Management : การจัดการสิทธิ์การเข้าถึงข้อมูล</b></h3>
                <a class="btn btn-success ml-5" href="createLevelInformation"><i class="fa fa-plus-circle" aria-hidden="true"></i> เพิ่มสิทธิ์</a>
            </div>
            <div class="container tb-wrapper mt-2">
                <div class="row tb-row">
                    <div class="col-12">
                        <table id="datatable" class="table table-hover table-light table-bordered">
                            <thead class="thead-light">
                                <tr class="text-center">
                                    <th scope="col">ID</th>
                                    <th scope="col">ชื่อสถานะ</th>
                                    <th scope="col">สิทธิ์การเข้าถึง</th>
                                    <th scope="col">แก้ไข</th>
                                    <th scope="col">ลบ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${level}" var="level">
                                    <tr class="text-center">
                                        <td>
                                            ${level.id_level}
                                        </td>
                                        <td>
                                            ${level.level_Name}
                                        </td>
                                        <td>
                                            ${level.level_No}
                                        </td>
                                        <td>
                                            <a class="btn btn-warning" href="updateLevelInformation?levelID=${level.id_level}">
                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a class="btn btn-danger" href="deleteLevelInformation?levelID=${level.id_level}" onclick="return confirm('คุณต้องการ ลบข้อมูลใช่หรือไม่?');">
                                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                                            </a>
                                        </td>
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

