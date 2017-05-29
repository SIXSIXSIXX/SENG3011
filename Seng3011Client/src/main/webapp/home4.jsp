<%@ page language="java" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<link href="/Seng3011Client/resources/css/bootstrap.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/bootstrap-responsive.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/style.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/mega-menu.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Karla:400,400italic,700,700italic" rel="stylesheet" type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:400,300" rel="stylesheet" type='text/css'>
<link rel="canonical" href="http://secure.cssdeck.com/labs/fancy-3d-button">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/Seng3011Client/resources/js/bootstrap.min.js"></script>
<script src="/Seng3011Client/resources/js/jquery.min.js"></script>
<script src="/Seng3011Client/resources/js/my.js"></script>
<script src="/Seng3011Client/resources/js/vector.js"></script>
<script src="/Seng3011Client/resources/js/plotly-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/Seng3011Client/resources/css/style.css">
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/amstock.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/dataloader/dataloader.min.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />

<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="/Seng3011Client/resources/js/newHome.js"></script>
<script>
  $(function() {
    $( "#startD" ).datepicker();
     $( "#startD" ).datepicker( "option", "dateFormat","yy-mm-dd");
     
     $( "#endD" ).datepicker();
     $( "#endD" ).datepicker( "option", "dateFormat","yy-mm-dd");
  });
  
</script>
<style>
.pic {
	margin-bottom: 20px;
	margin-left: 260px;
	margin-top: 20px;
}
.ul{
	list-style: none;
}
.ul li {
	float: left;
	text-align: center;
}
.ul li:nth-child(n+2) {
	margin-left: 80px;
}
.flu{
	width: 380px;
}

#select {
	margin-bottom: 10px;
}
.content {
	margin-top:-180px;
	padding: 20px;
	padding-bottom: 200px;
	width: 875px;
	margin-left: 420px;
	border: 1px solid #CCC;
	font-family: Verdana, Geneva, sans-serif;
}
.gra {
	background-color: #808080;
	padding: 0px;
	width: 1366px;
	height: 730px;
}

