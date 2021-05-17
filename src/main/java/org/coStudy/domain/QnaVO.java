package org.coStudy.domain;

import java.util.Date;

import lombok.Data;
@Data
public class QnaVO{
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private Date regdate;
	private int parentNo;
	private int isread;
	private int levels;
	private int user_no;
	private int manager_no;

}
