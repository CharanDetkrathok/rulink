
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="shortcut icon" href="./assets/img/ru.png">     
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.css"/>
    <link rel="stylesheet" href="./assets/css/dataTableStyle.css">
</head>
<header>
    <%@include file="/Views/header.jsp" %> 
</header>
<content>     
    <section class="content">

        <div class="container tb-wrapper">
            <div class="row tb-row">
                <div class="col-12">
                    <table id="datatable" class="table table-hover table-light table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">ลำดับ</th>
                                <th scope="col">ชื่อผู้ใช้งาน</th>
                                <th scope="col">รหัสผ่าน</th>
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
                                    <td>${user.passWord}</td>
                                    <td>${user.passWord}</td>
                                    <td><a class="btn btn-primary" href="#"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                                    <td><a class="btn btn-warning" href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                                    <td><a class="btn btn-danger" href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div>
            <p>
                Why do we use it?
                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                Why do we use it?
                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                Why do we use it?
                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                Why do we use it?
                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
            </p>
        </div>
    </section> 
</content>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#datatable').DataTable();
    });
</script>
<footer>
    <%@include file="/Views/footer.jsp" %>
</footer>
