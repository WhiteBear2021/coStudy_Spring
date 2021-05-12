package org.coStudy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();//웹소켓 세션 저장 리스트
	private Logger logger = LoggerFactory.getLogger(WebSocketController.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//클라이언트와 연결 후
		sessionList.add(session); 
		logger.info("{} 연결됨", session.getId());
		if(session.getPrincipal() != null)
			System.out.println("입장자: "+session.getPrincipal().getName());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//서버로 데이터를 전송한 경우
		logger.info("{} 로 부터 {} 받음", session.getId(), message.getPayload());
		
		for(WebSocketSession sess : sessionList){//접속해있는 모든 클라이언트에 메시지 전송
			System.out.println(message.getPayload() );
			if(session.getPrincipal() != null)
				sess.sendMessage(new TextMessage(session.getPrincipal().getName() + " : " + message.getPayload()));
			else{
				sess.sendMessage(new TextMessage("메시지: "+message.getPayload()));
			}
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결이 끊어진 경우
		sessionList.remove(session);
		logger.info("{} 연결 끊김", session.getId());
		if(session.getPrincipal() != null)
			System.out.println("퇴장자: "+session.getPrincipal().getName());
	}
	
	
	
	
	
	
	
}
