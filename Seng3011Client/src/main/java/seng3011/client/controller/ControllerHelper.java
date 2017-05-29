package seng3011.client.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import seng3011.client.model.Request;

public class ControllerHelper {
	
	static final String REST_URI = "http://localhost:8080/Seng3011/";
	
	
	public static String getNews(String version, String startD, String endD, String inId, String tpCode) throws IOException{
		URL obj = new URL(createUrl(version,startD,endD,inId,tpCode));
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : ");
		System.out.println("Response Code : " + responseCode);
		BufferedReader in;
		if(responseCode == 200)
			in = new BufferedReader(new InputStreamReader(con.getInputStream()));		
		else in = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		return response.toString();
		
	}
	
	public static String getNewsAndStock(Request request) throws IOException{
	//	String url = REST_URI +"apiv3/newsAndStock"+"/start-date/"+request.getStartD()+"/end-date/"+request.getEndD()+"/instrumentId/"+request.getCompany()+'/';
		String url = "http://localhost:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-15T00:00:00Z/instrumentId/BLT.L/topic-codes/COA";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : ");
		System.out.println("Response Code : " + responseCode);
		BufferedReader in;
		if(responseCode == 200)
			in = new BufferedReader(new InputStreamReader(con.getInputStream()));		
		else in = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		return response.toString();
		
	}
	
	//http://localhost:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L/topic-codes/AMERS,COM
	public static String createUrl(String version, String startD, String endD, String inId, String tpCode){
		String url = REST_URI +version +"/start-date/"+startD+"/end-date/"+endD;
		if(inId != "")	url += "/instrumentId/"+inId;
		if(tpCode != "")	url += "/topic-codes/"+tpCode;
		System.out.println("url is "+url);
		return url;		
	}
}
