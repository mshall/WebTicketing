package com.shall.common.core.exception;

import lombok.Data;

@Data
public class ValidationException extends BusinessException {

	private static final long serialVersionUID = 1L;
	
	private String message;
	private int code;
	
	public ValidationException() {

	}
	
	public ValidationException(int code) {
		this.code = code;
	}
	
	public ValidationException(String message) {
		this.message = message;
	}

	public ValidationException(int code, String message) {
		this.message = message;
		this.code = code;
	}

	
}
