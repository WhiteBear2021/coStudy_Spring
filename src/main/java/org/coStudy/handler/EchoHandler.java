package org.coStudy.handler;

import java.util.ArrayList;
import java.util.List;

import org.coStudy.domain.ChatMessageVO;
import org.coStudy.domain.ChatRoomVO;
import org.coStudy.domain.GroupUserVO;
import org.coStudy.domain.MessageVO;
import org.coStudy.repository.ChatRoomRepository;
import org.coStudy.service.ChattingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class EchoHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();//웹소켓 세션 저장 리스트

    private ObjectMapper objectMapper;
    
    @Setter(onMethod_ = @Autowired)
	private ChattingService service;
    
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//클라이언트와 연결 후
		objectMapper = new ObjectMapper();
		sessionList.add(session); 
	
		System.out.println(session.getId()+"연결됨");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//서버로 데이터를 전송한 경우
		System.out.println(session.getId()+"로 부터"+ message.getPayload()+" 받음");
		System.out.println(message);
		
		String msg = message.getPayload();
        ChatMessageVO chatMessage = objectMapper.readValue(msg, ChatMessageVO.class);
      
        if(chatMessage.getType().equals(ChatMessageVO.MessageType.ENTER)){
        	//채팅내역 불러오기
        	List<MessageVO> chattingLog = service.list(chatMessage.getRoomNo());//내가 들어간 방의 모든 채팅
        	for(MessageVO log : chattingLog){
        		TextMessage textMessage = new TextMessage(objectMapper.
                        writeValueAsString(log));
        		System.out.println(textMessage);
        		
        		session.sendMessage(textMessage);
        	}

        	
        }else if(chatMessage.getType().equals("LEAVE")){
        	
        }else{
        	
        }
        
       // ChatRoomVO chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
       // chatRoom.handleMessage(chatMessage, objectMapper);
		
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결이 끊어진 경우
		sessionList.remove(session);
		System.out.println(session.getId()+"와 연결 끊김");
	}
	

}
