package org.coStudy.domain;

import java.io.Serializable;

public class GroupPageBoardVO implements Serializable {
	private int page_board_no;
	private String page_board_title;
	private String page_board_content;
	private String page_board_writer;
	private String page_board_date;
	private String page_board_file;
	private int studyGroup_no;
	public GroupPageBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GroupPageBoardVO(int page_board_no, String page_board_title, String page_board_content,
			String page_board_writer, String page_board_date, String page_board_file, int studyGroup_no) {
		super();
		this.page_board_no = page_board_no;
		this.page_board_title = page_board_title;
		this.page_board_content = page_board_content;
		this.page_board_writer = page_board_writer;
		this.page_board_date = page_board_date;
		this.page_board_file = page_board_file;
		this.studyGroup_no = studyGroup_no;
	}
	public int getPage_board_no() {
		return page_board_no;
	}
	public void setPage_board_no(int page_board_no) {
		this.page_board_no = page_board_no;
	}
	public String getPage_board_title() {
		return page_board_title;
	}
	public void setPage_board_title(String page_board_title) {
		this.page_board_title = page_board_title;
	}
	public String getPage_board_content() {
		return page_board_content;
	}
	public void setPage_board_content(String page_board_content) {
		this.page_board_content = page_board_content;
	}
	public String getPage_board_writer() {
		return page_board_writer;
	}
	public void setPage_board_writer(String page_board_writer) {
		this.page_board_writer = page_board_writer;
	}
	public String getPage_board_date() {
		return page_board_date;
	}
	public void setPage_board_date(String page_board_date) {
		this.page_board_date = page_board_date;
	}
	public String getPage_board_file() {
		return page_board_file;
	}
	public void setPage_board_file(String page_board_file) {
		this.page_board_file = page_board_file;
	}
	public int getStudyGroup_no() {
		return studyGroup_no;
	}
	public void setStudyGroup_no(int studyGroup_no) {
		this.studyGroup_no = studyGroup_no;
	}
	@Override
	public String toString() {
		return "GroupPageBoardVO [page_board_no=" + page_board_no + ", page_board_title=" + page_board_title
				+ ", page_board_content=" + page_board_content + ", page_board_writer=" + page_board_writer
				+ ", page_board_date=" + page_board_date + ", page_board_file=" + page_board_file + ", studyGroup_no="
				+ studyGroup_no + "]";
	}
	
	
}
