package com.shall.common.core.exception;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 * response body that returned in case of error
 */
@Data
public class ErrorResponse {

	private String message;
	@Getter
	@Setter
	private String description;
	private String error;
	private String transactionId;
	private int eCode;

}
