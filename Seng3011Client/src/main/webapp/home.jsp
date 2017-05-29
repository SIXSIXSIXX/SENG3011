
	<%@ page language="java" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/amstock.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/dataloader/dataloader.min.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
</head>
<body onload = "a()">
<div id="chartdiv" style="width: 100%; height:200px;"></div>		

<script>
function a(){
var ua = "http://159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-30T00:00:00Z/instrumentId/BLT.L/";
var resp = JSON.parse(httpGet(ua));
var stock =[];
var stockEvent = [];
var array = resp.newsDataSet;
/*  "date": new Date( 2010, 11, 26 ),
      "showOnAxis": true,
      "backgroundColor": "#85CDE6",
      "type": "pin",
      "text": "Z",
      "graph": "g1",
      "description": "This is description of an event" */

for (var rec in array) {
    stock.push({
      "date":rec,
      "open": array[rec].open,
      "high": array[rec].high,
      "low": array[rec].low,
      "close": array[rec].close
    });

    for(var n in array[rec].news){
    	stockEvent.push({
      "date":rec,
      "showOnAxis": true,
      "type": "sign",
      "text": n.headline,
      "graph": "g1",
      "description": "This is description of an event" 
      });
    }
      
  };
alert(JSON.stringify(stock));

var chart = AmCharts.makeChart( "chartdiv", {
  "type": "stock",
"theme": "light",

  //"color": "#fff",
  "dataSets": [ {
    "title": "MSFT",
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
    "stockEvents": [ {
      "date": "2015-10-19",
      "type": "sign",
      "backgroundColor": "#85CDE6",
      "graph": "g1",
      "text": "c",
      "description": "buy:1111\nLot:50\n"
    }]

  }],
  "dataDateFormat": "YYYY-MM-DD",

  "panels": [ {
      "title": "Value",
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
        "comparable": true,
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
    "valueLineBalloonEnabled": true
  },

  "legendSettings": {
    //"color": "#fff"
  },

  "stockEventsSettings": {
    "showAt": "high",
    "type": "pin"
  },

  "balloon": {
    "textAlign": "left",
    "offsetY": 10
  },

  "periodSelector": {
    "position": "bottom",
    "periods": [ {
        "period": "DD",
        "count": 10,
        "label": "10D"
      }, {
        "period": "MM",
        "count": 1,
        "label": "1M"
      }, {
        "period": "MM",
        "count": 6,
        "label": "6M"
      }, {
        "period": "YYYY",
        "count": 1,
        "label": "1Y"
      }, {
        "period": "YYYY",
        "count": 2,
        "selected": true,
        "label": "2Y"
      },
      /* {
           "period": "YTD",
           "label": "YTD"
         },*/
      {
        "period": "MAX",
        "label": "MAX"
      }
    ]
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
    alert(event.date);
}
</script>
</body>
</html>