package org.coStudy.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class GroupPageBoardVO implements Serializable{
	private int page_board_no;
	private String page_board_title;
	private String page_board_content;
	private String page_board_writer;
	private String page_board_date;
	private String page_board_file;
	private int studyGroup_no;
}
	
