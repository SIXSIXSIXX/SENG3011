package apiv1.bean;

public class News {
	public String time;
	public String headline;
	public String newsBody;
	
	public News(String time,String headline, String newsBody){
		this.time =time;
		this.headline = headline;
		this.newsBody = newsBody;
		
		
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public String getNewsBody() {
		return newsBody;
	}
	public void setNewsBody(String newsBody) {
		this.newsBody = newsBody;
	}

}
