package apiv3.bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;
public class NewsAndStockResponseSuccess {
 
	private LogFileSuccess logFileSuccess = new LogFileSuccess();
	private Map<String, StockPrice> newsDataSet = new TreeMap<String,StockPrice>();
	public NewsAndStockResponseSuccess(Date startExecutionDate, Date endExecutionDate, String[] instrumentId,String[] topicCode, Map<String, StockPrice> newsList){
		this.setNewsDataSet(newsList);
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		logFileSuccess.setInstrumentIDs(Arrays.toString(instrumentId));
		logFileSuccess.setTopicCodes(Arrays.toString(topicCode));
		logFileSuccess.setEndExecutionDate(dateFormat.format(endExecutionDate));
		logFileSuccess.setStartExecutionDate(dateFormat.format(startExecutionDate));
		logFileSuccess.setElapsedTime((double)(endExecutionDate.getTime()-startExecutionDate.getTime())/1000);
		
	}
	

	public LogFileSuccess getlogFileSuccess() {
		return logFileSuccess;
	}
	public void setlogFileSuccess(LogFileSuccess logFileSuccess) {
		this.logFileSuccess = logFileSuccess;
	}


	public Map<String, StockPrice> getNewsDataSet() {
		return newsDataSet;
	}


	public void setNewsDataSet(Map<String, StockPrice> newsDataSet) {
		this.newsDataSet = newsDataSet;
	}




	
}
