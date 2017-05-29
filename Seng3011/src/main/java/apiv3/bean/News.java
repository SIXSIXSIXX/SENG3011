package apiv3.bean;

import java.util.HashSet;
import java.util.Set;

public class News {
	private Set<String> instrumentIDs;
	private Set<String> topicCodes;
	private String timeStamp;
	private String headline;
	private String newsText;
	private String type;
	public News(String timeStamp,String headline,String newsText){
		this.topicCodes = new HashSet<String>();
		this.instrumentIDs =  new HashSet<String>();
		this.timeStamp =timeStamp;
		this.headline = headline;
		this.newsText = newsText;
		
	}
	
	public void addInstrumentIDs(String id) {
		this.instrumentIDs.add(id);
	}

	public void addTopicCodes(String code) {
		this.topicCodes.add(code);
	}


	public Set<String> getInstrumentIDs() {
		return instrumentIDs;
	}

	public void setInstrumentIDs(Set<String> instrumentIDs) {
		this.instrumentIDs = instrumentIDs;
	}

	public Set<String> getTopicCodes() {
		return topicCodes;
	}

	public void setTopicCodes(Set<String> topicCodes) {
		this.topicCodes = topicCodes;
	}

	public void setNewsText(String newsText) {
		this.newsText = newsText;
	}

	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public String getNewsText() {
		return newsText;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	


}
