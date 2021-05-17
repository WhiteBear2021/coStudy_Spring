package org.coStudy.domain;

import lombok.Data;

@Data
public class ChatMessageVO {
	private String chatRoomId;
	private String message;
	private String writer;
	private MessageType type;
	
	public enum MessageType{
		ENTER, CHAT, LEAVE
	}
	
}
