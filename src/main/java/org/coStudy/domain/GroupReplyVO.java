package org.coStudy.domain;

import java.io.Serializable;

public class GroupReplyVO implements Serializable{
	private int group_reply_no;
	private String group_reply_writer;
	private String group_reply_content;
	private int page_board_no;
	
	public GroupReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public GroupReplyVO(int group_reply_no, String group_reply_writer, String group_reply_content, int page_board_no) {
		super();
		this.group_reply_no = group_reply_no;
		this.group_reply_writer = group_reply_writer;
		this.group_reply_content = group_reply_content;
		this.page_board_no = page_board_no;
	}

	public int getGroup_reply_no() {
		return group_reply_no;
	}

	public void setGroup_reply_no(int group_reply_no) {
		this.group_reply_no = group_reply_no;
	}

	public String getGroup_reply_writer() {
		return group_reply_writer;
	}

	public void setGroup_reply_writer(String group_reply_writer) {
		this.group_reply_writer = group_reply_writer;
	}

	public String getGroup_reply_content() {
		return group_reply_content;
	}

	public void setGroup_reply_content(String group_reply_content) {
		this.group_reply_content = group_reply_content;
	}

	public int getPage_board_no() {
		return page_board_no;
	}

	public void setPage_board_no(int page_board_no) {
		this.page_board_no = page_board_no;
	}
	
	
}
