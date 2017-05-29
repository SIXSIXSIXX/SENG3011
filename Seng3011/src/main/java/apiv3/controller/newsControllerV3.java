package apiv3.controller;


import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import api.cache.CacheService;
import api.exception.DateInvalidException;
import api.exception.NewsResponseException;
import apiv2.bean.LogFileError;
import apiv2.bean.News;
import apiv3.bean.AutoResponseSuccess;
import apiv3.bean.NewsAndStockResponseSuccess;
import apiv3.bean.NewsResponseSuccess;
import apiv3.bean.StockCSV;
import apiv3.bean.StockPrice;
@CrossOrigin
@RestController
public class newsControllerV3 {

    @Autowired
    CacheService service;

    
    @RequestMapping(value="/apiv3/news/start-date/{startD}/end-date/{endD}", method=RequestMethod.GET)  
    public ResponseEntity<NewsResponseSuccess> getAllNews(@PathVariable String startD, @PathVariable String endD) throws IOException, JSONException, NewsResponseException, DateInvalidException {
    	//FootballAPI a = new FootballAPI();
    	//public check
    	Date sDate = new Date();
    	List<News> newsss = service.cachegetNews(startD,endD,new String[0],new String[0]);
    	Date eDate = new Date();
    	NewsResponseSuccess newsResponseSuccess= new NewsResponseSuccess(sDate,eDate, new String[0],new String[0],newsss);
		return new ResponseEntity<NewsResponseSuccess>(newsResponseSuccess, HttpStatus.OK);
    }
    
    
    
    //localhost:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L
    @RequestMapping(value="/apiv3/news/start-date/{startD}/end-date/{endD}/instrumentId/{instrumentId}", method=RequestMethod.GET)  
    public ResponseEntity<NewsResponseSuccess> specificIns(@PathVariable String startD, @PathVariable String endD, @PathVariable String[] instrumentId ) throws IOException, JSONException, NewsResponseException, DateInvalidException {
    	//FootballAPI a = new FootballAPI();
    	Date sDate = new Date();
    	List<News> newsss = service.cachegetNews(startD,endD,instrumentId,new String[0]);
    	Date eDate = new Date();
    	System.out.println("intd"+Arrays.toString(instrumentId));
    	NewsResponseSuccess newsResponseSuccess= new NewsResponseSuccess(sDate,eDate, instrumentId,new String[0],newsss);
		return new ResponseEntity<NewsResponseSuccess>(newsResponseSuccess, HttpStatus.OK);
    }
    
    

    
    //http://159.230.160.38:8080/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/topic-codes/ASIA
    @RequestMapping(value="/apiv3/news/start-date/{startD}/end-date/{endD}/topic-codes/{topicC}", method=RequestMethod.GET)  
    public ResponseEntity<NewsResponseSuccess> specificTc(@PathVariable String startD, @PathVariable String endD, @PathVariable String[] topicC ) throws IOException, JSONException, NewsResponseException, DateInvalidException {
    	//FootballAPI a = new FootballAPI();
    	Date sDate = new Date();
    	List<News> newsss = service.cachegetNews(startD,endD,new String[0],topicC);
    	Date eDate = new Date();
    	NewsResponseSuccess newsResponseSuccess= new NewsResponseSuccess(sDate,eDate, new String[0],topicC,newsss);
		return new ResponseEntity<NewsResponseSuccess>(newsResponseSuccess, HttpStatus.OK);
    }
    

