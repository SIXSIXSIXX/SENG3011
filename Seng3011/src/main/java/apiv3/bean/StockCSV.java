package apiv3.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import apiv3.strategy.State;

public class StockCSV {
	private double open=Double.NaN;
	private double high=Double.NaN;
	private double low=Double.NaN;
	private double close=Double.NaN;

	private List<News> news = new ArrayList<News>();
	private State currState = new State();
	
	public StockCSV(String str) {
		 StringTokenizer tok = new StringTokenizer(str, ",", false);
		 tok.nextToken();
		 this.open = Double.valueOf(tok.nextToken());
		 this.high = Double.valueOf(tok.nextToken());
		 this.low = Double.valueOf(tok.nextToken());
		 this.close = Double.valueOf(tok.nextToken());
		 
		 
	}
	public StockCSV(){

	}
	
	public StockCSV(String open,String high,String low,String close){
		 this.open = Double.valueOf(open);
		 this.high = Double.valueOf(high);
		 this.low = Double.valueOf(low);
		 this.close = Double.valueOf(close);
	}
	
	public StockCSV(String date, double open, double high, double low, double close, List<News> news) {
		this.open = open;
		this.high = high;
		this.low = low;
		this.close = close;
		this.news = news;
	}
	public double getOpen() {
		return open;
	}
	public void setOpen(double open) {
		this.open = open;
	}
	public double getHigh() {
		return high;
	}
	public void setHigh(double high) {
		this.high = high;
	}
	public double getLow() {
		return low;
	}
	public void setLow(double low) {
		this.low = low;
	}
	public double getClose() {
		return close;
	}
	public void setClose(double close) {
		this.close = close;
	}
	public List<News> getNews() {
		return news;
	}
	public void setNews(News n) {
		this.news.add(n);
	}
	public State getCurrState() {
		return currState;
	}
	public void setCurrState(State currState) {
		this.currState = currState;
	}
	@Override
	public String toString() {
		return "StockCSV [open=" + open + ", high=" + high + ", low=" + low + ", close=" + close + ", news=" + news
				+ ", currState=" + currState + "]";
	}


	








}
