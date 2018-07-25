package com.shall.common.core.exception;

import java.util.Map;

import org.springframework.http.HttpStatus;

import lombok.Data;

/**
 * General Business exception, should be extended by any custom exception and
 * has its own handler in GeneralExceptionHanler.java
 */
@Data
public class BusinessException extends Exception {


	private static final long serialVersionUID = 1L;
	
	private String message;
	private int code;
	private HttpStatus httpStatus;
	private Map<String, String> extraResponseData;
	
	public BusinessException() {

	}
	
	public BusinessException(String message) {
		this.message = message;
	}
	
	
	
	public BusinessException(String message, HttpStatus httpStatus) {
		super();
		this.message = message;
		this.httpStatus = httpStatus;
	}

	
	public BusinessException(int code, String message) {
		super();
		this.message = message;
		this.code = code;
	}

	public BusinessException(int code, String message, HttpStatus httpStatus) {
		super();
		this.message = message;
		this.code = code;
		this.httpStatus = httpStatus;
	}

	public BusinessException(String message, int code, HttpStatus httpStatus, Map<String, String> extraResponseData) {
		super();
		this.message = message;
		this.code = code;
		this.httpStatus = httpStatus;
		this.extraResponseData = extraResponseData;
	}
	
}
