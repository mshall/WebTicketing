package com.shall.common.core.config;

import org.apache.commons.lang3.StringUtils;
import org.dozer.DozerConverter;

public class IfNotBlankConverter extends DozerConverter<String, String> {

	public IfNotBlankConverter() {
		super(String.class, String.class);
	}

	private String getObject(String source, String destination) {
		if (StringUtils.isNotBlank(source)) {
			return source;
		} else {
			return destination;
		}
	}

	@Override
	public String convertTo(String source, String destination) {
		return getObject(source, destination);
	}

	@Override
	public String convertFrom(String source, String destination) {
		return getObject(source, destination);
	}
}