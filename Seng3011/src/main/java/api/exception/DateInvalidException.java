package api.exception;

import org.springframework.stereotype.Component;

import apiv2.bean.LogFileError;

@Component
public class DateInvalidException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String errorType;
	private String errorMessage;
	
	private LogFileError log;

	
	public DateInvalidException(String errorType, String errorMessage , LogFileError log) {
		super(errorMessage);
		System.out.println(errorMessage);
		this.errorType = errorType;
		this.setErrorMessage(errorMessage);
		this.log = log;
	}
	
	public LogFileError getLog() {
		return log;
	}

	public void setLog(LogFileError log) {
		this.log = log;
	}


	public String getErrorType() {
		return errorType;
	}

	public void setErrorType(String errorType) {
		this.errorType = errorType;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}


}
