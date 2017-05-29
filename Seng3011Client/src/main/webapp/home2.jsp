	<%@ page language="java" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<!--<jsp:include page="header.jsp" />-->
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/Seng3011Client/resources/js/bootstrap.min.js"></script>
<script src="/Seng3011Client/resources/js/jquery.min.js"></script>
<script src="/Seng3011Client/resources/js/my.js"></script>
<script src="/Seng3011Client/resources/js/vector.js"></script>
<script src="/Seng3011Client/resources/js/plotly-latest.min.js"></script>
<script src="/Seng3011Client/resources/js/home.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<style>
#myDiv {
	width: 700px;
	float:left;
	margin-top:5px;
	margin-left:20px;
}
.pic {
	margin-bottom: 20px;
	margin-left: 260px;
	margin-top: 20px;
}
.ul {
	list-style: none;
}
.ul li {
	float: left;
	margin-right: 50px;
	text-align: center;
}
.flu {
	width: 380px;
	margin-left: 780px;
	margin-top: 80px;
}
.gra{
	background-color: #F7F7F7;
	float:left;
	width:750px;
	height:460px;
	border:#000 1px solid;
	border-radius: 10px;
}
.flu select{
	margin-bottom:30px;	
}
</style>
</head>
<body>
<div id="container">
    <div id="output"></div>
</div>
<div class="panel-body middle-align" style="padding-bottom:0px;margin-top:20px;">
    <div class="panel panel-black">
        <div class="panel-heading bold size2">Stock Information</div>
        <div id ="select" class="inside-align">
            <form action = "javascript:;" onsubmit="draw()">
                <ul class="ul">
                    <li>
                        <select class="selectpicker" id="company" title="Choose an energy company" >
                            <option>AAL.L</option>
                            <option>ANRZQ.PK</option>
                            <option>BLT.L</option>
                            <option>BHP.AX</option>
                            <option>RIO.L</option>
                            <option>RIO.AX</option>
                            <option>VALE5.SA</option>
                            <option>WLTGQ.PK</option>
                            <option>WHC.AX</option>
                            <option>XTAXS.UL</option>
                            <option>1088.HK</option>
                            <option>601088.SS</option>
                            <option>601898.SS</option>
                        </select>
                    </li>
                    <li>
                        <select class="selectpicker"  id="topicC" multiple title="Choose an energy topic Code">
                            <option>BIOF</option>
                            <option>BUN</option>
                            <option>COA</option>
                            <option>JET</option>
                            <option>LNG</option>
                            <option>LPG</option>
                            <option>MOG</option>
                            <option>NAP</option>
                            <option>NGS</option>
                            <option>NUC</option>
                            <option>OPEC</option>
                            <option>PETC</option>
                            <option>POLY</option>
                            <option>PROD</option>
                            <option>RFO</option>
                            <option>RNW</option>
                        </select>
                    </li>
                    <li>
                        <input type="text" id="startD" name="startD" class="form-control" placeholder="Start Date">
                    </li>
                    <li>
                        <input type="text" id="endD" name="endD" class="form-control" placeholder="End Date"  >
                    </li>
                </ul>
                <button id="confirm" type = "submit" class="btn btn-basic">Confirm</button>
            </form>
        </div>
    </div>
</div>
<div class="panel-body middle-align" style="margin-bottm:0px;">
    <div class="panel panel-black">
        <div class="panel-heading bold size2">Graph</div>
        <div class="inside-align" style="height:500px;">
        <div class="gra"><div id ='myDiv' ></div></div>
        <div class="flu">
            <select class="form-control" id="Positive" onchange="changeOther('Positive','Negative','Neutral')">
           		<option>News may have positive influence to the company</option>
            </select>
            <select class="form-control" id="Negative" onchange="changeOther('Negative','Positive','Neutral')" >
           		<option>News may have negative influence to the company</option>
            </select>
           
            <select class="form-control" id="Neutral" onchange="changeOther('Neutral','Negative','Positive')">
   				<option>News may have no influence to the company</option>
            </select>
        </div>
        </div>
    </div>
</div>
<div class="panel-body middle-align" style="padding-bottom:0px;">
    <div class="panel panel-black">
        <div class="panel-heading bold size2">News Content</div>
         <h2 id="newsHead"></h2>
         <p id ="newsTimeAndType"></p>
         <p id ="newsBody"></p>
        <div class="result inside-align">
            <pre style="max-height:500px;"><code class="json">
        </code></pre>
        </div>
    </div>
</div>
<div class="panel-body middle-align">
    <div class="panel panel-black">
        <div class="panel-heading bold size2">Events / Updates</div>
        <table class="table secondright">
            <tr>
                <td><a href="documentation3.jsp">Version 3.0 Released!!!</a></td>
                <td>10/05/17</td>
            </tr>
            <tr>
                <td><a href="documentation2.jsp">Version 2.0 Released!!!</a></td>
                <td>13/04/17</td>
            </tr>
            <tr>
                <td><a href="documentation1.jsp">Version 1.0 Released!!!</a></td>
                <td>30/03/17</td>
            </tr>
        </table>
    </div>
    <hr class="container">
    <footer class="container">
        <p>Design by 404 Not Found</p>
    </footer>
</div>
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
