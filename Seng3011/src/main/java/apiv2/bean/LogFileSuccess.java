package apiv2.bean;

import java.util.Date;

public class LogFileSuccess {

	private String developerTeam = "404 not found Team";
	private String moduleName = "news api";
	private String version = "v2";
	private String InstrumentIDs;
	private String TopicCodes;
	private String serverStat = "200";
	private String StartExecutionDate;
	private String endExecutionDate;
	private double elapsedTime;
	private double outPutFileName = System.currentTimeMillis();
	public LogFileSuccess(){
		
	}
	public String getDeveloperTeam() {
		return developerTeam;
	}
	public void setDeveloperTeam(String developerTeam) {
		this.developerTeam = developerTeam;
	}
	public String getModuleName() {
		return moduleName;
	}
	public String getStartExecutionDate() {
		return StartExecutionDate;
	}
	public void setStartExecutionDate(String startExecutionDate) {
		StartExecutionDate = startExecutionDate;
	}
	public String getEndExecutionDate() {
		return endExecutionDate;
	}
	public void setEndExecutionDate(String endExecutionDate) {
		this.endExecutionDate = endExecutionDate;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
	public String getInstrumentIDs() {
		return InstrumentIDs;
	}
	public void setInstrumentIDs(String instrumentIDs) {
		InstrumentIDs = instrumentIDs;
	}
	public String getTopicCodes() {
		return TopicCodes;
	}
	public void setTopicCodes(String topicCodes) {
		TopicCodes = topicCodes;
	}
	public String getServerStat() {
		return serverStat;
	}
	public void setServerStat(String serverStat) {
		this.serverStat = serverStat;
	}



	public double getOutPutFileName() {
		return outPutFileName;
	}
	public void setOutPutFileName(double outPutFileName) {
		this.outPutFileName = outPutFileName;
	}
	public double getElapsedTime() {
		return elapsedTime;
	}
	public void setElapsedTime(double elapsedTime) {
		this.elapsedTime = elapsedTime;
	}
	
}
