package apiv2.controller;


import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import api.cache.CacheService;
import api.exception.DateInvalidException;
import api.exception.NewsResponseException;
import apiv2.bean.News;
import apiv2.bean.NewsResponseSuccess;

@RestController
public class newsControllerV2 {

    @Autowired
    CacheService service;

    
    @RequestMapping(value="/apiv2/start-date/{startD}/end-date/{endD}", method=RequestMethod.GET)  
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
    @RequestMapping(value="/apiv2/start-date/{startD}/end-date/{endD}/instrumentId/{instrumentId}", method=RequestMethod.GET)  
    public ResponseEntity<NewsResponseSuccess> specificIns(@PathVariable String startD, @PathVariable String endD, @PathVariable String[] instrumentId ) throws IOException, JSONException, NewsResponseException, DateInvalidException {
    	//FootballAPI a = new FootballAPI();
    	Date sDate = new Date();
    	List<News> newsss = service.cachegetNews(startD,endD,instrumentId,new String[0]);
    	Date eDate = new Date();
    	NewsResponseSuccess newsResponseSuccess= new NewsResponseSuccess(sDate,eDate, instrumentId,new String[0],newsss);
		return new ResponseEntity<NewsResponseSuccess>(newsResponseSuccess, HttpStatus.OK);
    }
    
    

    
    //http://159.230.160.38:8080/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/topic-codes/ASIA
    @RequestMapping(value="/apiv2/start-date/{startD}/end-date/{endD}/topic-codes/{topicC}", method=RequestMethod.GET)  
    public ResponseEntity<NewsResponseSuccess> specificTc(@PathVariable String startD, @PathVariable String endD, @PathVariable String[] topicC ) throws IOException, JSONException, NewsResponseException, DateInvalidException {
    	//FootballAPI a = new FootballAPI();
    	Date sDate = new Date();
    	List<News> newsss = service.cachegetNews(startD,endD,new String[0],topicC);
    	Date eDate = new Date();
    	NewsResponseSuccess newsResponseSuccess= new NewsResponseSuccess(sDate,eDate, new String[0],topicC,newsss);
		return new ResponseEntity<NewsResponseSuccess>(newsResponseSuccess, HttpStatus.OK);
    }
    

    

    @RequestMapping(value="/apiv2/start-date/{startD}/end-date/{endD}/instrumentId/{instrumentId}/topic-codes/{topicC}", method=RequestMethod.GET)  
    public ResponseEntity<NewsResponseSuccess> specificInsAndTc(@PathVariable String startD, @PathVariable String endD, @PathVariable String[] instrumentId, @PathVariable String[]  topicC) throws IOException, JSONException, NewsResponseException, DateInvalidException {
    	//FootballAPI a = new FootballAPI();
    	//public check
    	Date sDate = new Date();
    	List<News> newsss = service.cachegetNews(startD,endD,instrumentId,topicC);
    	Date eDate = new Date();
    	NewsResponseSuccess newsResponseSuccess= new NewsResponseSuccess(sDate,eDate,instrumentId,topicC,newsss);
		return new ResponseEntity<NewsResponseSuccess>(newsResponseSuccess, HttpStatus.OK);
    }
    

}