package apiv1.controller;


import java.io.IOException;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.json.JSONException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import apiv1.api.FootballAPI;
import apiv1.bean.NewsList;
import apiv1.bean.User;

@RestController
public class newsController {

	    
    @RequestMapping("/greeting")   
    public User greeting(@RequestParam(value="name", defaultValue="World") String name) {
    	System.out.println("afds");
        return new User('1',
                            name.toString());
    }
    //http://159.230.160.38:8080/apiv1/start-date/2015-10-01T00:00:00Z/End-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L/topic-codes/AMERS,COM
    @RequestMapping(value="/apiv1/start-date/{startD}/end-date/{endD}/instrumentId/{instrumentId}/topic-codes/{topicC}", method=RequestMethod.GET)  
    public ResponseEntity<NewsList> specificInsAndTc(@PathVariable String startD, @PathVariable String endD, @PathVariable String[] instrumentId, @PathVariable String[] topicC ) throws IOException, JSONException {
    	FootballAPI a = new FootballAPI();
    	//public check
    	NewsList newsList = a.dataFilter(instrumentId,topicC,startD,endD);
        return new ResponseEntity<NewsList>(newsList, HttpStatus.OK);
    }
    
    //http://159.230.160.38:8080/apiv1/start-date/2015-10-01T00:00:00Z/End-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L
    @RequestMapping(value="/apiv1/start-date/{startD}/end-date/{endD}/instrumentId/{instrumentId}", method=RequestMethod.GET)  
    public NewsList specificIns(@PathVariable String startD, @PathVariable String endD, @PathVariable String[] instrumentId ) throws IOException, JSONException {
    	FootballAPI a = new FootballAPI();

    	NewsList newsList = a.dataFilter(instrumentId,new String[0],startD,endD);
        return newsList;
    }
    
    //http://159.230.160.38:8080/apiv1/start-date/2015-10-01T00:00:00Z/End-date/2015-10-10T00:00:00Z/topic-codes/ASIA
    @RequestMapping(value="/apiv1/start-date/{startD}/end-date/{endD}/topic-codes/{topicC}", method=RequestMethod.GET)  
    public NewsList specificTc(@PathVariable String startD, @PathVariable String endD, @PathVariable String[] topicC ) throws IOException, JSONException {
    	FootballAPI a = new FootballAPI();

    	NewsList newsList = a.dataFilter(new String[0],topicC,startD,endD);
        return newsList;
    }
    
    //http://159.230.160.38:8080/apiv1/start-date/2015-10-01T00:00:00Z/End-date/2015-10-10T00:00:00Z
    @RequestMapping(value="/apiv1/start-date/{startD}/end-date/{endD}", method=RequestMethod.GET)  
    public NewsList getAllNews(@PathVariable String startD, @PathVariable String endD ) throws IOException, JSONException {
    	FootballAPI a = new FootballAPI();

    	NewsList newsList = a.dataFilter(new String[0],new String[0],startD,endD);
        return newsList;
    }
    
    
}