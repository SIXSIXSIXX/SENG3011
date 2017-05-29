package apiv3.api;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;

import org.json.JSONArray;
import org.json.JSONObject;

import api.exception.DateInvalidException;
import api.exception.NewsResponseException;
import apiv2.bean.LogFileError;
import apiv3.bean.News;
import apiv3.bean.StockCSV;
import apiv3.bean.StockPrice;
public class StockAPI {
	private static String STOCK_URI = "http://174.138.67.207/InstrumentID/";
	public StockAPI() throws IOException{

	}
	
	public static Map<String,StockCSV> parseCSVToBeanList(String insID,String[] tp,String startD,String endD) throws IOException, ParseException, NewsResponseException, DateInvalidException {

		
		
		Map<String,StockCSV> stock = new TreeMap<String,StockCSV>();
		
		//URL url= new URL("http://adage.cse.unsw.edu.au:8080/ImportEventDataset/v1/data?Datasource=External:Yahoo&startDate=2012-01-01T00:00:00z&endDate=2013-01-01T23:59:59z&InstrumentID=Yahoo:ABP.AX&DatasetType=EndOfDay");
		URL url= new URL("http://adage.cse.unsw.edu.au:8080/ImportEventDataset/v1/data?Datasource=External:Yahoo&startDate="+startD+"&endDate="+endD+"&InstrumentID=Yahoo:"+insID+"&DatasetType=EndOfDay");
		String[] id = new String[2];
		id[0] = "RIC_"+insID;
		id[1] = "RIC_"+insID;
		//URL url= new URL("http://finance.yahoo.com/d/quotes.csv?e=.csv&f=sl1d1t1&s=AUDUSD=X");
		List<News> news = FootballAPI.dataFilterCache(id, tp, startD, endD,1);
		System.out.println(news.toString());
		URLConnection connection = url.openConnection(); 
		connection.connect(); 
		BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		br.readLine();
		br.readLine();
		while(br.ready()){
			String line = br.readLine();
			 StringTokenizer tok = new StringTokenizer(line, ",", false);
			 String date = tok.nextToken();
			 stock.put(date, new StockCSV(line));
        }
		for(News n:news){
			String date = n.getTimeStamp().substring(0,10);
			if(stock.containsKey(date)){
				stock.get(date).setNews(n);
			}
			else{
				stock.put(date, new StockCSV());
				stock.get(date).setNews(n);
			}
		}
		
		return stock;
	}
	
	
	
