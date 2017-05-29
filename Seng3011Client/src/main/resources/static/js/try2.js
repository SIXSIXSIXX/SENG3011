var URL = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.historicaldata%20where%20symbol%20in%20(%22GOOG%22)%20and%20startDate%20%3D%20%222016-01-01%22%20and%20endDate%20%3D%20%222016-09-30%22%0A%09%09&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='

Plotly.d3.json(URL, (err, resp) => {
  if(err) console.log(err)
  
  var data = formatData(resp)
  
  var layout = {
    title: 'GOOG',
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
  
  
  //Plotly.plot('ohlc', data.map(makeOHLC), layout)
  
  Plotly.plot('candlestick', data.map(makeCandlestick), layout)
})
function formatData(resp) {
  var quotes = resp.query.results.quote;
  var hash = {};
  quotes.forEach(q => {
    var h = hash[q.Symbol]
    
    if(!h) h = hash[q.Symbol] = makeBlank(q.Symbol)
    
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