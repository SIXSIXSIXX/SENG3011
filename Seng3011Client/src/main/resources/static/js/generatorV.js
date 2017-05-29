function News(){
		this.x = new Array();
		this.y= new Array(); 
		this.ids= new Array();
		this.tps= new Array();
		this.text= new Array(); 
		this.body= new Array();
		this.time= new Array();
}

function draw(resp){
	
	
	var stock = {
			 name:'stock', 
			 x: new Array(),
			  close: new Array(),
			  decreasing: {line: {color: 'green'}}, 
			  high: new Array(),
			  increasing: {line: {color: 'red'}}, 		  
			  line: {color: 'rgba(31,119,180,1)'}, 		  
			  low: new Array(),
			  open: new Array(),
			  type: 'candlestick', 
			  xaxis: 'x', 
			  yaxis: 'y'
		};	
		var gray ='#7F7F7F';
		var blue ='#1620FB';
		var sell ='#B700FB';
		var buy ='#00D5FB';
		var afd = 'star';
		var afda = 'triangle-down-dot';
		
		
		var positiveNews= new News();
		var negativeNews= new News();
		var neutralNews= new News();
		

		var array = resp.newsDataSet;
	    var positive = document.getElementById("Positive");
	    var positiveIndex = 0;
	    var negative = document.getElementById("Negative");
	    var negativeIndex = 0;
	    var netural = document.getElementById("Neutral");
	    var ind = document.getElementById("instrument").value;
	    var neturalIndex = 0;
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
			stock.open.push(array[rec].open);
			stock.x.push(rec);
			stock.high.push(array[rec].high);
			stock.low.push(array[rec].low);
			stock.close.push(array[rec].close);
			

			var i = 0;
			var gap = (max-min)/array[rec].news.length;
			console.log(gap);
			array[rec].news.forEach(n => {
				
				if(n.type == 'Positive') {
					positiveNews.x.push(rec);
					positiveNews.y.push(array[rec].low+i*gap);
					positiveNews.ids.push(n.instrumentIDs.toString());
					positiveNews.tps.push(n.topicCodes.toString());
					positiveNews.text.push(n.headline); 
					positiveNews.body.push(n.newsText);
					positiveNews.time.push(n.timeStamp);
			 		var opt = document.createElement('option');
			 		opt.innerHTML  = n.headline;
			 		
			 		opt.value = positiveIndex;
			 	    positive.appendChild(opt);
			 	   	positiveIndex = positiveIndex+1;
			 	}
			 	else if(n.type == 'Negative'){
					negativeNews.x.push(rec);
					negativeNews.y.push(array[rec].low+i*gap);
			 		negativeNews.ids.push(n.instrumentIDs.toString());
			 		negativeNews.tps.push(n.topicCodes.toString());
					negativeNews.text.push(n.headline); 
					negativeNews.body.push(n.newsText);
					negativeNews.time.push(n.timeStamp);
					
			 		var opt = document.createElement('option');
			 		opt.innerHTML = n.headline;
			 		opt.value= negativeIndex;
				 	negative.appendChild(opt);
			 		negativeIndex = negativeIndex+1;
			 		
			 	}
			 	else{
					neutralNews.x.push(rec);
					neutralNews.y.push(array[rec].low+i*gap);
			 		neutralNews.ids.push(n.instrumentIDs.toString());
			 		neutralNews.tps.push(n.topicCodes.toString());
			 		neutralNews.text.push(n.headline); 
					neutralNews.body.push(n.newsText);
					neutralNews.time.push(n.timeStamp);
					

			 		var opt = document.createElement('option');
			 		opt.innerHTML = n.headline;
			 		opt.value = neturalIndex;
			 		netural.appendChild(opt);
				 	neturalIndex = neturalIndex+1;
			 	}
				i++;
			});
	 }

	localStorage.setItem("neutralNews", JSON.stringify(neutralNews));
	localStorage.setItem("negativeNews", JSON.stringify(negativeNews));
	localStorage.setItem("positiveNews", JSON.stringify(positiveNews));


	
	var posNewsPlot = {	 
			y: positiveNews.y,
			x: positiveNews.x,
			text:positiveNews.text,
			mode: 'markers',
			type: 'scatter',
			name: 'positive news',
			marker:{symbol:'dot', size:10, color:'#F27F03'}
	};
	
	var negNewsPlot = {	 
			y: negativeNews.y,
			x: negativeNews.x,
			text:negativeNews.text,
			mode: 'markers',
			type: 'scatter',
			name: 'negative news',
			marker:{symbol:'dot', size:10, color:'#1620FB'}
	};
	
	var neuNewsPlot = {	 
			y: neutralNews.y,
			x: neutralNews.x,
			text:neutralNews.text,
			mode: 'markers',
			type: 'scatter',
			name: 'neutral news',
			marker:{symbol:'dot', size:10, color:'#7F7F7F'}
	};
	
	var myPlot = document.getElementById('myDiv'),
	    data = [posNewsPlot,negNewsPlot,neuNewsPlot,stock],
	    layout = {hovermode:'closest',
	              title:ind
	     };

	Plotly.newPlot('myDiv', data, layout);
	
	myPlot.on('plotly_click', function(data){
		  var pn='',
		      tn='',
		      colors=[];
		  var counter = 0;
		  console.log(data.points.length);
		 for(var i=0; i < data.points.length; i++){
	 	 if(data.points.length == 1){
	 		 
	 		 
			pn = data.points[i].pointNumber;
			tn = data.points[i].curveNumber;
			 
			if(tn == 0){
				var news = JSON.parse(localStorage.getItem("positiveNews"));
				document.getElementById("newsTimeAndType").innerHTML = "timeStamp: "+news.time[pn]+"&emsp;&emsp;&emsp;"+"type: Positive";
			}
			else if(tn == 1) {
				var news = JSON.parse(localStorage.getItem("negativeNews"));	
				document.getElementById("newsTimeAndType").innerHTML = "timeStamp: "+news.time[pn]+"&emsp;&emsp;&emsp;"+"type: Negative";
			}
			else{
				
				var news = JSON.parse(localStorage.getItem("neutralNews"));
				document.getElementById("newsTimeAndType").innerHTML = "timeStamp: "+news.time[pn]+"&emsp;&emsp;&emsp;"+"type: Neutral";
			}
			document.getElementById("newsHead").innerHTML = news.text[pn];
			document.getElementById("newsBody").innerHTML= news.body[pn];
	 	};
			 
			 
		 } 
	
		});	
}

function changeOther(id1,id2,id3) {

	var i = document.getElementById(id1).selectedIndex-1;

	if(id1 == 'Positive') var news = JSON.parse(localStorage.getItem("positiveNews"));
		
	else if(id1 =='Negative') var news = JSON.parse(localStorage.getItem("negativeNews"));
	
	
	else var news = JSON.parse(localStorage.getItem("neutralNews"));
	

	document.getElementById("newsHead").innerHTML = news.text[i];
	document.getElementById("newsTimeAndType").innerHTML = "timeStamp: "+news.time[i]+"&emsp;&emsp;&emsp;"+"type: "+id1;
	document.getElementById("newsBody").innerHTML= news.body[i];
	 
	document.getElementById(id2).selectedIndex = 0;
	document.getElementById(id3).selectedIndex = 0;
	
}