    @RequestMapping(value="/apiv3/news/start-date/{startD}/end-date/{endD}/instrumentId/{instrumentId}/topic-codes/{topicC}", method=RequestMethod.GET)  
    public ResponseEntity<NewsResponseSuccess> specificInsAndTc(@PathVariable String startD, @PathVariable String endD, @PathVariable String[] instrumentId, @PathVariable String[]  topicC) throws IOException, JSONException, NewsResponseException, DateInvalidException {
    	//FootballAPI a = new FootballAPI();
    	//public check
    	Date sDate = new Date();
    	List<News> newsss = service.cachegetNews(startD,endD,instrumentId,topicC);
    	Date eDate = new Date();
    	//System.out.println("intd"+Arrays.toString(instrumentId));
    	NewsResponseSuccess newsResponseSuccess= new NewsResponseSuccess(sDate,eDate,instrumentId,topicC,newsss);
		return new ResponseEntity<NewsResponseSuccess>(newsResponseSuccess, HttpStatus.OK);
    }

    
    

    @RequestMapping("/apiv3/newsAndStock/start-date/{startD}/end-date/{endD}/instrumentId/{instrumentId}/topic-codes/{topicC}")  
    public ResponseEntity<NewsAndStockResponseSuccess> newsAndStockByInsAndTopicC(@PathVariable String startD, @PathVariable String endD, @PathVariable String instrumentId, @PathVariable String[]  topicC) throws IOException, JSONException, NewsResponseException, DateInvalidException, ParseException {

    	Date sDate = new Date();
    	System.out.println(Arrays.toString(topicC));
    	System.out.println(instrumentId);
    	System.out.println(startD);
    	System.out.println(endD);
    	Map<String, StockPrice> newsAndStock = service.cachegetNewsAndStock(startD,endD,instrumentId,topicC);
    	
    	Date eDate = new Date();
    	String[] instrumentIds = new String[1];
    	instrumentIds[0] = instrumentId;
    	NewsAndStockResponseSuccess newsAndStockResponseSuccess= new NewsAndStockResponseSuccess(sDate,eDate,instrumentIds,topicC,newsAndStock);
		return new ResponseEntity<NewsAndStockResponseSuccess>(newsAndStockResponseSuccess, HttpStatus.OK);
    }

    
    
    @RequestMapping("/apiv3/newsAndStock/start-date/{startD}/end-date/{endD}/instrumentId/{instrumentId}")  
    public ResponseEntity<NewsAndStockResponseSuccess> newsAndStockByIns(@PathVariable String startD, @PathVariable String endD, @PathVariable String instrumentId) throws IOException, JSONException, NewsResponseException, DateInvalidException, ParseException {
    	Date sDate = new Date();
    	String[] instrumentIds = new String[1];
    	instrumentIds[0] = instrumentId;
    	if(instrumentId.contains(",")) throw new NewsResponseException("400 RIC Exception","Instrument ID format is invalid.", new LogFileError(instrumentIds,new String[0],400,"v3"));
    	Map<String, StockPrice> newsAndStock = service.cachegetNewsAndStock(startD,endD,instrumentId, new String[0]);
    	Date eDate = new Date();
    	NewsAndStockResponseSuccess newsAndStockResponseSuccess= new NewsAndStockResponseSuccess(sDate,eDate,instrumentIds,new String[0],newsAndStock);
		return new ResponseEntity<NewsAndStockResponseSuccess>(newsAndStockResponseSuccess, HttpStatus.OK);
    }
    //TODO 
    @RequestMapping("/apiv3/autoTrading/start-date/{startD}/end-date/{endD}/instrumentId/{instrumentId}")
    public ResponseEntity<AutoResponseSuccess> autoTrading(@PathVariable String startD, @PathVariable String endD, @PathVariable String instrumentId) throws IOException, NewsResponseException, DateInvalidException{
    	Date sDate = new Date();
    	String[] instrumentIds = new String[1];
    	Map<String, StockCSV> autoData = service.stockStrategySimulate(startD,endD,instrumentId);
    	Date eDate = new Date();
    	AutoResponseSuccess autoResponseSuccess= new AutoResponseSuccess(sDate,eDate,instrumentIds,new String[0],autoData);
    	return new ResponseEntity<AutoResponseSuccess>(autoResponseSuccess, HttpStatus.OK);
    }
    
}