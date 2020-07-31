<%-- 
    Document   : link-management
    Created on : Jul 21, 2020, 9:49:59 AM
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
            <div aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-menu">
                    <li class="breadcrumb-item"><a href="mainManagement" class="item">หน้าหลัก</a></li>
                    <li class="breadcrumb-item " aria-current="page">จัดการลิ้งค์</li>
                </ol>
            </div>
            <div class="user-management-btn form-inline">
                <h3><b>Link Management : การจัดการข้อมูลลิ้งค์ทั้งหมด</b></h3>
                <a class="btn btn-success ml-5" href="createLinkInformation"><i class="fa fa-plus-circle" aria-hidden="true"></i> เพิ่มลิ้งค์</a>
            </div>
            <div class="container tb-wrapper mt-2">
                <div class="row tb-row">
                    <div class="col-12">
                        <table id="datatable" class="table table-hover table-light table-bordered">
                            <thead class="thead-light">
                                <tr class="text-center">
                                    <th scope="col">ID</th>
                                    <th scope="col">ชื่อลิ้งค์</th>
                                    <th scope="col">URL</th>
                                    <th scope="col">สังกัด</th>
                                    <th scope="col">ดูรายละเอียด</th>
                                    <th scope="col">แก้ไข</th>
                                    <th scope="col">ลบ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${link}" var="link">
                                    <tr class="text-center">
                                        <td>
                                            ${link.link_Id}
                                        </td>
                                        <td>
                                            ${link.link_Name}
                                        </td>
                                        <td>
                                            ${link.link_Tag}
                                        </td>
                                        <td>
                                            <c:forEach items="${fac}" var = "fac" >
                                                <c:if test="${link.link_Fac == fac.fac_No}">
                                                    <p>${fac.fac_Name}</p>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <a class="btn btn-primary" href="detailUserInformation?userName=${user.userName}">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a class="btn btn-warning" href="editUserInformation?userName=${user.userName}">
                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a class="btn btn-danger" href="deleteUserInformation?userID=${user._id}" onclick="return confirm('คุณต้องการ ลบข้อมูลใช่หรือไม่?');">
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
    <script>
        if (${delete_message == 'true'}) {
            alert("ทำการลบข้อมูลเรียบร้อย...");
        } else if (${edit_user == 'true'}) {
            alert("ทำการแแก้ไขข้อมูลเรียบร้อย...");
        } else if (${create_user == 'true'}) {
            alert("ทำการเพิ่มข้อมูลเรียบร้อย...");
        }
    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.js"></script>
    <script type="text/javascript" src="./assets/js/dataTableJs.js"></script>
    <footer>
        <%@include file="/Views/footer.jsp" %>
    </footer>
