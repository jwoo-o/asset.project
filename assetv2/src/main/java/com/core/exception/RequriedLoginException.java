package com.core.exception;

public class RequriedLoginException extends Exception {

	private String msg;
	
	
	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}


	
	
	public RequriedLoginException() {
		super();
	}



	public RequriedLoginException(String msg) {
		super();
		this.msg = msg;
	}


	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return msg;
	}
}
