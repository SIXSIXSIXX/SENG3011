package apiv2.bean;

public class ErrorMessage {

	private String errorType;
	private String message;
	private String detail = "Please read our API documents or try with our API playground.";
	private String[] url = {"http://159.203.160.38:8080/Seng3011/tutorial.jsp","http://159.203.160.38:8080/Seng3011/generator.jsp"};
	private LogFileError logFile;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getErrorType() {
		return errorType;
	}
	public void setErrorType(String errorType) {
		this.errorType = errorType;
	}
	public LogFileError getLogFile() {
		return logFile;
	}
	public void setLogFile(LogFileError logFile) {
		this.logFile = logFile;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String[] getUrl() {
		return url;
	}
	public void setUrl(String[] url) {
		this.url = url;
	}






}
