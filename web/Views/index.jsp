
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="shortcut icon" href="./assets/img/ru.png">     
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.css"/>
    <link rel="stylesheet" href="./assets/css/dataTableStyle.css">
    <link rel="stylesheet" href="./assets/css/indexStyle.css">
</head>
<header>
    <%@include file="/Views/header.jsp" %> 
</header>
<content>     
    <section class="content">
        <div class="index-header">
            <h3><b>Link : เพื่อการจัดการภายใน</b></h3>
        </div>
        <div class="container tb-wrapper">
            <div class="row tb-row">
                <div class="col-12">
                    <table id="datatable" class="table table-hover table-light table-bordered">
                        <thead class="thead-light text-center">
                            <tr>
                                <th scope="col">ชื่อ</th>
                                <th scope="col">ลิ้งค์</th>
                                <th scope="col">รายละเอียดลิ้งค์</th>
                                <th scope="col">ลิ้งค์สังกัด</th>
                                <th scope="col">ไปที่ลิ้งค์</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${link}" var="link" varStatus="count">
                                <c:choose>
                                    <c:when test="${user.level_Status == 3}">
                                        <tr class="text-center">                                            
                                            <td>${link.link_Name}</td>
                                            <td>${link.link_Tag}</td>
                                            <td>${link.link_Description}</td>
                                            <td>
                                                <c:forEach items="${fac}" var = "fac" >
                                                    <c:if test="${fac.fac_No == link.link_Fac}">
                                                        ${fac.fac_Name}
                                                    </c:if>    
                                                </c:forEach>
                                            </td>
                                            <td><a class="btn btn-success-go-link" href="${link.link_Tag}">Go to link</a></td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${user.facC == link.link_Fac}">                                            
                                            <tr class="text-center">
                                                <td>${link.link_Name}</td>
                                                <td>${link.link_Tag}</td>
                                                <td>${link.link_Description}</td>
                                                <td>
                                                    <c:forEach items="${fac}" var = "fac" >
                                                        <c:if test="${fac.fac_No == link.link_Fac}">
                                                            ${fac.fac_Name}
                                                        </c:if>    
                                                    </c:forEach>
                                                </td>
                                                <td><a class="btn btn-success-go-link" href="${link.link_Tag}" target="_blank">Go to link</a></td>
                                            </tr>
                                        </c:if> 
                                    </c:otherwise>
                                </c:choose>                               
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
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

