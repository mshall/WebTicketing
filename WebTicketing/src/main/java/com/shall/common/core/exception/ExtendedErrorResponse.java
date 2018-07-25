package com.shall.common.core.exception;

import java.util.Map;

import lombok.Data;

@Data
public class ExtendedErrorResponse extends ErrorResponse {


	private Map<String, String> additionalInfo;
}