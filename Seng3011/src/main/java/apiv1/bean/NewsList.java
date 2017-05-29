package apiv1.bean;

import java.util.ArrayList;
import java.util.List;

public class NewsList {
	private String[] instrumentId = new String[100];
	private String[] topicCode = new String[100];
	private List<News> newsList = new ArrayList<News>(); 
			
	public NewsList(String[] instrumentId,String[] topicCode, List<News> newsList){
		this.topicCode = topicCode;
		this.newsList = newsList;
		this.instrumentId = instrumentId;
	}

	public String[] getInstrumentId() {
		return instrumentId;
	}

	public void setInstrumentId(String[] instrumentId) {
		this.instrumentId = instrumentId;
	}

	public String[] getTopicCode() {
		return topicCode;
	}

	public void setTopicCode(String[] topicCode) {
		this.topicCode = topicCode;
	}

	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}

	
}
