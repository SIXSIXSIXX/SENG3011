var URL = 'http://ec2-54-160-211-66.compute-1.amazonaws.com:3000/api/company_returns?InstrumentID=ABP.AX&ListOfVar=CM_Return&UpperWindow=100&LowerWindow=100&DateOfInterest=10%2F12%2F2012'

Plotly.d3.json(URL, (err, resp) => {
  if(err) console.log(err)

  var data = formatData(resp)
  
  var layout = {
    title: resp.CompanyReturns[0].Data,
    xaxis: {
      range: [new Date(2016, 8, 1), new Date(2016, 8, 31)].map(toMS),
      rangeselector: {
        x: 0,
        y: 1.2,
        xanchor: 'left',
        font: {size:8},
        buttons: [{
            step: 'month',
            stepmode: 'backward',
            count: 1,
            label: '1 month'
        }, {
            step: 'month',
            stepmode: 'backward',
            count: 6,
            label: '6 months'
        }, {
            step: 'all',
            label: 'All dates'
        }],
      }
    },
    legend: {
      x: 0.5,
      xanchor: 'center',
      y: 1,
      yanchor: 'bottom',
      orientation: 'h'
    }
  }
  var trace2 = {
		  x: ['2013-01-04', '2013-01-05', '2013-01-06', '2013-01-09', '2013-01-10'],
		  y: [116, 115, 114, 113, 116],
		  mode: 'markers',
		  name: 'steepest',
		  line: {color: 'black'},
		  type: 'scatter'
		};
  var trace1 = data.map(makeCandlestick);
  
  Plotly.newPlot('candlestick',  [trace1,trace2]);
  
//  //Plotly.plot('ohlc', data.map(makeOHLC), layout)
//  
//  Plotly.newPlot('candlestick', data.map(makeCandlestick), layout);
})
function formatData(resp) {
  var quotes = resp.CompanyReturns[0].Data;
  var hash = {};
  var h = hash[resp.CompanyReturns[0].InstrumentID]
  if(!h) h = hash[resp.CompanyReturns[0].InstrumentID] = makeBlank(resp.CompanyReturns[0].InstrumentID);
  quotes.forEach(q => {
     h = hash[resp.CompanyReturns[0].InstrumentID]
    
  //  if(!h) h = hash[q.Symbol] = makeBlank(q.Symbol)
    
    h.x.push(q.Date)
    h.open.push(q.Open)
    h.high.push(q.High)
    h.low.push(q.Low)
    h.close.push(q.Close)
  })
  
  return Object.keys(hash).map(k => hash[k])
}

makeBlank = (name) => { 
  return {
    name: name,
    x: [], open: [], high: [], low: [], close: []
  }
}  

makeCandlestick = (trace, i) => {
  trace.type = 'candlestick';
  
  return trace
}

toMS = (date) => date.getTime()