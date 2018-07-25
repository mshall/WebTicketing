package com.shall.customercomplaints.network.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 
 * @author Mohamed S. El-Shall <a href="www.facebook.com/M.S.ElShall">Catch
 *         me</a>
 * @param <T>
 *            of type
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class ResponseVO<T> {
	private int code;
	private String message;
	private T results;

	public ResponseVO(T results) {
		this.results = results;
	}

}