	public static Map<String,StockCSV> getNewsAndStockCache(String instrIds,String[] tpC, String startD, String endD, int flag) throws IOException, NewsResponseException, DateInvalidException{
	

		String[] id = new String[1];
		id[0] = instrIds;
		List<News> news = FootballAPI.dataFilterCache(id, tpC, startD, endD, flag);

		//List<News> news  = new ArrayList<News>();
		String startdate = startD.substring(0, 10);
		String enddate = endD.substring(0,10);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d1 = null;
		Date d2 = null;
		long diffDays = 1;
		try {
			d1 = sdf.parse(startdate);
			d2 =  sdf.parse(enddate);
			long diff = d2.getTime() - d1.getTime();
			diffDays = diff / (24 * 60 * 60 * 1000);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		URL obj;
		if(flag == 1) obj = new URL(createStockUrl(instrIds,startD,0,diffDays+1));
		else obj = new URL(createStockUrl(instrIds,startD,26,diffDays+11));
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : ");
		System.out.println("Response Code : " + responseCode);
		BufferedReader in;
		if(responseCode == 200)
			in = new BufferedReader(new InputStreamReader(con.getInputStream()));		
		else throw new NewsResponseException("400 RIC Exception","InstrumentID Value is Invalid, or there is No Stock Data Available for the Specified Window of Days", new LogFileError(id,new String[0],400,"v3"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		String str = response.toString();
		JSONObject json = new JSONObject(str);
		JSONArray array = json.getJSONArray("CompanyReturns");
		//System.out.println(json.toString());
		return StockAPI.stockTobean(instrIds,d1,diffDays,news,array);
		
	}


	private static Map<String,StockCSV> stockTobean(String instrIds, Date d1, long diffDays, List<News> news,
			JSONArray array) {
		Map<String,StockCSV> stock = new TreeMap<String,StockCSV>();
		for(int i=0;i< array.length();i++){
			JSONObject json = array.getJSONObject(i);
			JSONArray edate = json.getJSONArray("Data");
			for(int j=0;j<edate.length();j++){
				JSONObject e = edate.getJSONObject(j);
				String tf = e.get("Trading_Info").toString();
				tf = tf.replaceAll("[{}]", "");
				String[] value = tf.split(",");
				if(tf.equals("null")) stock.put(e.getString("Date"), new StockCSV());
				else stock.put(e.getString("Date"), new StockCSV(value[5].replace("\"Open\":", ""),value[0].replace("\"High\":", ""),value[2].replace("\"Low\":", ""),value[4].replace("\"Close\":", "")));
			}
		}
		for(News n:news){
			String date = n.getTimeStamp().substring(0,10);
			if(stock.containsKey(date)){
				stock.get(date).setNews(n);
			}
			else{
				stock.put(date, new StockCSV());
				stock.get(date).setNews(n);
			}
		}
		//System.out.println(stock.toString());
		return stock;
	}
	public static String createStockUrl(String insID, String date, int lowerwindow, long upperwindow) throws UnsupportedEncodingException{

		date = date.substring(0,10);
		String url = STOCK_URI +insID +"/DateOfInterest/"+date+"/List_of_Var/CM_Return,AV_Return,Trading_Info/Upper_window/"+upperwindow+"/Lower_window/"+lowerwindow;
		System.out.println("url is "+url);
		return url;		
	}

	public static Map<String,StockPrice> getNewsAndStockPriceCache(String instrIds,String[] tpC, String startD, String endD, int flag) throws IOException, NewsResponseException, DateInvalidException{
		

		String[] id = new String[1];
		id[0] = instrIds;
		List<News> news = FootballAPI.dataFilterCache(id, tpC, startD, endD, flag);
		System.out.println("adfaaddaffasf"+ news.size());
		//List<News> news  = new ArrayList<News>();
		String startdate = startD.substring(0, 10);
		String enddate = endD.substring(0,10);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d1 = null;
		Date d2 = null;
		long diffDays = 1;
		try {
			d1 = sdf.parse(startdate);
			d2 =  sdf.parse(enddate);
			long diff = d2.getTime() - d1.getTime();
			diffDays = diff / (24 * 60 * 60 * 1000);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		URL obj;
		if(flag == 1) obj = new URL(createStockUrl(instrIds,startD,0,diffDays+1));
		else obj = new URL(createStockUrl(instrIds,startD,26,diffDays+11));
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : ");
		System.out.println("Response Code : " + responseCode);
		BufferedReader in;
		if(responseCode == 200)
			in = new BufferedReader(new InputStreamReader(con.getInputStream()));		
		else throw new NewsResponseException("400 RIC Exception","InstrumentID Value is Invalid, or there is No Stock Data Available for the Specified Window of Days", new LogFileError(id,new String[0],400,"v3"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		String str = response.toString();
		JSONObject json = new JSONObject(str);
		JSONArray array = json.getJSONArray("CompanyReturns");
		//System.out.println(json.toString());
		return StockAPI.stockPriceTobean(instrIds,d1,diffDays,news,array);
		
	}
	
	
	private static Map<String,StockPrice> stockPriceTobean(String instrIds, Date d1, long diffDays, List<News> news,
			JSONArray array) {
		Map<String,StockPrice> stock = new TreeMap<String,StockPrice>();
		for(int i=0;i< array.length();i++){
			JSONObject json = array.getJSONObject(i);
			JSONArray edate = json.getJSONArray("Data");
			for(int j=0;j<edate.length();j++){
				JSONObject e = edate.getJSONObject(j);
				String tf = e.get("Trading_Info").toString();
				tf = tf.replaceAll("[{}]", "");
				String[] value = tf.split(",");
				if(tf.equals("null")) stock.put(e.getString("Date"), new StockPrice());
				else stock.put(e.getString("Date"), new StockPrice(value[5].replace("\"Open\":", ""),value[0].replace("\"High\":", ""),value[2].replace("\"Low\":", ""),value[4].replace("\"Close\":", "")));
			}
		}
		for(News n:news){
			String date = n.getTimeStamp().substring(0,10);
			if(stock.containsKey(date)){
				stock.get(date).setNews(n);
			}
			else{
				stock.put(date, new StockPrice());
				stock.get(date).setNews(n);
			}
		}
		//System.out.println(stock.toString());

		
		
		return stock;
	}
}
