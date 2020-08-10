<%-- 
    Document   : faculty-management
    Created on : Aug 4, 2020, 10:56:06 AM
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
                        <li class="breadcrumb-item" aria-current="page">จัดการสังกัด</li>
                    </ol>
                </div>
            </div>
            <div class="container user-management-btn form-inline">
                <h3><b>Faculty Management : การจัดการข้อมูลสังกัด</b></h3>
                <a class="btn btn-success ml-5" href="createFacultyInformation"><i class="fa fa-plus-circle" aria-hidden="true"></i> เพิ่มสังกัด</a>
            </div>
            <div class="container tb-wrapper mt-2">
                <div class="row tb-row">
                    <div class="col-12">
                        <table id="datatable" class="table table-hover table-light table-bordered">
                            <thead class="thead-light">
                                <tr class="text-center">
                                    <th scope="col">ID</th>
                                    <th scope="col">ชื่อสังกัด</th>
                                    <th scope="col">รหัสสังกัด</th>
                                    <th scope="col">แก้ไข</th>
                                    <th scope="col">ลบ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${fac}" var="fac">
                                    <tr class="text-center">
                                        <td>
                                            ${fac.id_Fac}
                                        </td>
                                        <td>
                                            ${fac.fac_Name}
                                        </td>
                                        <td>
                                            ${fac.fac_No}
                                        </td>
                                        <td>
                                            <a class="btn btn-warning" href="updateFacultyInformation?facID=${fac.id_Fac}">
                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a class="btn btn-danger" href="deleteFacultyInformation?facID=${fac.id_Fac}" onclick="return confirm('คุณต้องการ ลบข้อมูลใช่หรือไม่?');">
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

