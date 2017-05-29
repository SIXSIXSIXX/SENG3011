package seng3011.client.model;

import java.util.Arrays;

public class Request {
	private String company;
	private String[] topicC;
	private String startD;
	private String endD;

	public Request() {

	}

	public Request(String company, String[] topicC, String startD, String endD) {
		this.company = company;
		this.topicC = topicC;
		this.startD = startD;
		this.endD = endD;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String[] getTopicC() {
		return topicC;
	}

	public void setTopicC(String[] topicC) {
		this.topicC = topicC;
	}

	public String getStartD() {
		return startD;
	}

	public void setStartD(String startD) {
		this.startD = startD;
	}

	public String getEndD() {
		return endD;
	}

	public void setEndD(String endD) {
		this.endD = endD;
	}

	@Override
	public String toString() {
		return "Request [company=" + company + ", topicC=" + Arrays.toString(topicC) + ", startD=" + startD + ", endD="
				+ endD + "]";
	}

	
}
