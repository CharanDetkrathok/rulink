<%-- 
    Document   : user-management
    Created on : Jul 21, 2020, 9:50:30 AM
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
                    <li class="breadcrumb-item " aria-current="page">จัดการผู้ใช้งาน</li>
                </ol>
            </div>
            <div class="user-management-btn form-inline">
                <h3><b>User Management : การจัดการข้อมูลผู้ใช้ระบบ</b></h3>
                <a class="btn btn-success ml-5" href="createUserInformation"><i class="fa fa-plus-circle" aria-hidden="true"></i> เพิ่มผู้ใช้</a>
            </div>
            <div class="container tb-wrapper mt-2">
                <div class="row tb-row">
                    <div class="col-12">
                        <table id="datatable" class="table table-hover table-light table-bordered">
                            <thead class="thead-light">
                                <tr class="text-center">
                                    <th scope="col">ID</th>
                                    <th scope="col">ชื่อผู้ใช้งาน</th>
                                    <th scope="col">สังกัด</th>
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
                                        <td>
                                            ${user._id}
                                        </td>
                                        <td>
                                            ${user.userName}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.facC != 0}">
                                                    <c:forEach items="${fac}" var = "fac" >
                                                        <c:if test="${user.facC == fac.fac_No}">
                                                            <p>${fac.fac_Name}</p>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>   
                                                <c:otherwise>
                                                    <p>ผู้ดูแลระบบ</p>
                                                </c:otherwise>
                                            </c:choose> 
                                        </td>
                                        <td>
                                            <fmt:formatDate pattern = "dd-MM-yyyy" value = "${user.insert_Date}"/>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${empty user.update_Date}">
                                                    <p>ยังไม่มีการแก้ไขข้อมูล</p>
                                                </c:when>    
                                                <c:otherwise>
                                                    <fmt:formatDate pattern = "dd-MM-yyyy" value = "${user.update_Date}"/>
                                                </c:otherwise>
                                            </c:choose>                                            
                                        </td>
                                        <td>
                                            <a class="btn btn-primary" href="detailUserInformation?userName=${user.userName}">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a class="btn btn-warning" href="updateUserInformation?userName=${user.userName}">
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
    <script src="./assets/js/activeMenuJs.js" type="text/javascript"></script>
    <footer>
        <%@include file="/Views/footer.jsp" %>
    </footer>