.all{
	margin-left: auto;
	margin-right: auto;
	width: 1366px;
	margin-bottom: 20px;
	border-radius: 10px;
}
.banner {
	background-color: #2E353D;
	color: #FFF;
	padding: 10px;
	font-size: 23px;
}
.third{
	padding:30px;
	margin-bottom: 10px;
	background-color:#ffffff;
	border-bottom-left-radius:10px;
	border-bottom-right-radius:10px;
}
.tbtn {
	margin-top: -600px;
	margin-left: 37%;
}
.choose{
	padding-left:80px;
	padding-top:40px;
	height:140px;
	background-color:#FFF;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}
</style>
<style class="cp-pen-styles">
        *, *:before, *:after
        {
            margin: 0;
            padding: 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        
        
        
        .btn-edge
        {
			text-decoration:none;
            position: relative;
            display: inline-block;
            padding: 1rem 2rem;
            font-family: 'Titillium Web' , sans-serif;
            font-weight: 700;
            text-decoration: none;
            font-size: 3rem;
            color: #333;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#333), to(#333)), -webkit-gradient(linear, left top, left bottom, from(#333), to(#333)), -webkit-gradient(linear, left top, left bottom, from(#333), to(#333)), -webkit-gradient(linear, left top, left bottom, from(#333), to(#333)), -webkit-gradient(linear, left top, left bottom, from(#333), to(#333)), -webkit-gradient(linear, left top, left bottom, from(#333), to(#333)), -webkit-gradient(linear, left top, left bottom, from(#333), to(#333)), -webkit-gradient(linear, left top, left bottom, from(#333), to(#333));
            background-image: -webkit-linear-gradient(#333, #333), -webkit-linear-gradient(#333, #333), -webkit-linear-gradient(#333, #333), -webkit-linear-gradient(#333, #333), -webkit-linear-gradient(#333, #333), -webkit-linear-gradient(#333, #333), -webkit-linear-gradient(#333, #333), -webkit-linear-gradient(#333, #333);
            background-image: linear-gradient(#333, #333), linear-gradient(#333, #333), linear-gradient(#333, #333), linear-gradient(#333, #333), linear-gradient(#333, #333), linear-gradient(#333, #333), linear-gradient(#333, #333), linear-gradient(#333, #333);
            background-repeat: no-repeat;
            -webkit-background-size: 2rem 5px, 2rem 5px, 2rem 5px, 2rem 5px, 5px 2rem, 5px 2rem, 5px 2rem, 5px 2rem;
            background-size: 2rem 5px, 2rem 5px, 2rem 5px, 2rem 5px, 5px 2rem, 5px 2rem, 5px 2rem, 5px 2rem;
            background-position: 0 0, 100% 0, 0 100%, 100% 100%;
            -webkit-box-shadow: inset 0 0 0 5px rgba(255, 99, 71, 0);
            box-shadow: inset 0 0 0 5px rgba(255, 99, 71, 0);
            -webkit-transition: background-size 1s .4s, -webkit-box-shadow .4s, color .4s;
            transition: background-size 1s .4s, box-shadow .4s, color .4s;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
        }
        .btn-edge:hover
        {
			cursor:pointer;
            color: tomato;
            -webkit-background-size: 100% 5px, 100% 5px, 100% 5px, 100% 5px, 5px 100%, 5px 100%, 5px 100%, 5px 100%;
            background-size: 100% 5px, 100% 5px, 100% 5px, 100% 5px, 5px 100%, 5px 100%, 5px 100%, 5px 100%;
            -webkit-box-shadow: inset 0 0 0 5px tomato;
            box-shadow: inset 0 0 0 5px tomato;
            -webkit-transition: background-size 1s, -webkit-box-shadow .4s .6s, color .4s .6s;
            transition: background-size 1s, box-shadow .4s .6s, color .4s .6s;
        }
    </style>
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="nav-collapse">
        <ul class="ulnav">
            <li><a class="brand" href=" "><img src="/Seng3011Client/resources/img/logo.png"  alt="responsive Mega Menu" style="margin-top:5px;"></a></li>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="documentation3.jsp">Documentation</a></li>
            <li><a href="generator.jsp">Generator</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </div>
</div>
<div id="container">
    <div id="output"></div>
</div>
<!--<div style='background-image:url("/Seng3011Client/resources/img/stock.jpg"); height:800px;width:100%;'>
<button type="button" onclick="smoothScroll(document.getElementById('newsdisplay'))" class="tbtn">﹀  Try Auto Trading  ﹀</button>
</div>-->
<div style="width:100%;height:750px;">
    <div><img src="	" style="width:100%;"></div>
    <div class="tbtn">
    <a target="_blank" onclick="smoothScroll(document.getElementById('all'))" class="btn-edge" style="text-decoration:none;" >Try Auto Stock-Trading</a>
        <!--<button onclick="smoothScroll(document.getElementById('all'))">﹀  Try Auto Trading  ﹀</button>-->
    </div>
</div>
<div style="height:80px;margin-top:-50px;" id="all"></div>
<!-- <img src="/Seng3011Client/resources/img/stockinvest.png" style="width:100%;height:100%;"> -->
<div class="all">
    <div class="gra" id ='chartdiv'></div>
    <div class="third" id="newsdisplay">
        <div class="content">
            <div id="newsHead" style="font-size:30px;font-family:Georgia, 'Times New Roman', Times, serif;"></div>
            <br>
            <div id ="newsTimeAndType" style="font-size:20px;"></div>
            <br>
            <div id ="newsBody" style="font-size:18px;word-wrap: break-word;"></div>
        </div>
    </div>
</div>
<script>

window.smoothScroll = function(target) {
    var scrollContainer = target;
    do { //find scroll container
        scrollContainer = scrollContainer.parentNode;
        if (!scrollContainer) return;
        scrollContainer.scrollTop += 1;
    } while (scrollContainer.scrollTop == 0);
    
    var targetY = 0;
    do { //find the top of target relatively to the container
        if (target == scrollContainer) break;
        targetY += target.offsetTop;
    } while (target = target.offsetParent);
    
    scroll = function(c, a, b, i) {
        i++; if (i > 30) return;
        c.scrollTop = a + (b - a) / 30 * i;
        setTimeout(function(){ scroll(c, a, b, i); }, 20);
    }
    // start scrolling
    scroll(scrollContainer, scrollContainer.scrollTop, targetY, 0);
}
</script> 
<script>
$(document).ready(function(){
  var date_input=$('input[name="startD"]'); //our date input has the name "date"
  var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
  var options={
    format: 'yyyy-mm-dd',
    container: container,
    todayHighlight: true,
    autoclose: true,
  };
  date_input.datepicker(options);
})
</script> 
<script>
$(document).ready(function(){
  var date_input=$('input[name="endD"]'); //our date input has the name "date"
  var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
  var options={
    format: 'yyyy-mm-dd',
    container: container,
    todayHighlight: true,
    autoclose: true,
  };
  date_input.datepicker(options);
})
</script>
</body>
</html>
