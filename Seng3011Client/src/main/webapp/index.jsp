<%@ page language="java" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>404 Not Found API</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/Seng3011Client/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/amstock.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/dataloader/dataloader.min.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/black.js"></script>
<script src="/Seng3011Client/resources/js/newHome.js"></script>
<script src="/Seng3011Client/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script>
  $(function() {
    $( "#startD" ).datepicker();
     $( "#startD" ).datepicker( "option", "dateFormat","yy-mm-dd");
     
     $( "#endD" ).datepicker();
     $( "#endD" ).datepicker( "option", "dateFormat","yy-mm-dd");
  });
</script>
<style>
.ui-datepicker {
	background: #333;
	border: 1px solid #555;
	color: #EEE;
}
.soflow, .soflow-color {
	-webkit-appearance: button;
	-webkit-border-radius: 2px;
	-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	-webkit-padding-end: 20px;
	-webkit-padding-start: 2px;
	-webkit-user-select: none;
	/*background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);*/
	background-position: 97% center;
	background-repeat: no-repeat;
	border: 1px solid #AAA;
	color: #555;
	font-size: inherit;
	margin: 20px;
	overflow: hidden;
	padding: 1px 11px;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 300px;
}
.soflow-color {
	color: #fff;
	/*background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#111111, #111111 40%, #111111);*/
	background-color: #111111;
	-moz-border-radius: 9px 9px 9px 9px;
	-webkit-border-radius: 9px 9px 9px 9px;
	border-radius: 9px 9px 9px 9px;
	padding-left: 15px;
	box-shadow: 1px 1px 11px #330033;
	width: 500px;
}
.btn-edge {
	position: relative;
	display: inline-block;
	padding: 1rem 2rem;
	font-family: 'Titillium Web', sans-serif;
	font-weight: 700;
	text-decoration: none;
	font-size: 30px;
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

.btn-edge:hover, .btn-edge2:hover{
	cursor: pointer;
	color: tomato;
	-webkit-background-size: 100% 5px, 100% 5px, 100% 5px, 100% 5px, 5px 100%, 5px 100%, 5px 100%, 5px 100%;
	background-size: 100% 5px, 100% 5px, 100% 5px, 100% 5px, 5px 100%, 5px 100%, 5px 100%, 5px 100%;
	-webkit-box-shadow: inset 0 0 0 5px tomato;
	box-shadow: inset 0 0 0 5px tomato;
	-webkit-transition: background-size 1s, -webkit-box-shadow .4s .6s, color .4s .6s;
	transition: background-size 1s, box-shadow .4s .6s, color .4s .6s;
}
.introtxt {
	margin-top: -60px;
}
.ul {
	list-style: none;
}
.ul li {
	float: left;
	width: 250px;
	margin-left: 40px;
}
.ul li select, .ul li input {
	width: 250px;
}

</style>
<script>
$('#sandbox-container input').datepicker({
    autoclose: true
});

$('#sandbox-container input').on('show', function(e){
    console.debug('show', e.date, $(this).data('stickyDate'));
    
    if ( e.date ) {
         $(this).data('stickyDate', e.date);
    }
    else {
         $(this).data('stickyDate', null);
    }
});

$('#sandbox-container input').on('hide', function(e){
    console.debug('hide', e.date, $(this).data('stickyDate'));
    var stickyDate = $(this).data('stickyDate');
    
    if ( !e.date && stickyDate ) {
        console.debug('restore stickyDate', stickyDate);
        $(this).datepicker('setDate', stickyDate);
        $(this).data('stickyDate', null);
    }
});
</script>
</head><body id="top">
<div class="wrapper bgded overlay" style="background-image:url('/Seng3011Client/resources/img/stock.jpg');background-size:100% 750px;width:100%;height:750px;"> 
    <!-- ################################################################################################ -->
    <div class="row1">
        <header id="header" class="hoc clear"> 
            <!-- ################################################################################################ -->
            <div id="logo" class="fl_left">
                <h1><a href="index.html">team 404 not found</a></h1>
            </div>
            <nav id="mainav" class="fl_right">
                <ul class="clear">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="documentation3.jsp">Documentation</a></li>
                    <li><a href="generator.jsp">Generator</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </header>
    </div>
    <div id="pageintro" class="hoc clear"> 
        <!-- ################################################################################################ -->
        <article class="introtxt">
            <h2 class="heading">404 Auto Stock-Trading System</h2>
            <p>The most intelligent auto stock-trading system. &nbsp;Being rich has never been easier. </p>
            <footer>
                <div class="tbtn"> <a class="btn-edge" style="text-decoration:none;" onclick="smoothScroll(document.getElementById('graph'))" target="_blank">Try Auto Stock-Trading</a> </div>
            </footer>
        </article>
        <!-- ################################################################################################ -->
        <div class="clear"></div>
    </div>
    <!-- ################################################################################################ --> 
</div>
<!-- End Top Background Image Wrapper -->
<div class="wrapper row4" id="graph" style="margin-left:-20px;height:750px;padding-top:20px;">
      <form action = "javascript:;" onsubmit="draw()" id="auto">
    <ul class="ul">
        <li>
            <select class="soflow-color" id="capital" onchange="changeCompany()" required >
                <option selected disabled>Select range of investment capital</option>
                <option value="1">$2000~$4000</option>
                <option value="2">$4000~$8000</option>
                <option value="3">$8000~$15000</option>
                <option value="4">>$15000</option>
            </select>
        </li>
        <li>
            <select class="soflow-color" id="company" required>
                <option selected disabled>Please select a company</option>
                
            </select>
        </li>
        <li>
            <input class="soflow-color" type="text" id="startD" name="startD" placeholder="Start Date" required>
        </li>
        <li>
            <input class="soflow-color" type="text" id="endD" name="endD" placeholder="End Date" required>
        </li>
        <li style="padding-left:30px;">
        	
            <input id="submit" class="btn btn-basic" type="submit"  value="Submit">
           
        </li>
    </ul>
     </form>
    <main class="hoc container clear">
        <div id="chartdiv" style="width:100%; height:600px; color:white;"></div>
    </main>
</div>
<div class="wrapper row8">
    <main class="hoc container clear">
    <!-- main body --> 
    <!-- ################################################################################################ -->
    
    <ul class="nospace group services">
        <li class="one">
            <article><i class="fa fa-database"></i>
                <h3 class="heading" id="newsTitle" style="front-size:30px;"></h3>
                <p id="newsSubTitle"></p>
                <p id ="newsBody"></p>
            </article>
        </li>
    </ul>
    
    <!-- ################################################################################################ --> 
    <!-- / main body --> 
</div>
<!-- ################################################################################################ -->

<div class="wrapper row4">
    <footer class="hoc clear" id="footer"> 
        <!-- ################################################################################################ -->
        <div class="one_third first">
            <h6 class="title">Kevin Yang</h6>
            <article>
                <p>ydykevin@gmail.com</p>
            </article>
        </div>
        <div class="one_third">
            <h6 class="title">Felix Li</h6>
            <article>
                <p>felixlz0822@gmail.com</p>
            </article>
        </div>
        <div class="one_third">
            <h6 class="title">Nick Yao</h6>
            <article>
                <p>yaoyu5507203@gmail.com</p>
            </article>
        </div>
        
        <!-- ################################################################################################ --> 
    </footer>
</div>
<!-- ################################################################################################ --> 

<!-- ################################################################################################ --> 

<script>
function changeCompany(){
	var e = document.getElementById("capital");
	var value = e.options[e.selectedIndex].value;
	var c = document.getElementById("company");
    for(i = c.options.length - 1 ; i >= 1 ; i--) c.remove(i);
	if(value == 1){
		var option = document.createElement("option");
		option.text = "AGO.AX";
		option.value = "AGO.AX";
		c.appendChild(option);
		var option = document.createElement("option");

		option.text = "BDR.AX";
		option.value = "BDR.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "DMP.AX";
		option.value = "DMP.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "NCM.AX";
		option.value = "NCM.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "RRL.AX";
		option.value = "RRL.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "STO.AX";
		option.value = "STO.AX";
		c.appendChild(option);
	}
	else if(value ==2){
		var option = document.createElement("option");
		option.text = "EVN.AX";
		option.value = "EVN.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "MYR.AX";
		option.value = "MYR.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "NUF.AX";
		option.value = "NUF.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "OZL.AX";
		option.value = "OZL.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "RRL.AX";
		option.value = "RRL.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "SFG.AX";
		option.value = "SFG.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "SFR.AX";
		option.value = "SFR.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "SMR.AX";
		option.value = "SMR.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "SYD.AX";
		option.value = "SYD.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "TPM.AX";
		option.value = "TPM.AX";
		c.appendChild(option);

		
	}else if(value ==3){
		var option = document.createElement("option");
		option.text = "CTX.AX";
		option.value = "CTX.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "FMG.AX";
		option.value = "FMG.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "JBH.AX";
		option.value = "JBH.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "OGC.AX";
		option.value = "OGC.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "OSH.AX";
		option.value = "OSH.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "SWM.AX";
		option.value = "SWM.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "WBC.AX";
		option.value = "WBC.AX";
		c.appendChild(option);
		
	}else if(value ==4){
		var option = document.createElement("option");
		option.text = "BHP.AX";
		option.value = "BHP.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "RIO.AX";
		option.value = "RIO.AX";
		c.appendChild(option);
		var option = document.createElement("option");
		option.text = "NAB.AX";
		option.value = "NAB.AX";
		c.appendChild(option);
	}
	
}
</script>

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
        setTimeout(function(){ scroll(c, a, b, i); }, 5);
    }
    // start scrolling
    scroll(scrollContainer, scrollContainer.scrollTop, targetY, 0);
}
</script> 
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
<script src="/Seng3011Client/resources/layout/scripts/jquery.backtotop.js"></script>
</body>
</html>