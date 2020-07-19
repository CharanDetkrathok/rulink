<%-- 
    Document   : index
    Created on : Jul 14, 2020, 8:31:03 AM
    Author     : RU-COM9
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RU-Link</title>
    </head>
    <body>
        <header>
            <%@include file="/Views/header.jsp" %>
        </header>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>username</th>
                                <th>password</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${user}" var="user">
                                <tr>
                                    <td>${user.ids}</td>
                                    <td>${user.userName}</td>
                                    <td>${user.passWord}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
