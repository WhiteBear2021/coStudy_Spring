package org.coStudy.domain;

import lombok.Data;

@Data
public class ChatMessageVO {
	private int roomNo;
	private int userNo;
	private String userName;
	private String message;
	private String type;
	
}
