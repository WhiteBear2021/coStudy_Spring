package org.coStudy.domain;

import lombok.Data;

@Data
public class GroupPageBoardVO{
	private int page_board_no;
	private String page_board_title;
	private String page_board_content;
	private String page_board_writer;
	private String page_board_date;
	private String page_board_file;
	private int studyGroup_no;
}
	
