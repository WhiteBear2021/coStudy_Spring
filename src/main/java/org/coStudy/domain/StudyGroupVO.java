package org.coStudy.domain;

import java.util.Date;

import lombok.Data;
@Data
public class StudyGroupVO {
	private int studygroup_no;
	private String studygroup_name;
	private String studygroup_info;
	private String studygroup_location;
	private int max_user_number;
	private int current_user_number;
	private Date made_date;
	private String isdelete;
	private String isface;
	private int category_no;
	private int user_no;
	
	private String img;
	private String thumbimg;


	
}