
function generateData(){
	var baseurl = "http://159.203.160.38:8080/Seng3011/"
	var f = document.getElementById("fea");
	var feature = f.options[f.selectedIndex].value;
	var e = document.getElementById("version");
	var version = e.options[e.selectedIndex].value;
	
	var inds = document.getElementById("instrument").value;
//	if(version == 'apiv3' && feature =="stock" && inds.includes(",")){
//		 document.getElementById('insError').innerHTML ="instrument id format error, only support one id";
//		
//	}
	var startD= document.getElementById("startD").value;
	var tps =  document.getElementById("topic").value;
	var endD = document.getElementById("endD").value;
	baseurl += version+'/';
	if(version=='apiv3'&& feature== 'news'){
		baseurl+='news/';
		
	}else if(version=='apiv3'&& feature== 'stock'){
		
		baseurl+='newsAndStock/';
	}
	var ud="http://localhost:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-11-30T00:00:00Z/instrumentId/BHP.AX/";
	baseurl+='start-date/'+startD+'T00:00:00Z/'+'end-date/'+endD+'T00:00:00Z/';
	if(inds != null && inds != '') baseurl+='instrumentId/'+inds+'/';
	if(tps != null && tps != '') baseurl+='topic-codes/'+tps+'/';
	//alert(baseurl);
	var response = JSON.parse(httpGet(baseurl));

	 $('.json').html( JSON.stringify(response, null, "\t"));
	 if(version=='apiv3'&& feature== 'stock' && response.hasOwnProperty('logFileSuccess')) draw(response);
}

function httpGet(url){
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", url, false ); // false for synchronous request
    xmlHttp.send( null );
    return(xmlHttp.responseText);
}