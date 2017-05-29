package apiv2.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import api.exception.DateInvalidException;
import api.exception.NewsResponseException;
import apiv2.bean.ErrorMessage;
import apiv2.bean.LogFileError;


@RestController
@ControllerAdvice
public class GlobalExceptionHandler {




    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ResponseEntity<ErrorMessage> handleControllerException(HttpServletRequest req, Throwable ex) {
    	ErrorMessage eR = new ErrorMessage();
    	eR.setErrorType("404 Not Found");
    	eR.setMessage("Url not exsit");
    	eR.setLogFile(new LogFileError(new String[0],new String[0],400));
          return new ResponseEntity<ErrorMessage>(eR,HttpStatus.BAD_REQUEST);
      }
    
    @ExceptionHandler(value = NewsResponseException.class)
    public ResponseEntity<ErrorMessage> NewsResponseHandler(HttpServletRequest req, NewsResponseException ex ) {
    	ErrorMessage em = new ErrorMessage();
    	em.setErrorType(ex.getErrorType());
    	em.setMessage(ex.getErrorMessage());
    	em.setLogFile(ex.getLog());
    	//LogFileError ce = ex.getLog();
    
    
         return new ResponseEntity<ErrorMessage>(em,HttpStatus.BAD_REQUEST);
      }
    
    @ExceptionHandler(value = DateInvalidException.class)
    public ResponseEntity<ErrorMessage> dateExceptionHandler(HttpServletRequest req, DateInvalidException ex ) {
    	ErrorMessage em = new ErrorMessage();
    	em.setErrorType(ex.getErrorType());
    	em.setMessage(ex.getErrorMessage());
    	em.setLogFile(ex.getLog());
         return new ResponseEntity<ErrorMessage>(em,HttpStatus.BAD_REQUEST);
      }
}
