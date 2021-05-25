package org.coStudy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Setter;

@Component
public class WebSoketController extends TextWebSocketHandler {
	private static Map<Integer, ArrayList<WebSocketSession>> sessionMap = new HashMap<>();//웹소켓 세션 저장 
	private static final Logger logger = LoggerFactory.getLogger(WebSoketController.class);
    private ObjectMapper objectMapper;
    
    @Setter(onMethod_ = @Autowired)
	private ChattingService service;
    
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//클라이언트와 연결 후
		objectMapper = new ObjectMapper(); 
		logger.info("{} 연결됨", session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//서버로 데이터를 전송한 경우
		logger.info("{} 로 부터 {} 받음", session.getId(), message.getPayload());
		
		String msg = message.getPayload();//json
        ChatMessageVO chatMessage = objectMapper.readValue(msg, ChatMessageVO.class);//json -> 객체
        int roomNo = chatMessage.getRoomNo();//방 번호
		
        if(chatMessage.getType().equals("ENTER")){
        	saveSession(roomNo, session);
        	loadChattingFromDB(roomNo, session);
        	
        }else if(chatMessage.getType().equals("CHAT")){
        	sendChatMessage(roomNo,chatMessage);
        }/*else if(chatMessage.getType().equals("LEAVE")){
        	logger.info("{}와 연결 끊음?????", session.getId());
        	sessionMap.get(roomNo).remove(session);
        }*/
      
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결이 끊어진 경우
		logger.info("{}와 연결 끊김", session.getId());
		/*sessionMap.forEach((key, list) -> {//map을 순회하여 session 제거
			if(list.contains(session)){
				list.remove(session);
			}
		});*/
		
		for(int key : sessionMap.keySet()){
			if(sessionMap.get(key).remove(session)){
				break;
			}
		}

	}
	
	
	
	
	private void saveSession(int roomNo, WebSocketSession session){
		
		ArrayList<WebSocketSession> sessionList;
    	if(sessionMap.get(roomNo) == null){//처음 저장
    		sessionList = new ArrayList<>();
    	}else{
    		sessionList = sessionMap.get(roomNo);//있던 session list
    	}
    	sessionList.add(session);
		sessionMap.put(roomNo, sessionList);//세션 저장
	}
	
	private void loadChattingFromDB(int roomNo, WebSocketSession session) throws IOException{
    	//채팅내역 불러오기
		logger.info("{}",service);
		List<MessageVO> chattingLog = service.list(roomNo);//내가 들어간 방의 모든 채팅
    	for(MessageVO log : chattingLog){
    		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(log));// MessageVO -> json 
    		session.sendMessage(textMessage);
    	}
	}
	
	private void sendChatMessage(int roomNo, ChatMessageVO chatMessage) throws IOException{
		
		MessageVO message = new MessageVO();
		message.setStudygroup_no(roomNo);
		message.setUser_no(chatMessage.getUserNo());
		message.setGroup_msg_log(chatMessage.getMessage());
		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(message));
		
		ArrayList<WebSocketSession> sessionList = sessionMap.get(roomNo);//roomNo로 탐색
    	for(WebSocketSession targetSession : sessionList){
    		logger.info("{} 로 전달", targetSession.getId());
    		targetSession.sendMessage(textMessage);
    	}
    	service.insert(message);
    }

}
