package org.coStudy.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO{
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int manager_no;
}
