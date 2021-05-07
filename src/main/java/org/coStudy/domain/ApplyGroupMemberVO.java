package org.coStudy.domain;

import java.io.Serializable;

public class ApplyGroupMemberVO implements Serializable{
	private char isAccept;
	private int user_no;
	private int studyGroup_no;
	
	public ApplyGroupMemberVO() {
		

	}
	
	public ApplyGroupMemberVO(char isAccept, int user_no, int studyGroup_no) {
		super();
		this.isAccept = isAccept;
		this.user_no = user_no;
		this.studyGroup_no = studyGroup_no;
	}


	public char getIsAccept() {
		return isAccept;
	}


	public void setIsAccept(char isAccept) {
		this.isAccept = isAccept;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public int getStudyGroup_no() {
		return studyGroup_no;
	}


	public void setStudyGroup_no(int studyGroup_no) {
		this.studyGroup_no = studyGroup_no;
	}


	@Override
	public String toString() {
		return "ApplyGroupMemberVO [isAccept=" + isAccept + ", user_no=" + user_no + ", studyGroup_no=" + studyGroup_no
				+ "]";
	}
	
	
}
