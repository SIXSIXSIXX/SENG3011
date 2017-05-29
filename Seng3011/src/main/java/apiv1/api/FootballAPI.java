package apiv1.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import apiv1.bean.News;
import apiv1.bean.NewsList;


public class FootballAPI {

	
	private static String url = "http://adage.cse.unsw.edu.au:8005/v1/graphs/sparql?query=";
	private static String query = "PREFIX w3: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>PREFIX fe: <http://adage.cse.unsw.edu.au/ontology/financial-events#>PREFIX ins: <http://adage.cse.unsw.edu.au/resource/financial-events#>PREFIX xs: <http://www.w3.org/2001/XMLSchema#>SELECT ?s ?id ?time ?headline ?newsBody WHERE {?s w3:type fe:TRTHNewsEvent.?s fe:messageId ?id.?s fe:relatedRIC ?ric.?s fe:timeStamp ?t.?t fe:startTime ?time.?s fe:newsText ?newsBody.?s fe:headLine ?headline.?s fe:topicCode ?topicCode.?s fe:languageOfNews ?lang.?s fe:languageOfNews \"en\".";
	public FootballAPI() throws IOException{

	}

	
	public NewsList dataFilter(String[] instrIds,String tpCodes[], String startD, String endD) throws IOException, JSONException{
		
		String queryUrl  = query;
		System.out.println(Arrays.toString(instrIds)+"afdafsafasfdsafd");
		System.out.println(Arrays.toString(instrIds));
		if (instrIds.length!= 0){
			String instrId = convertInstrIdFormat(instrIds);
			queryUrl += instrId;
			System.out.println(instrId);
		}
		if(tpCodes.length!=0){
		String tpCode = convertTpcodeFormat(tpCodes);
			queryUrl+=tpCode;
			System.out.println(tpCode);
		}
		String date = "FILTER(xs:dateTime(?time) > \""+startD+"\"^^xs:dateTime && xs:dateTime(?time) <= \""+endD+"\"^^xs:dateTime)";
		//String date ="FILTER(xs:dateTime(?time) > \"2015-10-01T00:00:00Z\"^^xs:dateTime && xs:dateTime(?time) <= \"2015-10-10T00:00:00Z\"^^xs:dateTime)";

		System.out.println(queryUrl+date+"}");
		String encodedUrl = url+ URLEncoder.encode(queryUrl+date+"}", "UTF-8");
		URL fUrl = new URL(encodedUrl);
		
		System.out.println(encodedUrl);
		HttpURLConnection con = (HttpURLConnection) fUrl.openConnection();

//		//add request header
//		con.setRequestProperty("X-Auth-Token", " d53ed7e170df4cf886b688b9bd80b3f5");
		String userpass = "student" + ":" + "studentML";
		String basicAuth = "Basic  " + new String(new Base64().encode(userpass.getBytes()));
		con.setRequestProperty ("Authorization", basicAuth);
		con.setRequestMethod("GET");
		con.setRequestProperty("Accept", "application/sparql-results+json");


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
		return storeToBean(instrIds, tpCodes, array);
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


	private static NewsList storeToBean(String[] instrIds,String[] tpCodes,JSONArray array) throws JSONException{
		List<News> newsList = new ArrayList<News>();
		for(int i = 0;i<array.length();i++){
						
			JSONObject json = array.getJSONObject(i);
			//System.out.println(json.toString());
			//timestamp
			JSONObject time = json.getJSONObject("time");
			String timeStamp = time.get("value").toString();
			
			//headline
			JSONObject head = json.getJSONObject("headline");
			String headline = head.get("value").toString();
			
			//body
			JSONObject body = json.getJSONObject("newsBody");
			String newsbody = body.get("value").toString();
			
			News news= new News(timeStamp,headline,newsbody);
			newsList.add(news);
				 
			 }
		NewsList nl = new NewsList(instrIds,tpCodes,newsList);
		return nl;
	}
}