function draw(){
	var baseurl = "http://159.203.160.38:8080/Seng3011/apiv3/autoTrading/"
	var c = document.getElementById("company");
	var company = c.options[c.selectedIndex].value;
	
	var startD= document.getElementById("startD").value;
	var endD = document.getElementById("endD").value;
	
	baseurl+='start-date/'+startD+'T00:00:00Z/'+'end-date/'+endD+'T00:00:00Z/';
	if(company != null && company != '') baseurl+='instrumentId/'+company+'/';
	
	
	
var ua = "http://localhost:8080/Seng3011/apiv3/autoTrading/start-date/2015-10-01T00:00:00Z/end-date/2016-01-30T00:00:00Z/instrumentId/AGO.AX/";
var resp = JSON.parse(httpGet(baseurl));
var stock =[];
var stockEvent = [];
var sts = [];
var array = resp.newsDataSet;

//var totalProfit = array[array.length-1].currState.totalProfit.toFixed(2);
var last = "";
var maxdrawDown = 0;
for (var rec in array) {
	last = rec;
    stock.push({
      "date":rec,
      "open": array[rec].open,
      "high": array[rec].high,
      "low": array[rec].low,
      "close": array[rec].close
    });

    for(var i in array[rec].news){
    	var news = array[rec].news[i];
    	var nt = news.type;
    	
    	var c = "#0066ff";
    	if(nt == "Negative")var c = "#666600";
    	stockEvent.push({
    		"date":rec,
    		"type": "sign",
    	    "backgroundColor": c,
    	    "fontSize":20,
    	    "color":"#ffffff",
    	    "graph": "g1",
    	    "text": "news",
    	    "value":[news.timeStamp+"   "+nt,news.newsText],
    	    "description":news.headline
      });
    }
	var n = array[rec].currState;
	var changeLot = n.changeLot;
	var operation = "buy";
	var type = "triangleUp";
	var color = "#ff0000";
	if(changeLot == 0) continue;
	else if(changeLot < 0){
		operation="sell";
		type = "triangleDown";
		color="#208000";
	}
	if(n.investedCaptail>maxdrawDown) maxdrawDown = n.investedCaptail;
	var cl = Math.abs(changeLot).toFixed(2);
	var cp = n.changePoint.toFixed(2);
	var sp = n.singleProfit.toFixed(2);
	var tp = n.totalProfit.toFixed(2);
	var ic = n.investedCaptail.toFixed(2);
	var rl = n.remainLots.toFixed(2);
	var be = n.breakEvenPoint.toFixed(2);
	sts.push({
		"date":rec,
		"type": type,
	    "backgroundColor": color,
	    "fontSize":20,
	    "color":"#ffffff",
	    "graph": "g1",
	    "text": operation,
	    "description": "Lot:"+cl+"\nDealPrice:"+cp+"\nSingleProfit:"+sp+"\nTotalProfit"+tp+"\nInvestment"+ic+"\nRemainLots"+rl+"\nbreakEvenAt"+be
	});
    }
      
  
//alert(JSON.stringify(stock));
//alert(JSON.stringify(sts));
sts = sts.concat(stockEvent);
var totalProfit = array[last].currState.totalProfit.toFixed(2);
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "stock",
"theme": "black",

  //"color": "#fff",
  "dataSets": [ {
	  
	 "title":"stockChart",
    "fieldMappings": [ {
      "fromField": "open",
      "toField": "open"
    }, {
      "fromField": "high",
      "toField": "high"
    }, {
      "fromField": "low",
      "toField": "low"
    }, {
      "fromField": "close",
      "toField": "close"
    } ],
    "compared": false,
    "categoryField": "date",

		 "dataProvider": stock,

    /**
     * data loader for events data
     */
    "stockEvents":sts

  }],
  "dataDateFormat": "YYYY-MM-DD",

  "panels": [ {
      "title": "Company: "+company+" TotalProfit: "+totalProfit+" MaxDrownDown: "+maxdrawDown,
      "percentHeight": 70,

      "stockGraphs": [ {
         "id": "g1",
        "type": "candlestick",
        "balloonText": "Open:<b>[[open]]</b><br>Low:<b>[[low]]</b><br>High:<b>[[high]]</b><br>Close:<b>[[close]]</b><br>",
        "openField": "open",
        "closeField": "close",
        "highField": "high",
        "lowField": "low",
        "valueField": "close",
        "lineColor": "#fff",
        "fillColors": "#fff",
        "negativeLineColor": "#db4c3c",
        "negativeFillColors": "#db4c3c",
        "fillAlphas": 1,
        "comparedGraphLineThickness": 2,
        "columnWidth": 0.7,
        "useDataSetColors": false,
        "comparable": false,
        "compareField": "close",
        "showBalloon": true,
        "proCandlesticks": true
      } ],

      "stockLegend": {
        "valueTextRegular": undefined,
        "periodValueTextComparing": "[[percents.value.close]]%"
      }

    }

   
  ],

  "panelsSettings": {
    //    "color": "#fff",
    "plotAreaFillColors": "#333",
    "plotAreaFillAlphas": 1,
    "marginLeft": 60,
    "marginTop": 5,
    "marginBottom": 5
  },

  "chartScrollbarSettings": {
    "graph": "g1",
    "graphType": "line",
    "usePeriod": "WW",
    "backgroundColor": "#333",
    "graphFillColor": "#666",
    "graphFillAlpha": 0.5,
    "gridColor": "#555",
    "gridAlpha": 1,
    "selectedBackgroundColor": "#444",
    "selectedGraphFillAlpha": 1
  },

  "categoryAxesSettings": {
    "equalSpacing": true,
    "gridColor": "#555",
    "gridAlpha": 1
  },

  "valueAxesSettings": {
    "gridColor": "#555",
    "gridAlpha": 1,
    "inside": false,
    "showLastLabel": true
  },

  "chartCursorSettings": {
    "pan": true,
    "valueLineEnabled": true,
    "valueLineBalloonEnabled": true,
    "valueBalloonsEnabled": true
  },

  "legendSettings": {
    //"color": "#fff"
  },

  "stockEventsSettings": {
    "showAt": "high",
    "type": "pin",
    "rollOverColor":"#a31aff"
  },

  "balloon": {
    "textAlign": "left",
    "verticalPadding":4
  }
} );
chart.addListener('clickStockEvent', chartClick);
}

function httpGet(url) {
  var xmlHttp = new XMLHttpRequest();
  xmlHttp.open("GET", url, false); // false for synchronous request
  xmlHttp.send(null);
  return (xmlHttp.responseText);
}



function chartClick (event) {
    document.getElementById("newsTitle").innerHTML=event.eventObject.description;
    document.getElementById("newsSubTitle").innerHTML=event.eventObject.value[0];
    document.getElementById("newsBody").innerHTML=event.eventObject.value[1];
}