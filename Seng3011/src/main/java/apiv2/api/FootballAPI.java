package apiv2.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONObject;

import api.exception.DateInvalidException;
import api.exception.NewsResponseException;
import apiv2.bean.LogFileError;
import apiv2.bean.News;


public class FootballAPI {

	
	private static String url = "http://adage.cse.unsw.edu.au:8005/v1/graphs/sparql?query=";
	private static String query = "PREFIX w3: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>PREFIX fe: <http://adage.cse.unsw.edu.au/ontology/financial-events#>PREFIX ins: <http://adage.cse.unsw.edu.au/resource/financial-events#>PREFIX xs: <http://www.w3.org/2001/XMLSchema#>SELECT ?s ?id ?time ?headline ?newsBody ?topicCode ?ric WHERE {?s w3:type fe:TRTHNewsEvent.?s fe:messageId ?id.?s fe:relatedRIC ?ric.?s fe:timeStamp ?t.?t fe:startTime ?time.?s fe:newsText ?newsBody.?s fe:headLine ?headline.?s fe:topicCode ?topicCode.?s fe:languageOfNews ?lang.?s fe:languageOfNews \"en\".";
	public FootballAPI() throws IOException{

	}

	
	
	
	
	public static List<News> dataFilterCache(String[] instrIds,String tpCodes[], String startD, String endD) throws IOException, NewsResponseException, DateInvalidException {
		
		checkDate(startD, endD, instrIds, tpCodes);
		String queryUrl  = query;
		if (instrIds.length!= 0 && !Arrays.toString(instrIds).equals("[]")){
			
			String instrId = convertInstrIdFormat(instrIds);
			queryUrl += instrId;
			checkInsIds(instrIds, tpCodes);
		}
		if(tpCodes.length!=0 && !Arrays.toString(tpCodes).equals("[]")){
		String tpCode = convertTpcodeFormat(tpCodes);
			queryUrl+=tpCode;
			checktpCodes(instrIds, tpCodes);
		}
		String date = "FILTER(xs:dateTime(?time) > \""+startD+"\"^^xs:dateTime && xs:dateTime(?time) <= \""+endD+"\"^^xs:dateTime)";
		//String date ="FILTER(xs:dateTime(?time) > \"2015-10-01T00:00:00Z\"^^xs:dateTime && xs:dateTime(?time) <= \"2015-10-10T00:00:00Z\"^^xs:dateTime)";


		String encodedUrl = url+ URLEncoder.encode(queryUrl+date+"}", "UTF-8");
		URL fUrl = new URL(encodedUrl);
		HttpURLConnection con = (HttpURLConnection) fUrl.openConnection();

//		//add request header
//		con.setRequestProperty("X-Auth-Token", " d53ed7e170df4cf886b688b9bd80b3f5");
		String userpass = "student" + ":" + "studentML";
		String basicAuth = "Basic  " + new String(new Base64().encode(userpass.getBytes()));
		con.setRequestProperty ("Authorization", basicAuth);
		con.setRequestMethod("GET");
		con.setRequestProperty("Accept", "application/sparql-results+json");
		
		
		//long getres =  System.currentTimeMillis();
		
		
		BufferedReader in = new BufferedReader(
		        new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuilder response = new StringBuilder();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		String str = response.toString();
		//System.out.println(str);
		JSONObject json = new JSONObject(str);
		JSONArray array = json.getJSONObject("results").getJSONArray("bindings");

		return StoreToBean(instrIds, tpCodes, array);
	}
	
	
	
	
	

	private static void checktpCodes(String[] instrIds,String[] tpCodes) throws NewsResponseException {
		for(String str:tpCodes){
			//if(str==null)break;
			if(str.matches("(?:(?:\\.[A-Z0-9]+|[A-Z0-9]+(?:\\.[A-Z]+)?),)*(?:\\.[A-Z0-9]+|[A-Z0-9]+(?:\\.[A-Z]+)?)")){
				continue;
			}
			else throw new NewsResponseException("400 TopicCodes Exception","TopicCode format is invalid.", new LogFileError(instrIds,tpCodes,400));
		
			
		}
		
	}


	private static void checkInsIds(String[] instrIds, String[] tpCodes) throws NewsResponseException {
		for(String str:instrIds){
			//if(str==null)break;
			if(str.matches("(?:(?:\\.[A-Z0-9]+|[A-Z0-9]+(?:\\.[A-Z]+)?),)*(?:\\.[A-Z0-9]+|[A-Z0-9]+(?:\\.[A-Z]+)?)")){
				continue;
			}
			else throw new NewsResponseException("400 RIC Exception","Instrument ID format is invalid.", new LogFileError(instrIds,tpCodes,400));
		
		}
	}

	// check empty
	// check startD endD format
	// check startD before and equal to endD
	private static void checkDate(String startD, String endD,String[] instrIds,String tpCodes[]) throws NewsResponseException, DateInvalidException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		sdf.setLenient(false);
		Date d;
		Date f;
		try {
			d = sdf.parse(startD);
			f = sdf.parse(endD);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			
			throw new DateInvalidException("Date Exception","Date format  is incorrect.", new LogFileError(instrIds,tpCodes,400));
		}
		if(d.after(f)) throw new DateInvalidException("Date Exception","End date is before start date.", new LogFileError(instrIds,tpCodes,400));
		
	}


