package com.core.contant;

import lombok.Getter;

@Getter
public class ErrorCodeContant {

	/** 성공 */
	private static final String SUCCESS = "0001";
	/** 일반적인 실패 */
	private static final String FAIL = "E001";
	/** 로그인 아이디 및 패스워드 오류 */
	private static final String WRNG_LOGIN = "E002";
	/** 권한 부족 */
	private static final String UNAUTHORIZED = "E003";
	/** 처리대상 미존재 */
	private static final String NOT_FOUND = "E004";
	/** 이미 등록된 경우 */
	private static final String REGISTERED = "E005";
	/** 필수항목 오류 */
	private static final String EMPTY_REQUIRED = "E006";
	/** 시스템오류 */
	private static final String SYSTEM_ERROR = "E008";

	public static String getMessage(String errC) {
		String msg = "";

		switch (errC) {
		case SUCCESS:
			msg = "성공적으로 실행되었습니다.";
			break;
		case FAIL:
			msg = "요청 처리에 실패하였습니다.";
			break;
		case WRNG_LOGIN:
			msg = "아이디와 비밀번호를 확인하십시오.";
			break;
		case UNAUTHORIZED:
			msg = "권한이 없어서 처리되지않았습니다.";
			break;
		case NOT_FOUND:
			msg = "요청 대상이 존재하지않아 처리되지않았습니다.";
			break;
		case REGISTERED:
			msg = "이미 처리되었습니다.";
			break;
		case EMPTY_REQUIRED:
			msg = "필수 항목의 값이 없습니다.";
			break;
		case SYSTEM_ERROR:
			msg = "시스템 오류가 발생하였습니다.";
			break;
		}
		return msg;
	}
}
