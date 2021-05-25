package org.coStudy.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class GroupReplyVO implements Serializable{
	private int group_reply_no;
	private String group_reply_writer;
	private String group_reply_content;
	private int page_board_no;
	
}