	private static String convertInstrIdFormat(String[] instrIds) {
		int length = instrIds.length;
		String finalFormat = "FILTER (?ric = ins:RIC_"+instrIds[0];
		for(int i = 1;i<length; i++){
			finalFormat += " || ?ric = ins:RIC_"+instrIds[i];
		}
		if(length==1)finalFormat += "|| ?ric = ins:RIC_"+instrIds[0];
		return finalFormat+=")";

		
	}


	private static String convertTpcodeFormat(String[] tpCodes) {
		
		//String tpCode = "FILTER (?topicCode = \"N2:AMERS\" || ?topicCode = \"N2:COM\")";
		int length = tpCodes.length;
		String finialFormat = "FILTER (?topicCode = \"N2:"+tpCodes[0]+"\"";
		for(int i = 1;i<length; i++){
			finialFormat += " || ?topicCode = \"N2:"+tpCodes[i]+"\"";
		}
		return finialFormat+=")";
		// TODO Auto-generated method stub
		
	}


	
	
	public static List<News> StoreToBean(String[] instrIds,String[] tpCodes,JSONArray array){
		//long start = System.currentTimeMillis();
		News news = null;
		String pTimeStamp = "";
		List<News> newsList = new ArrayList<News>();
		for(int i = 0;i<array.length();i++){
			
			JSONObject json = array.getJSONObject(i);
			//System.out.println(json.toString());
			//timestamp
			JSONObject time = json.getJSONObject("time");
			String timeStamp = time.getString("value");
			
			
			if(!pTimeStamp.equals(timeStamp) ){
				JSONObject head = json.getJSONObject("headline");
				//String headline = " ";
				String headline = head.getString("value");
				headline = headline.replaceAll("'", "`");
				System.out.println(headline);
				
				//body
				JSONObject body = json.getJSONObject("newsBody");
				String newsbody = body.getString("value").replaceAll("'", "`");
				news= new News(timeStamp, headline,newsbody);
				newsList.add(news);
			}
			
			//topiccode
			JSONObject topicCode = json.getJSONObject("topicCode");
			String topic = topicCode.getString("value");
			//System.out.println(topic);
			//ric
			JSONObject ric = json.getJSONObject("ric");
			String insID = ric.getString("value");
			String insID2 = insID.replaceAll("http.*#", "");
			//System.out.println(insID2);

			pTimeStamp = timeStamp;
			news.addInstrumentIDs(insID2);
			news.addTopicCodes(topic);
		}
		//System.out.println("cost to store"+(start+System.currentTimeMillis()));
		//Date eDate = new Date();
	//	if(newsList.isEmpty()) throw new NewsResponseException("News Not Found Exception","News can not be found, try other parameters.", new LogFileError(instrIds,tpCodes,400));
		return newsList;
		//return null;
	}

	
}