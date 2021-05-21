package org.coStudy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

@Controller

public class StompSocketController {
	
	/*@MessageMapping("/user")
	public void showUsers(@Payload String msg){
		System.out.println("msg: "+ msg);
		simpMessagingTemplate.convertAndSend("/topic/a", msg);
	}*/
	
    @MessageMapping("/users")
    @SendTo("/topic/a")
    public String addUser(@Payload String msg, SimpMessageHeaderAccessor headerAccessor){
        headerAccessor.getSessionAttributes().put("username", msg);
        return msg;
    }
	
	/*@MessageMapping("/userssss")
	@SendTo("/topicccc/a")
	public String sendMessage(@Payload String msg) {
		System.out.println("msg: "+ msg);
        return msg;
    }*/
}
