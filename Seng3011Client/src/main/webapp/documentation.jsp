<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="header.jsp" />
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
<style>
.ver td:first-child {
	padding-left: 25px;
}

</style>
</head><body>
<div class="panel-body middle-align" style="padding-bottom:0px;"> Want some tips? <a href="tutorial.jsp">
    <button class="btn btn-default">Tutorial</button>
    </a> View Version Details <a href="details.jsp">
    <button class="btn btn-default">Details</button>
    </a><br>
    <br>
    <div class="panel panel-default">
        <div class="panel-heading bold size2">Update</div>
        <table class="table middle">
            <tr class="bold">
                <td>Version</td>
                <td>Date of Release</td>
                <td>Brief Description</td>
            </tr>
            <tr class="ver">
                <td>1.0</td>
                <td>30/03/17</td>
                <td>The first version</td>
            </tr>
            <tr class="ver">
                <td>2.0</td>
                <td>13/04/17</td>
                <td>Add error handling, URL generator and output example</td>
            </tr>
        </table>
    </div>
</div>
<hr class="container">
<footer class="container">
    <p>Design by 404 Not Found</p>
</footer>
</body>
</html>