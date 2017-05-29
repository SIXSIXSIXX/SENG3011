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
<link href="../resources/static/css/bootstrap.css" rel="stylesheet">
<link href="../resources/static/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/static/css/bootstrap-responsive.css" rel="stylesheet">
<link href="../resources/static/css/style.css" rel="stylesheet">
<link href="../resources/static/css/mega-menu.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Karla:400,400italic,700,700italic" rel="stylesheet" type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:400,300" rel="stylesheet" type='text/css'>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../resources/static/js/bootstrap.min.js"></script>
<script src="../resources/static/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/static/css/jquery-ui.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="../resources/static/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/static/js/jquery-ui-slide.min.js"></script>
<script type="text/javascript" src="../resources/static/js/jquery-ui-timepicker-addon.js"></script>
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
<link rel="stylesheet" type="text/css" href="/Seng3011/resources/css/jquery-ui.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/Seng3011/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/Seng3011/resources/js/jquery-ui-slide.min.js"></script>
<script type="text/javascript" src="/Seng3011/resources/js/jquery-ui-timepicker-addon.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script src="/Seng3011/resources/js/hello.js"></script>
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
<script type="text/javascript">



$(function(){
	$('#start').datetimepicker({
	    showSecond: true,
	    
	    timeFormat: 'hh:mm:ss'
    });
	$('#end').datetimepicker({
	    showSecond: true,

	    timeFormat: 'hh:mm:ss'
    });
});
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
	height: 540px;
}
.ul {
	list-style: none;
	margin-left: -50px;
}
.ul li {
	float: left;
	width: 205px;
	text-align: center
}
</style>
</head><body>
<div class="panel-body middle-align" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading bold size2">URL Generator</div>
        <form action="tryIt">
            <div class="inside-align">
            <ul class="ul">
                <li> Version:<br>
                    <br>
                    <select class="form-control select" name = "version">
                        <option value="apiv1">1</option>
                        <option value="apiv2" selected="selected">2</option>
                    </select>
                </li>
                <li> Start Date: <br>
                    <br>
                    <div class="demo">
                        <input class="start" name = "startD"  type="text"  id="start" />
                    </div>
                </li>
                <li> End Date: <br>
                    <br>
                    <div class="demo">
                        <input class="end" type="text" name="endD" id="end" />
                    </div>
                </li>
                <li> Instrument ID: <br>
                    <br>
                    <input class="form-control" id="instrument" name="inId" type="text" placeholder="RIC_BHP.AX,RIC_BLT.L">
                </li>
                <li> Topic Code: <br>
                    <br>
                    <input class="form-control" id="topic" type="text" name="tpCode" placeholder="COM,AMERS">
                </li>
            </ul>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <input id="submit" class="btn btn-primary" type="submit" value="Submit">
        </form>
        <br>
        <br>
        How this generate? <a href="tutorial.jsp">
        <button class="btn btn-default">Tutorial</button>
        </a> 
        </div>
	</div>
</div>
<script type="text/javascript">
function parseJSON(data) {
    return window.JSON && window.JSON.parse ? window.JSON.parse( data ) : (new Function("return " + data))(); 
}</script>
<div class="panel-body middle-align" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading bold size2">Result</div>
        <input type="hidden" id="respsb" name="modelAttr" value='${resp}'/>
        <div class="result inside-align">
            <pre style="max-height:500px;"><code class="json">
        <script type="text/javascript">
       var s = document.getElementById("respsb").value;
		person = parseJSON(s);
		var str = JSON.stringify(person, undefined, 4);
		
       $('.json').html(syntaxHighlight(str));
        </script> 
        </code></pre>
        </div>
    </div>
</div>
<hr class="container">
<footer class="container">
    <p>Design by 404 Not Found</p>
</footer>
</body>
</html>