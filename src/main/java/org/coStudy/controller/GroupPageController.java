package org.coStudy.controller;

import java.util.List;

import org.coStudy.domain.ChatRoomVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.TimerVO;
import org.coStudy.service.GroupPageService;
import org.coStudy.service.TimerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/groupPage/*")
@AllArgsConstructor

public class GroupPageController {

	private TimerService timerService;
	private GroupPageService groupPage_service;

	@ResponseBody
	@PostMapping("/timer")
	public ResponseEntity<String> timer(@RequestBody TimerVO vo){

		return timerService.insert(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
				  : new ResponseEntity<>("success", HttpStatus.INTERNAL_SERVER_ERROR) ;
	}
	
	@GetMapping("/timer")
	public void timer(){

	}
	
	@GetMapping("/chatting")
	public void chatting(){
		
	}
	

	@GetMapping("/chattingForm/{roomNo}/{myName}")
	public String chattingForm(Model model ,@PathVariable("roomNo") String roomNo, @PathVariable("myName") String myName){
		
		ChatRoomVO room = new ChatRoomVO();
		room.setRoomNo(roomNo);
		room.setMyName(myName);
		model.addAttribute("room", room);
	
		return "groupPage/chattingForm";
	}


	/*
	 * @GetMapping("chatting/{roomNo}") public String
	 * chatting(@PathVariable("roomNo") int roomNo){ String myName = "주원";
	 * return
	 * "redirect:http://192.168.0.163:3000?room="+roomNo+"&myName="+myName; }
	 */// node.js

	@PostMapping(value="groupBoardMain")
		@ResponseBody
		public String groupBoardList(@ModelAttribute("groupPageBoardVO") GroupPageBoardVO groupPageBoardVO) throws Exception{
			GroupPageBoardVO board = new GroupPageBoardVO();
			int studyGroup_no = groupPageBoardVO.getStudyGroup_no();
			log.info("==============");
			log.info("boardList");
			
			try {
				board.setPage_board_content(groupPageBoardVO.getPage_board_content());
				board.setPage_board_title(groupPageBoardVO.getPage_board_title());
				board.setPage_board_writer(groupPageBoardVO.getPage_board_writer());
				groupPage_service.groupBoardList(studyGroup_no);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return "success";
		
	}
	
}


