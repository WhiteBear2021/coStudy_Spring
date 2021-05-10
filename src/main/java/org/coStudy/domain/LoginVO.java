package org.coStudy.domain;

public class LoginVO {
	private String userId;
	private String userPw;
	private boolean useCookie;
	private String member;

	public LoginVO() {}
	
	public LoginVO(String userId, String userPw, boolean useCookie) {
		this.userId = userId;
		this.userPw = userPw;
		this.useCookie = useCookie;
		
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "LoginVO [userId=" + userId + ", userPw=" + userPw + ", useCookie=" + useCookie + ", member=" + member
				+ "]";
	}
	
	

}
