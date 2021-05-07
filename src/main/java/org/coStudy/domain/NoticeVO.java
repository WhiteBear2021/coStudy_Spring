package org.coStudy.domain;

import java.io.Serializable;
import java.sql.Date;

public class NoticeVO implements Serializable{
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private int manager_no;
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public int getManager_no() {
		return manager_no;
	}

	public void setManager_no(int manager_no) {
		this.manager_no = manager_no;
	}

	public NoticeVO(int notice_no, String notice_title, String notice_content, String notice_date, int manager_no) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.manager_no = manager_no;
	}
	
	
}
