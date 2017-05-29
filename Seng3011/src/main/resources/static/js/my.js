$(function(){
	if(localStorage.getItem("docstate")=="false"){
		$('.checkdoc').attr("aria-expanded","true").removeClass("collapsed");
		$('#documentation').attr("aria-expanded","true").addClass("in");
	}
	if(localStorage.getItem("tustate")=="false"){
		$('.checktu').attr("aria-expanded","true").removeClass("collapsed");
		$('#tutorial').attr("aria-expanded","true").addClass("in");
	}
	var victor = new Victor("container", "output");
	var theme = ["#000000", "#ffffff"];
	victor(theme).set();
	$('.checkdoc').click(function(){
		localStorage.setItem("docstate",$('.checkdoc').attr("aria-expanded"));
	});
	$('.checktu').click(function(){
		localStorage.setItem("tustate",$('.checktu').attr("aria-expanded"));
	});
	
})
