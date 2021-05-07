package org.coStudy.domain;

import java.io.Serializable;

public class QnaVO implements Serializable{
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String regdate;
	private int parentNo;
	private int isread;
	private int levels;
	private int user_no;
	private int manager_no;
	

	public QnaVO() {
		// TODO Auto-generated constructor stub
	}


	public QnaVO(int qna_no, String qna_title, String qna_content, String regdate, int parentNo, int isread, int levels,
			int user_no, int manager_no) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.regdate = regdate;
		this.parentNo = parentNo;
		this.isread = isread;
		this.levels = levels;
		this.user_no = user_no;
		this.manager_no = manager_no;
	}


	public int getQna_no() {
		return qna_no;
	}


	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}


	public String getQna_title() {
		return qna_title;
	}


	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}


	public String getQna_content() {
		return qna_content;
	}


	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getParentNo() {
		return parentNo;
	}


	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}


	public int getIsread() {
		return isread;
	}


	public void setIsread(int isread) {
		this.isread = isread;
	}


	public int getLevels() {
		return levels;
	}


	public void setLevels(int levels) {
		this.levels = levels;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public int getManager_no() {
		return manager_no;
	}


	public void setManager_no(int manager_no) {
		this.manager_no = manager_no;
	}


	
	
	
}
