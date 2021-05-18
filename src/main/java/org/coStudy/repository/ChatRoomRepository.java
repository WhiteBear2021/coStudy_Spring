package org.coStudy.repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.coStudy.domain.ChatRoomVO;
import org.coStudy.service.ChattingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.Setter;


@Repository
public class ChatRoomRepository {
	
	@Setter(onMethod_ = @Autowired)
	private ChattingService service;
	
	  /*  private Map<String, ChatRoomVO> chatRoomMap;
	    
	    @PostConstruct
	    private void init(){
	        chatRoomMap = new LinkedHashMap<>();
	    }

	    public List<ChatRoomVO> findAllRoom(){
	        List<ChatRoomVO> chatRooms = new ArrayList<>(chatRoomMap.values());
	        Collections.reverse(chatRooms);
	        return chatRooms;
	    }

	    public ChatRoomVO findRoomById(String id){
	        return chatRoomMap.get(id);
	    }

	    public ChatRoomVO createChatRoom(String name){
	        ChatRoomVO chatRoom = ChatRoomVO.create(name);
	        chatRoomMap.put(chatRoom.getRoomNo(), chatRoom);
	        return chatRoom;
	    }*/
}
