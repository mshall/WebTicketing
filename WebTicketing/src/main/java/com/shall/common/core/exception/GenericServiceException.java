package com.shall.common.core.exception;

/**
 * @author Mohamed S. El-Shall
 * <a href="www.facebook.com/M.S.ElShall">Catch me</a>
 * @param <T> of type
 */
public class GenericServiceException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3681636607322599994L;
	
	public GenericServiceException(String message) {
		super(message);
	}
}