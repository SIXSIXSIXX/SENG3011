package apiv2.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import api.exception.DateInvalidException;
import api.exception.NewsResponseException;
import apiv2.api.FootballAPI;
import apiv2.bean.News;

@Controller
public class ClientController {

	
	 

	@RequestMapping(value="/tryIt",method=RequestMethod.GET)
	public ModelAndView greeting(ModelAndView  model, @RequestParam(value="version") String version,@RequestParam(value="startD") String startD,@RequestParam(value="endD") String endD,@RequestParam(value="inId") String inId,@RequestParam(value="tpCode") String tpCode) throws JSONException, IOException, NewsResponseException, DateInvalidException {
	System.out.println(version);
	System.out.println(startD);
	System.out.println(endD);
	System.out.println(inId);
	System.out.println(tpCode);
	startD = startD.replace(" ", "T")+"Z";
	endD = endD.replace(" ", "T")+"Z";
	System.out.println(startD);
	System.out.println(endD);
	String[] inIds = inId.split(",");
	String[] tpCodes = tpCode.split(",");
	System.out.println(Arrays.toString(inIds));
	System.out.println(Arrays.toString(tpCodes));
	List<News> NewsResponseSuccess = FootballAPI.dataFilterCache(inIds,tpCodes,startD,endD);
	 Gson gson = new Gson();

	return new ModelAndView("generator", "resp", gson.toJson(NewsResponseSuccess));
	}
	 
}
