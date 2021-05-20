package org.coStudy.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.coStudy.controller.WebSocketEventListener;
import org.coStudy.domain.ChatMessageVO;
import org.coStudy.domain.ChatRoomVO;
import org.coStudy.domain.GroupUserVO;
import org.coStudy.domain.MessageVO;
import org.coStudy.repository.ChatRoomRepository;
import org.coStudy.service.ChattingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Setter;


@Component
public class EchoHandler extends TextWebSocketHandler {
	//private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();//웹소켓 세션 저장 리스트
	private static final Map<Integer, ArrayList<WebSocketSession>> sessionMap = new HashMap<>();
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    private ObjectMapper objectMapper;
    
    @Setter(onMethod_ = @Autowired)
	private ChattingService service;
    
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//클라이언트와 연결 후
		objectMapper = new ObjectMapper();
		//sessionList.add(session); 
		
		logger.info("{} 연결됨", session.getId());
		System.out.println(session.getId()+"와 연결");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//서버로 데이터를 전송한 경우
		logger.info("{} 로 부터 {} 받음", session.getId(), message.getPayload());
		
		String msg = message.getPayload();
        ChatMessageVO chatMessage = objectMapper.readValue(msg, ChatMessageVO.class);//json -> 객체
      
        if(chatMessage.getType().equals(ChatMessageVO.MessageType.ENTER)){
        	
        	ArrayList<WebSocketSession> sessionList;
        	if(sessionMap.get(chatMessage.getRoomNo()) == null){//처음 저장
        		sessionList = new ArrayList<>();
        	}else{
        		sessionList = sessionMap.get(chatMessage.getRoomNo());//있던 session list
        	}
        	sessionList.add(session);
    		sessionMap.put(chatMessage.getRoomNo(), sessionList);//세션 저장
        	
        	//채팅내역 불러오기
        	List<MessageVO> chattingLog = service.list(chatMessage.getRoomNo());//내가 들어간 방의 모든 채팅
        	for(MessageVO log : chattingLog){
        		TextMessage textMessage = new TextMessage(objectMapper.
                        writeValueAsString(log));
        		session.sendMessage(textMessage);
        	}

        	
        }else if(chatMessage.getType().equals(ChatMessageVO.MessageType.LEAVE)){
        	
        }else if(chatMessage.getType().equals(ChatMessageVO.MessageType.CHAT)){
        	ArrayList<WebSocketSession> sessionList = sessionMap.get(chatMessage.getRoomNo());
        	for(WebSocketSession targetSession : sessionList){
        		logger.info("{} 로 부터 {} 전달", targetSession.getId(), message.getPayload());
        		System.out.println(session.getId()+"에게??????????");
        		targetSession.sendMessage(message);
        	}
        }
        
       // ChatRoomVO chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
       // chatRoom.handleMessage(chatMessage, objectMapper);
		
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결이 끊어진 경우
		//sessionList.remove(session);
		sessionMap.remove(session);
		System.out.println(session.getId()+"와 연결 끊김");
	}
	

}
