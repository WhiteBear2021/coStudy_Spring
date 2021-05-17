package org.coStudy.handler;

import java.util.ArrayList;
import java.util.List;

import org.coStudy.domain.ChatMessageVO;
import org.coStudy.domain.ChatRoomVO;
import org.coStudy.repository.ChatRoomRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Component

public class EchoHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();//웹소켓 세션 저장 리스트
    private ChatRoomRepository chatRoomRepository;
    private ObjectMapper objectMapper;
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//클라이언트와 연결 후
		sessionList.add(session); 
	
		log.info(session.getId()+"연결됨");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//서버로 데이터를 전송한 경우
		log.info(session.getId()+"로 부터"+ message.getPayload()+" 받음");
		log.info(message);
		
		String msg = message.getPayload();
        ChatMessageVO chatMessage = objectMapper.readValue(msg, ChatMessageVO.class);
        System.out.println(chatMessage);
        
        ChatRoomVO chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
        chatRoom.handleMessage(chatMessage, objectMapper);
		
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결이 끊어진 경우
		sessionList.remove(session);
		log.info(session.getId()+"와 연결 끊김");

	}
	

}
