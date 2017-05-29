<%@ page language="java" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>Cooban</title>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/Seng3011Client/resources/css/layout.css" rel="stylesheet" type="text/css">
<script src="/Seng3011Client/resources/js/bootstrap.min.js"></script>
<link href="/Seng3011Client/resources/css/bootstrap.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/bootstrap-responsive.css" rel="stylesheet">
</head>
<body id="top">
<!-- Top Background Image Wrapper -->
<div class="wrapper bgded overlay" style="background-image:url('images/demo/backgrounds/01.png');"> 
  <!-- ################################################################################################ -->
  <div class="row1">
    
  </div>

  <div class="hoc clear" id="pageintro"> 
    <!-- ################################################################################################ -->

    <div class="clear"></div>
  </div>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <article class="one_third first">
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
    </article>
    <div class="two_third">
      <ul class="nospace group services">
        <li class="one">
          <article><a href="#"><i class="fa fa-database"></i></a>
            <h6 class="heading">Neque ac pretium</h6>
            <p>Donec laoreet hendrerit diam eget tincidunt massa iaculis a mauris in felis…</p>
            <footer><a href="#">View Details »</a></footer>
          </article>
        </li>
        
        
        
      </ul>
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<div class="wrapper coloured">
  <div class="hoc clear"> 
    <!-- ################################################################################################ -->
    
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row4">
  <footer class="hoc clear" id="footer"> 
    <!-- ################################################################################################ -->
    <div class="one_quarter first">
      <h6 class="title">Phasellus aenean</h6>
      <address class="btmspace-15">
      Company Name<br>
      Street Name &amp; Number<br>
      Town<br>
      Postcode/Zip
      </address>
      <ul class="nospace">
        <li><i class="fa fa-phone"></i> +00 (123) 456 7890</li>
        <li><i class="fa fa-envelope-o"></i> info@domain.com</li>
      </ul>
    </div>
    <div class="one_quarter">
      <h6 class="title">Imperdiet aliquam</h6>
      <article>
        <h2 class="nospace font-x1"><a href="#">Neque porta elit</a></h2>
        <time class="font-xs" datetime="2045-04-06">Friday, 6<sup>th</sup> April 2045</time>
        <p>Dignissim tellus vitae posuere laoreet dui nulla pulvinar dolor at ultricies lectus orci aliquam ipsum vestibulum at.</p>
      </article>
    </div>
    <div class="one_quarter">
      <h6 class="title">Iaculis mauris</h6>
      <ul class="nospace linklist">
        <li><a href="#">Consectetur commodo orci</a></li>
        <li><a href="#">Vitae tempus maecenas</a></li>
        <li><a href="#">Feugiat eget nisi vel</a></li>
        <li><a href="#">Scelerisque fusce suscipit</a></li>
        <li><a href="#">At sodales facilisis vivamus</a></li>
      </ul>
    </div>
    <div class="one_quarter">
      <h6 class="title">Quis auctor nulla</h6>
      <p>Risus vivamus consectetur neque augue eu tincidunt urna varius nec phasellus.</p>
      <p>Dapibus rutrum interdum nullam commodo lacus sed neque porttitor.</p>
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->

<!-- JAVASCRIPTS -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a><script src="/Seng3011Client/resources/js/js2/jquery.min.js"></script>
<script src="/Seng3011Client/resources/js/js2/jquery.backtotop.js"></script>
<script src="/Seng3011Client/resources/js/js2/jquery.mobilemenu.js"></script>
<!-- IE9 Placeholder Support -->
<script src="/Seng3011Client/resources/js/js2/jquery.placeholder.min.js"></script>
<!-- / IE9 Placeholder Support -->

</body>
</html>