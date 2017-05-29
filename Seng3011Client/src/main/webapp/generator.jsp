<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!--<jsp:include page="header.jsp" />-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 Not Found API</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<script src="/Seng3011Client/resources/js/generatorV.js"></script>
<script src="/Seng3011Client/resources/js/generator.js"></script>

<script src="/Seng3011Client/resources/js/plotly-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/Seng3011Client/resources/css/style.css">
<script>
  $(function() {
    $( "#startD" ).datepicker();
     $( "#startD" ).datepicker( "option", "dateFormat","yy-mm-dd");
     
     $( "#endD" ).datepicker();
     $( "#endD" ).datepicker( "option", "dateFormat","yy-mm-dd");
  });
  
</script>
<script type="text/javascript">
function output(inp) {
    document.body.appendChild(document.createElement('pre')).innerHTML = inp;
}

function syntaxHighlight(json) {
    json = json.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
    return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
        var cls = 'number';
        if (/^"/.test(match)) {
            if (/:$/.test(match)) {
                cls = 'key';
            } else {
                cls = 'string';
            }
        } else if (/true|false/.test(match)) {
            cls = 'boolean';
        } else if (/null/.test(match)) {
            cls = 'null';
        }
        return '<span class="' + cls + '">' + match + '</span>';
    });
}
</script>
<style>
.inside-align {
	padding: 20px;
}
#start {
	height: 30px;
}
#end {
	height: 30px;
}
#instrument {
	height: 30px;
	width: 180px;
	margin: auto;
}
#topic {
	height: 30px;
	width: 180px;
	margin: auto;
}
#submit {
	margin-top: 20px;
	margin-left: 500px;
}
.final {
	padding-left: 40px;
}
.select {
	width: 100px;
	margin-left: 50px;
	height: 30px;
}
.result {
	height: 580px;
}
.ul {
	list-style: none;
	margin-left: -50px;
}
.ul li {
	float: left;
	width: 180px;
	margin-left: 40px;
	text-align: center;
}
.flu {
	width: 380px;
}
.content {
	margin-top: -220px;
	padding: 20px;
	padding-bottom: 200px;
	width: 730px;
	margin-left: 420px;
	border: 1px solid #CCC;
	font-family: Verdana, Geneva, sans-serif;
}
.gra {
	background-color: #F5F5F5;
	border:1px solid #CCCCCC;
	margin-top:20px;
	margin-bottom:20px;
	padding: 0px;
	width: 1150px;
	height: 614px;
	border-radius:10px;
}
</style>
</head>
<body onload="hiddenFeature();hideGraph();">
<div id="container">
    <div id="output"></div>
</div>
<div class="panel-body middle-align" style="padding-bottom:0px;">
    <div class="panel panel-black">
        <div class="panel-heading bold size2">URL Generator</div>
        <form action = "javascript:;" onsubmit="generateData()" id="generator">
            <div class="inside-align">
                <ul class="ul">
                    <li> Version<br>
                        <br>
                        <select class="form-control select selectpicker" name = "version" id="version" onChange="hiddenFeature()">
                            <option value="apiv3" selected="selected">3</option>
                            <option value="apiv2">2</option>
                            <option value="apiv1">1</option>
                        </select>
                    </li>
                    <li> Start Date<br>
                        <br>
                        <input class="form-control" type="text" id="startD" name="startD" placeholder="Start Date">
                    </li>
                    <li> End Date<br>
                        <br>
                        <input type="text" id="endD" name="endD" class="form-control" placeholder="End Date" >
                    </li>
                    <li> Instrument ID<br>
                        <br>
                        <input class="form-control" id="instrument" name="inId" type="text" placeholder="BHP.AX,BLT.L">
                    </li>
                    <li> Topic Code<br>
                        <br>
                        <input class="form-control" id="topic" type="text" name="tpCode" placeholder="COM,AMERS">
                    </li>
                </ul>
                <div id="feature"  style="position:absolute;width:180px;margin-top:100px;margin-left:-1060px;text-align:center;">Feature<br>
                    <br>
                    <select class="form-control select selectpicker" name = "feature" id="fea">
                        <option value="news"  selected="selected">get news</option>
                        <option value="stock">get news and stock</option>
                    </select>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <input id="submit" class="btn" type="submit" value="Submit">
        </form>
        <br>
        <br>
    </div>
</div>
<div class="panel-body middle-align" style="padding-bottom:0px;">
    <div class="panel panel-black">
        <div class="panel-heading bold size2">Result &nbsp;
            <button id="json" class="btn btn-basic" onClick="hideGraph()" style="color:#000000">Json Output</button>
           <button id="visualize" class="btn btn-basic" onClick="showGraph()"  style="color:#000000">Formatted data</button>
          </div>
        <div class="result inside-align" id="result">

            
            <div class="gra" id ='myDiv'></div>
            <div class="third" id="newsdisplay">
                <div class="flu">
                    <select class="form-control" id="Positive" onchange="changeOther('Positive','Negative','Neutral')">
                        <option>Positive News</option>
                    </select>
                    <br>
                    <br>
                    <br>
                    <select class="form-control" id="Negative" onchange="changeOther('Negative','Positive','Neutral')">
                        <option>Negative News</option>
                    </select>
                    <br>
                    <br>
                    <br>
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
            <pre style="max-height:500px;margin-top:20px;" id="jjson">
        <code class="json" id="jsonData">
        </code></pre>
        </div>
    </div>
    <hr class="container">
    <footer class="container">
        <p>Design by 404 Not Found</p>
    </footer>
</div>
<script>
function showGraph(){
	document.getElementById("myDiv").style.display="block";
	document.getElementById("newsdisplay").style.display="block";
	document.getElementById("jjson").style.display="none";
	document.getElementById("result").style.height="auto";
}
function hideGraph(){
	document.getElementById("myDiv").style.display="none";
	document.getElementById("newsdisplay").style.display="none";
	document.getElementById("jjson").style.display="block";
	document.getElementById("result").style.height="580px";
}
function hiddenFeature(){
	var e = document.getElementById("version");
	var option = e.options[e.selectedIndex].value;

	if(option=='apiv3'){
		document.getElementById("visualize").style.display = "inline";
		document.getElementById("json").style.display = "inline";
		document.getElementById("feature").style.display = "inline";
		showGraph();
	}
	else{
		document.getElementById("visualize").style.display = "none";
		document.getElementById("json").style.display = "none";
		document.getElementById("feature").style.display = "none";
		hideGraph();
	}
	
}

</script>
</body>
</html>