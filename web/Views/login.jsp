<%-- 
    Document   : login
    Created on : Jul 14, 2020, 9:28:40 AM
    Author     : RU-COM9
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RU-Link</title>
        
        <link rel="shortcut icon" href="./assets/img/ru.png"> 

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap" rel="stylesheet">

        <link href="./assets/css/loginStyle.css" rel="stylesheet">
    </head>
    <body>           
        <div class="container container-wrap">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <div class="card">
                        <article class="card-body">
                            <div class="form-group">
                                <img src="./assets/img/ru.png" width="50vw" >
                                <h4 class="card-title mb-4 mt-4">เข้าสู่ระบบ RU-Link</h4>
                            </div>
                            <form method="post" action="Login">
                                <c:choose>
                                    <c:when test="${err_message eq '0' ||  err_message eq '1'}">
                                        <div class="form-group">
                                            <label>ชื่อผู้ใช้</label>
                                            <input name="username" class="form-control form-input-username-err" placeholder="Username" type="text" required="true">
                                        </div> <!-- form-group// -->
                                        <div class="form-group">
                                            <label>รหัสผ่าน</label>
                                            <input name="password" class="form-control form-input-password-err"  placeholder="Password" type="password" required="true">
                                        </div> <!-- form-group// --> 
                                        <div class="form-group form-input-text-err-alert">
                                            <p>* Username หรือ Password ไม่ถูกต้อง !</p>
                                        </div>
                                        <div class="form-group"> 
                                            <div class="checkbox">
                                                <label> <input type="checkbox"> บันทึกรหัสผ่าน </label>
                                            </div> <!-- checkbox .// -->                                            
                                        </div> <!-- form-group// -->  
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block"> เข้าสู่ระบบ  </button>
                                        </div> <!-- form-group// -->  

                                    </c:when>
                                    <c:otherwise>
                                        <div class="form-group">
                                            <label>ชื่อผู้ใช้</label>
                                            <input name="username" class="form-control input-username" placeholder="Username" type="text" required="true">
                                        </div> <!-- form-group// -->
                                        <div class="form-group">
                                            <label>รหัสผ่าน</label>
                                            <input name="password" class="form-control input-password"  placeholder="Password" type="password" required="true">
                                        </div> <!-- form-group// --> 
                                        <div class="form-group"> 
                                            <div class="checkbox">
                                                <label> <input type="checkbox"> บันทึกรหัสผ่าน </label>
                                            </div> <!-- checkbox .// -->
                                        </div> <!-- form-group// -->  
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block"> เข้าสู่ระบบ  </button>
                                        </div> <!-- form-group// -->  
                                    </c:otherwise>
                                </c:choose>   
                            </form>
                        </article>
                    </div> <!-- card.// -->
                </div>
                <div class="col-3"></div>
            </div>
        </div>

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>

