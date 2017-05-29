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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<style>
#myDiv {
	width: 700px;
	float: left;
	margin-top: 5px;
	margin-left: 20px;
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
}
#select{
	margin-bottom:10px;	
}
.content {
	margin-top: -200px;
	padding: 20px;
	padding-bottom: 200px;
	width: 730px;
	margin-left: 420px;
	border: 1px solid #CCC;
	font-family:Verdana, Geneva, sans-serif;
}
.gra {
	background-color: #F7F7F7;
	padding:0px;
	width: 1195px;
	height: 730px;
}
.flu select {
	margin-bottom: 30px;
}
.all {
	margin-left: 265px;
	margin-top: 20px;
	background-color: #FFF;
	width: 1195px;
	margin-bottom: 20px;
}
.banner {
	background-color: #2E353D;
	color: #FFF;
	padding: 10px;
	font-size: 23px;
}
.third {
	margin-bottom: 10px;
}
</style>
</head>
<body>
<div id="container">
    <div id="output"></div>
</div>
<div class="all">
    <div>
    <img src="/Seng3011Client/resources/img/1.jpg"/ style="width:100%;height:100%;">
        <div id ="select" class="inside-align">
            <form action = "javascript:;" onsubmit="draw()">
                <ul class="ul">
                    <li>
                        <select class="selectpicker" id="company" title="Choose an company">
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
                        <input type="text" id="endD" name="endD" class="form-control" placeholder="End Date" >
                    </li>
                </ul>
                <button id="confirm" type = "submit" class="btn btn-basic">Confirm</button>
            </form>
        </div>
    </div>
    <div>
    <div>
        <div class="gra" id ='myDiv' style =" width: 1000px; height: 530px; position: static;">
        </div>
        </div>
    </div>
    <div class="inside-align third">
        <div class="flu">
            <select class="form-control" id="Positive" onchange="changeOther('Positive','Negative','Neutral')">
                <option>Positive News</option>
            </select>
            <select class="form-control" id="Negative" onchange="changeOther('Negative','Positive','Neutral')" >
                <option>Negative News</option>
            </select>
            <select class="form-control" id="Neutral" onchange="changeOther('Neutral','Negative','Positive')">
                <option>Neutral News</option>
            </select>
        </div>
        <div class="content">
            <div id="newsHead" style="font-size:30px;font-family:Georgia, 'Times New Roman', Times, serif;"></div>
            <br>
            <div id ="newsTimeAndType" style="font-size:20px;"></div>
            <br>
            <div id ="newsBody" style="font-size:18px;word-wrap: break-word;"></div>
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
<script type ='text/javascript' >
function draw(){
	var company= document.getElementById("company");
	var topicC = document.getElementById("topicC");
	
	var InsId = company.options[company.selectedIndex].value;

	var topicCs = [];
	for (var i = 0; i < topicC.options.length; i++) {
	  if (topicC.options[i].selected) {
		  topicCs.push(topicC.options[i].value);
	  }
	}

	var startD = document.getElementById("startD").value+'T00:00:00Z';
	var endD = document.getElementById("endD").value+'T00:00:00Z';
	
	var URL = 'http://159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/'+startD+'/end-date/'+endD+'/instrumentId/'+InsId+'/';
	var ua="http://localhost:8080/Seng3011/apiv3/newsAndStock/start-date/2013-10-01T00:00:00Z/end-date/2015-01-30T00:00:00Z/instrumentId/BHP.AX/";
	var ud="http://localhost:8080/Seng3011/apiv3/newsAndStock/start-date/2015-07-20T00:00:00Z/end-date/2016-01-10T00:00:00Z/instrumentId/AAD.AX/";
	if(topicCs.length > 0){
		URL = URL+'topic-codes/'+ topicCs.toString();
		
	} 


	 Plotly.d3.json(ud, (err, resp) => {
		if(err) console.log(err);
		var stockX = [];
		var open = [];
		var high = [];
		var low = [];
		var close = [];
		var newsX = [];
		var newsY = [];
		var tps = [];
		var ids = [];
		var newsTime=[];
		var newsHead = [];
		var newsBody = [];
		var newsType = [];
		var array = resp.newsDataSet;
	    var positive = document.getElementById("Positive");
	    var positiveIndex = 0;
	    var negative = document.getElementById("Negative");
	    var negativeIndex = 0;
	    var netural = document.getElementById("Neutral");
	    var neturalIndex = 0;
	    //<option>1</option>
	    var max = 0;
	    var min = -1;
	    var count = 0;
	    for (var rec in array){
	    	if(count == 0) min = array[rec].low;
	    	if (array[rec].high>max) max = array[rec].high;
	    	if(array[rec].low<min) min = array[rec].low;
	    	count++;
	    	
	    }
	  
		for (var rec in array) {
			// console.log(array[rec].open);
			stockX.push(rec);
			
			open.push(array[rec].open);
			high.push(array[rec].high);
			low.push(array[rec].low);
			close.push(array[rec].close);
			var i = 0;
			var gap = (max-min)/array[rec].news.length;
			console.log(gap);
			array[rec].news.forEach(n => {
				
				newsX.push(rec);
				newsY.push(array[rec].low+i*gap);
			 	ids.push(n.instrumentIDs.toString());
			 	tps.push(n.topicCodes.toString()); 
/* 			 	console.log(n.timeStamp);
			 	console.log(n.topicCodes.toString());
			 	console.log("-------------------------"); */
			 	newsTime.push(n.timeStamp);
			 	newsHead.push(n.headline);
			 	newsBody.push(n.newsText);
			 	newsType.push(n.type);
				i++;
				if(n.type == 'Positive') {
			 		var opt = document.createElement('option');
			 		opt.innerHTML  = n.headline;
			 		opt.value = positiveIndex;
			 	    positive.appendChild(opt);
			 	   	positiveIndex = positiveIndex+1;
			 	}
			 	else if(n.type == 'Negative'){
			 		var opt = document.createElement('option');
			 		opt.innerHTML = n.headline;
			 		opt.value= negativeIndex;
				 	negative.appendChild(opt);
			 		negativeIndex = negativeIndex+1;
			 		
			 	}
			 	else{
			 		var opt = document.createElement('option');
			 		opt.innerHTML = n.headline;
			 		opt.value = neturalIndex;
			 		netural.appendChild(opt);
				 	neturalIndex = neturalIndex+1;
			 	}
			});
	 }

	localStorage.setItem("newsTime", JSON.stringify(newsTime));
	localStorage.setItem("newsHead", JSON.stringify(newsHead));		
	localStorage.setItem("newsBody", JSON.stringify(newsBody));
	localStorage.setItem("newsType", JSON.stringify(newsType));
	//console.log(newsTime.toString());
	var stock = {
		 name:'stock', 
		 x: stockX,
		  close: close,
		  decreasing: {line: {color: 'green'}}, 
		  high: high,
		  increasing: {line: {color: 'red'}}, 		  
		  line: {color: 'rgba(31,119,180,1)'}, 		  
		  low: low,
		  open: open,
		  type: 'candlestick', 
		  xaxis: 'x', 
		  yaxis: 'y'
	};

	var myPlot = document.getElementById('myDiv'),
		x=newsX,
		y=newsY,
	    data = [{x:x, y:y, type:'scatter',
	             mode:'markers', name: 'news',marker:{size:7, color:'black'}
	            },stock],
	    layout = {hovermode:'closest',
	              title:InsId
	     };

	Plotly.newPlot('myDiv', data, layout);
	
	myPlot.on('plotly_click', function(data){
		  var pn='',
		      tn='',
		      colors=[];
		  var counter = 0;
		  console.log(data.points.length);
	 	 if(data.points.length == 1){
			 pn = data.points[i].pointNumber;
			 console.log(pn);
			 console.log("__________________");
			 var newsTime = JSON.parse(localStorage.getItem("newsTime"));
			 var newsHead = JSON.parse(localStorage.getItem("newsHead"));
			 var newsBody = JSON.parse(localStorage.getItem("newsBody"));
			 var newsType = JSON.parse(localStorage.getItem("newsType"));
			document.getElementById("newsHead").innerHTML = newsHead[pn];
			document.getElementById("newsTimeAndType").innerHTML = "timeStamp: "+newsTime[pn]+"&emsp;&emsp;&emsp;"+"type: "+newsType[pn];
			document.getElementById("newsBody").innerHTML= newsBody[pn];
			 
			 
		 } 
	
		   // alert(pn);	
		});
	 });	
}
</script> 
<script type="text/javascript">
function changeOther(id1,id2,id3) {

	var j = document.getElementById(id1).selectedIndex;
	console.log(j);
	var newsTime = JSON.parse(localStorage.getItem("newsTime"));
	var newsHead = JSON.parse(localStorage.getItem("newsHead"));
	var newsBody = JSON.parse(localStorage.getItem("newsBody"));
	var newsType = JSON.parse(localStorage.getItem("newsType"));
	var i;
	var counter = 0;
	for (i = 0; i < newsType.length; i++) {
		console.log("looping");
		console.log(newsType[i]);
		if (newsType[i] == id1){
			console.log("equal");
			console.log(i);
			counter++;
		}
		if (counter==j) break;	
	}
	
	console.log(counter);
	console.log(i);
/* 	alert(newsTime[i]);
	alert(newsHead[i]);
	alert(newsBody[i]);
	alert(newsType[i]); */
//	alert()

	document.getElementById("newsHead").innerHTML = newsHead[i];
	document.getElementById("newsTimeAndType").innerHTML = "timeStamp: "+newsTime[i]+"        "+"type: "+newsType[i];
	document.getElementById("newsBody").innerHTML= newsBody[i];

	//console.log(newsHead[i]);
	//console.log(newsBody[i]);
	//console.log(newsType[i]);
	document.getElementById(id2).selectedIndex = 0;
	document.getElementById(id3).selectedIndex = 0;
	
}
</script>
</body>
</html>
