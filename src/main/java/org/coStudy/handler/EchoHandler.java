package org.coStudy.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class EchoHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();//웹소켓 세션 저장 리스트
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//클라이언트와 연결 후
		sessionList.add(session); 
	
		log.info(session.getId()+"연결됨");
		if(session.getPrincipal() != null)
			System.out.println("입장자: "+session.getPrincipal().getName());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//서버로 데이터를 전송한 경우
		log.info(session.getId()+"로 부터"+ message.getPayload()+" 받음");
		
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
		log.info(session.getId()+"와 연결 끊김");
		if(session.getPrincipal() != null)
			System.out.println("퇴장자: "+session.getPrincipal().getName());
	}
	

}
