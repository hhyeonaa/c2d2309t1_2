package com.team.util;

public @SuppressWarnings("serial")
class CodeTypeNullException extends RuntimeException {
	private static final String errorMsg = " (코드타입)에 해당하는 코드내용이 테이블에 존재하지 않거나, 사용불가 합니다.";
    public CodeTypeNullException(String msg) {
        super(" " + msg + errorMsg); 
    }
}
