package com.core.exception;

public class NotAccessException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String msg;
	
	
	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}


	
	
	public NotAccessException() {
		super();
	}



	public NotAccessException(String msg) {
		super();
		this.msg = msg;
	}


	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return msg;
	}
}
