<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>stock master</title>
</head>
<body onload="showStuff('pageOne', 'pageTwo')">

<button  onclick="showStuff('pageOne', 'pageTwo')"> pageOne </button>
<button  onclick="showStuff('pageTwo', 'pageOne')"> pageTwo </button>
<div id="pageOne">
	 <form name = "request" action="stockAndNews" onSubmit="return saveComment();">
        <ul>
        <li>
            <label>company</label> <input type="text" name="company" id="company" value=""/>
        </li>
        <li>
            <label>date</label> <input type="text" name="date" id="date" value=""/>
        </li>
        <li>
            <label>lowWindow</label> <input type="text" name="lowWindow"  id="lowWindow" value=""/>
        </li>
        <li>
            <label>upperWindow</label> <input type="text" name="upperWindow" id="upperWindow" value=""/>
        </li>
        </ul>
        <button type="submit">submit</button>        
	</form>
</div>

<div id= "pageTwo">
<label>company</label> <input type="text" name="1" value = "${res.getCompany()}"/>
</div>


JavaScript:
<script type="text/javascript">
document.getElementById("company").value = localStorage.getItem("savedCompany");
document.getElementById("date").value = localStorage.getItem("savedDate");
document.getElementById("lowWindow").value = localStorage.getItem("savedLowWindow");
document.getElementById("upperWindow").value = localStorage.getItem("savedUpperWindow");
function saveComment() {
    var savedCompany = document.getElementById("company").value;
    var savedDate = document.getElementById("date").value;
    var savedLowWindow = document.getElementById("lowWindow").value;
    var savedUpperWindow = document.getElementById("upperWindow").value;
  //  if (comment == "") {
 //       alert("Please enter a comment in first!");
  //      return false;
 //   }
    localStorage.setItem("savedCompany", savedCompany);
    localStorage.setItem("savedDate", savedDate);
    localStorage.setItem("savedLowWindow", savedLowWindow);
    localStorage.setItem("savedUpperWindow", savedUpperWindow);
    document.request.submit();
    //return true;
}
</script>

<script type="text/javascript">
function showStuff(id1, id2) {
    document.getElementById(id1).style.visibility = 'visible';
    // hide the lorem ipsum text
    document.getElementById(id2).style.visibility  = 'hidden';
    // hide the link
    //btn.style.display = 'none';
}
</script>
</body>
</html>