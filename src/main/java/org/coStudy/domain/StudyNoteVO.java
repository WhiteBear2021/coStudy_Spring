package org.coStudy.domain;

import java.io.Serializable;

import lombok.Data;
@Data
public class StudyNoteVO implements Serializable{

	private int studyNote_no;
	private String studyNote_keyword;
	private String studyNote_content;
	private String studyNote_file;
	private String studyNote_fileName;
	private String studyNote_uploadPath;
	private String studyNote_uuid;
	private String studyNote_date;
	private int user_no;
	private String studyNote_title;
	
	
}
