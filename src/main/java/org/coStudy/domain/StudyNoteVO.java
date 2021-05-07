package org.coStudy.domain;

import java.io.Serializable;

public class StudyNoteVO implements Serializable{

	private int studyNote_no;
	private String studyNote_keyword;
	private String studyNote_content;
	private String studyNote_file;
	private String studyNote_date;
	private int user_no;
	public StudyNoteVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudyNoteVO(int studyNote_no, String studyNote_keyword, String studyNote_content, String studyNote_file,
			String studyNote_date, int user_no) {
		super();
		this.studyNote_no = studyNote_no;
		this.studyNote_keyword = studyNote_keyword;
		this.studyNote_content = studyNote_content;
		this.studyNote_file = studyNote_file;
		this.studyNote_date = studyNote_date;
		this.user_no = user_no;
	}
	public int getStudyNote_no() {
		return studyNote_no;
	}
	public void setStudyNote_no(int studyNote_no) {
		this.studyNote_no = studyNote_no;
	}
	public String getStudyNote_keyword() {
		return studyNote_keyword;
	}
	public void setStudyNote_keyword(String studyNote_keyword) {
		this.studyNote_keyword = studyNote_keyword;
	}
	public String getStudyNote_content() {
		return studyNote_content;
	}
	public void setStudyNote_content(String studyNote_content) {
		this.studyNote_content = studyNote_content;
	}
	public String getStudyNote_file() {
		return studyNote_file;
	}
	public void setStudyNote_file(String studyNote_file) {
		this.studyNote_file = studyNote_file;
	}
	public String getStudyNote_date() {
		return studyNote_date;
	}
	public void setStudyNote_date(String studyNote_date) {
		this.studyNote_date = studyNote_date;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	@Override
	public String toString() {
		return "StudyNoteVO [studyNote_no=" + studyNote_no + ", studyNote_keyword=" + studyNote_keyword
				+ ", studyNote_content=" + studyNote_content + ", studyNote_file=" + studyNote_file
				+ ", studyNote_date=" + studyNote_date + ", user_no=" + user_no + "]";
	}
	
	
}
