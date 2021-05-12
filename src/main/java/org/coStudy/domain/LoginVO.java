package org.coStudy.domain;

import lombok.Data;

@Data
public class LoginVO {
	private String userId;
	private String userPw;
	private boolean useCookie;
	private String member;

	

}
