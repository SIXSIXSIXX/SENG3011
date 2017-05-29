package apiv3.bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import apiv2.bean.News;
public class NewsResponseSuccess {
 
	private LogFileSuccess logFileSuccess = new LogFileSuccess();
	private List<News> newsDataSet = new ArrayList<News>();
	public NewsResponseSuccess(Date startExecutionDate, Date endExecutionDate, String[] instrumentId,String[] topicCode, List<News> newsList){
		this.newsDataSet = newsList;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		logFileSuccess.setInstrumentIDs(Arrays.toString(instrumentId));
		logFileSuccess.setTopicCodes(Arrays.toString(topicCode));
		logFileSuccess.setEndExecutionDate(dateFormat.format(endExecutionDate));
		logFileSuccess.setStartExecutionDate(dateFormat.format(startExecutionDate));
		logFileSuccess.setElapsedTime((double)(endExecutionDate.getTime()-startExecutionDate.getTime())/1000);
		
	}
	
	public List<News> getNewsDataSet() {
		return newsDataSet;
	}
	public void setNewsDataSet(List<News> newsDataSet) {
		this.newsDataSet = newsDataSet;
	}
	public LogFileSuccess getlogFileSuccess() {
		return logFileSuccess;
	}
	public void setlogFileSuccess(LogFileSuccess logFileSuccess) {
		this.logFileSuccess = logFileSuccess;
	}




	
}
