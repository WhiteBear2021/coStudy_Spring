package org.coStudy.domain;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.coStudy.domain.ChatMessageVO.MessageType;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;

@Data
public class ChatRoomVO {
	private String roomNo;
    private String myName;
    private Set<WebSocketSession> sessions = new HashSet<>();

    public static ChatRoomVO create(String name){
        ChatRoomVO chatRoom = new ChatRoomVO();
        chatRoom.roomNo = UUID.randomUUID().toString();
        chatRoom.myName = name;
        return chatRoom;
    }

    public void handleMessage(WebSocketSession session, ChatMessageVO chatMessage,
                              ObjectMapper objectMapper) throws IOException {
       
        chatMessage.setMessage(chatMessage.getWriter() + " : " + chatMessage.getMessage());
        
        TextMessage textMessage = new TextMessage(objectMapper.
                writeValueAsString(chatMessage.getMessage()));
        
		for(WebSocketSession sess : sessions){
			sess.sendMessage(textMessage);
		}
    }

}
