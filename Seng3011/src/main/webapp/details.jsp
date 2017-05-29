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
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/bootstrap-responsive.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/mega-menu.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Karla:400,400italic,700,700italic" rel="stylesheet" type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:400,300" rel="stylesheet" type='text/css'>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.min.js"></script>



<link href="/Seng3011/resources/css/bootstrap.css" rel="stylesheet">
<link href="/Seng3011/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/Seng3011/resources/css/bootstrap-responsive.css" rel="stylesheet">
<link href="/Seng3011/resources/css/style.css" rel="stylesheet">
<link href="/Seng3011/resources/css/mega-menu.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Karla:400,400italic,700,700italic" rel="stylesheet" type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:400,300" rel="stylesheet" type='text/css'>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/Seng3011/resources/js/bootstrap.min.js"></script>
<script src="/Seng3011/resources/js/jquery.min.js"></script>


<style>
.inside-align{
	padding:20px;	
}
</style>
</head><body>
<div class="panel-body middle-align" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading bold size2">Version Details</div>
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#one" data-toggle="tab">v1.0</a></li>
            <li><a href="#two" data-toggle="tab">v2.0</a></li>
        </ul>
        <div id="myTabContent" class="tab-content pad">
            <div class="tab-pane fade in active inside-align" id="one">
                
                <b>Date of Release</b><br><br>
                30/03/17<br><br>
                <b>Implementation in this version</b><br><br>
                - The API is able to make request to the News API<br>
                - The API is able to return output JSON file with corresponding result<br>
                - The API website provides tutorial of using it on different platform<br>
                - The API website provides test data<br><br>
                <b>Differences with previous version</b><br><br>
                N/A, this is the first release.<br><br>
                <b>Other Information</b><br><br>
                More informaiton about API running instruction, program call and test data, please check <a href="tutorial.jsp"><button class="btn btn-default">Tutorial</button></a><br>
                
            </div>
            <div class="tab-pane fade inside-align" id="two">
                
                <b>Date of Release</b><br><br>
                13/04/17<br><br>
                <b>Implementation in this version</b><br><br>
                - The API is able to make request to the News API<br>
                - The API is able to return output JSON file with corresponding result<br>
                - The API website provides tutorial of using it on different platform<br>
                - The API website provides test data<br>
                - The API website provides detailed description of URL parameters<br>
                - The API website provides detailed description of output format<br>
                - The API website provides user-friendly URL generator<br>
                - The API is able to return XML file with corresponding result<br>
                - The API is able to keep multiple version<br>
                - The API has log file<br>
                - The API has error message<br><br>
                <b>Differences with previous version</b><br><br>
                - The API provides more detailed tutorial information, including the description of URL parameters, output format and error message<br>
                - New user-friendly URL generator, which provides users option that select or fill in version, date, instrument ID and topic codes with GUI and display returned data on the screen<br>
                - New XML return format supported by Java and Linux call<br>
                - Multiple version API used supported, users can use any released API version<br>
                - Log file supported, including developerTeam, moduleName, version, serverStat, endExecutionDate, elapsedTime, outPutFileName, topicCodes, instrumentIDs and startExecutionDate<br>
                - Error message supported<br> 
                <br><br>
                <b>Other Information</b><br><br>
                More information about URL parameter description, output description, API running instruction, program call and test data, please check <a href="tutorial.jsp"><button class="btn btn-default">Tutorial</button></a><br>
                
            </div>
        </div>
    </div>
</div>
<hr class="container">
<footer class="container">
    <p>Design by 404 Not Found</p>
</footer>
</body>
</html>