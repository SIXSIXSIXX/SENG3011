package apiv2.bean;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class LogFileError {
	
	
	private String developerTeam = "404 not found Team";
	private String moduleName = "news api";
	private String version = "v2";
	private String InstrumentIDs;
	private String TopicCodes;
	private int serverStat;
	
	

	

	public LogFileError() {

	}

	public LogFileError(String[] instrumentIDs, String[] topicCodes, int serverStat) {
		InstrumentIDs =Arrays.toString(instrumentIDs);
		TopicCodes = Arrays.toString(topicCodes);
		
		this.serverStat = serverStat;
	}

	public LogFileError(String[] instrumentIDs, String[] topicCodes, int serverStat, String version) {
		InstrumentIDs =Arrays.toString(instrumentIDs);
		TopicCodes = Arrays.toString(topicCodes);
		this.version = version;
		
		this.serverStat = serverStat;
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

	public int getServerStat() {
		return serverStat;
	}

	public void setServerStat(int serverStat) {
		this.serverStat = serverStat;
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

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

}

