<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 Not Found API</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="/Seng3011Client/resources/css/bootstrap.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/bootstrap-responsive.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/style.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/mega-menu.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Karla:400,400italic,700,700italic" rel="stylesheet" type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:400,300" rel="stylesheet" type='text/css'>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/Seng3011Client/resources/js/bootstrap.min.js"></script>
<script src="/Seng3011Client/resources/js/jquery.min.js"></script>
<script src="/Seng3011Client/resources/js/my.js"></script>


<!--<link href="${pageContext.request.contextPath}/Seng3011Client/resources/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Seng3011Client/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Seng3011Client/resources/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Seng3011Client/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Seng3011Client/resources/css/mega-menu.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Karla:400,400italic,700,700italic" rel="stylesheet" type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:400,300" rel="stylesheet" type='text/css'>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/Seng3011Client/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/Seng3011Client/resources/js/jquery.min.js"></script>  -->

<style>
.nav-side-menu {
	overflow: auto;
	font-family: verdana;
	font-size: 12px;
	font-weight: 200;
	background-color: #2e353d;
	position: fixed;
	top: 0px;
	width: 220px;
	height: 100%;
	color: #fff;
}
.nav-side-menu .brand {
	background-color: #23282e;
	line-height: 50px;
	display: block;
	text-align: center;
	font-size: 14px;
}
.nav-side-menu .toggle-btn {
	display: none;
}
.nav-side-menu ul, .nav-side-menu li {
	list-style: none;
	padding: 0px;
	margin: 0px;
	line-height: 35px;
	cursor: pointer;/*    
    .collapsed{
       .arrow:before{
                 font-family: FontAwesome;
                 content: "\f053";
                 display: inline-block;
                 padding-left:10px;
                 padding-right: 10px;
                 vertical-align: middle;
                 float:right;
            }
     }
*/
}
.nav-side-menu ul :not(collapsed) .arrow:before, .nav-side-menu li :not(collapsed) .arrow:before {
	font-family: FontAwesome;
	content: "\f078";
	display: inline-block;
	padding-left: 10px;
	padding-right: 10px;
	vertical-align: middle;
	float: right;
}
.nav-side-menu ul .active, .nav-side-menu li .active {
	border-left: 3px solid #d19b3d;
	background-color: #4f5b69;
}
.nav-side-menu ul .sub-menu li.active, .nav-side-menu li .sub-menu li.active {
	color: #d19b3d;
}
.nav-side-menu ul .sub-menu li.active a, .nav-side-menu li .sub-menu li.active a {
	color: #d19b3d;
}
.nav-side-menu ul .sub-menu li, .nav-side-menu li .sub-menu li {
	background-color: #181c20;
	border: none;
	line-height: 50px;
	border-bottom: 1px solid #23282e;
	margin-left: 0px;
}
.nav-side-menu ul .sub-menu li:hover, .nav-side-menu li .sub-menu li:hover {
	background-color: #020203;
}
.nav-side-menu ul .sub-menu li:before, .nav-side-menu li .sub-menu li:before {
	font-family: FontAwesome;
	content: "■";
	display: inline-block;
	padding-left: 10px;
	padding-right: 10px;
	vertical-align: middle;
}
.nav-side-menu li {
	padding-left: 0px;
	border-left: 3px solid #2e353d;
	border-bottom: 1px solid #23282e;
}
.nav-side-menu li a, .nav-side-menu a{
	text-decoration: none;
	color: #e1ffff;
}
.nav-side-menu li a i {
	padding-left: 10px;
	width: 20px;
	padding-right: 20px;
}
.nav-side-menu li:hover{
	border-left: 3px solid #d19b3d;
	background-color: #4f5b69;
	-webkit-transition: all 1s ease;
	-moz-transition: all 1s ease;
	-o-transition: all 1s ease;
	-ms-transition: all 1s ease;
	transition: all 1s ease;
}
.nav-side-menu a:hover{
	text-decoration:none;
	color:#e1ffff;
}
@media (max-width: 767px) {
.nav-side-menu {
	position: relative;
	width: 100%;
	margin-bottom: 10px;
}
.nav-side-menu .toggle-btn {
	display: block;
	cursor: pointer;
	position: absolute;
	right: 10px;
	top: 10px;
	z-index: 10 !important;
	padding: 3px;
	background-color: #ffffff;
	color: #000;
	width: 40px;
	text-align: center;
}
.brand {
	text-align: left !important;
	font-size: 50px;
	padding-left: 20px;
	line-height: 50px !important;
}
}
@media (min-width: 767px) {
.nav-side-menu .menu-list .menu-content {
	display: block;
}
}
body {
	margin: 0px;
	padding: 0px;
}
.h li {
	line-height: 60px;
	font-size: 20px;
}
.h a li, .h li {
	padding-left: 10px;
}
.second a li {
	line-height: 35px;
	font-size: 15px;
}
.caret{
	float:right;
	margin-top:30px;
	margin-right:10px;
}
</style>
</head>
<body>
<div class="nav-side-menu">
    <div class="brand" style="font-size:20px;border-bottom:#FFF;">404 Not Found API</div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
    <div class="menu-list">
        <ul id="menu-content" class="menu-content collapse out h">
            <a href="index.jsp"><li>Home</li></a>
            <li  data-toggle="collapse" data-target="#documentation" class="collapsed checkdoc" aria-expanded="false"> <a href="#">Documentation<b class="caret"></b></a> </li>
            <ul class="sub-menu collapse second" id="documentation">
            	<a href="documentation3.jsp" class="checkone"><li>v3.0</li></a>
                <a href="documentation2.jsp" class="checkone"><li>v2.0</li></a>
                <a href="documentation1.jsp" class="checkone"><li>v1.0</li></a>
            </ul>
            <a href="generator.jsp"><li> Generator </li></a> 
            <a href="contact.jsp">
            <li>Contacts </li>
            </a>
        </ul>
    </div>
</div>
</body>
</html>
