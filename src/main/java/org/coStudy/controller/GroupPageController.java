package org.coStudy.controller;

import javax.servlet.http.HttpSession;

import org.coStudy.domain.ChatRoomVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.TimerVO;
import org.coStudy.domain.UserVO;
import org.coStudy.domain.VChatRoomVO;
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
		log.info("1234");
		return timerService.insert(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
				  : new ResponseEntity<>("success", HttpStatus.INTERNAL_SERVER_ERROR) ;
	}

	@GetMapping("/timer")
	public void timer() {

	}

	@GetMapping("/chatting")
	public void chatting() {

	}

	@GetMapping("/chattingForm/{roomNo}/{myName}")
	public String chattingForm(Model model, @PathVariable("roomNo") String roomNo,
			@PathVariable("myName") String myName) {

		ChatRoomVO room = new ChatRoomVO();
		room.setRoomNo(roomNo);
		room.setUserNo(myName);
		model.addAttribute("room", room);

		return "groupPage/chattingForm";
	}

	/*
	 * @GetMapping("chatting/{roomNo}") public String
	 * chatting(@PathVariable("roomNo") int roomNo){ String myName = "�ֿ�";
	 * return
	 * "redirect:http://192.168.0.163:3000?room="+roomNo+"&myName="+myName; }
	 */// node.js


	@GetMapping("/groupMain")
	public String groupBoardMain() throws Exception {
		log.info("groupMain");
		return "groupPage/groupMain";
	}
	

	@PostMapping(value = "groupBoardList")
	@ResponseBody
	public String groupBoardList(@ModelAttribute("groupPageBoardVO") GroupPageBoardVO groupPageBoardVO)
			throws Exception {
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

	@GetMapping("/voiceChatting")
	public String voiceChatting(Model model, @PathVariable("roomNo") String roomNo, HttpSession session) {
		log.info("voice chatting~~");
		VChatRoomVO room = new VChatRoomVO();
		room.setRoomNo(roomNo);
		UserVO user = (UserVO) session.getAttribute("user");
		//room.setUserNo(userNo);
		room.setUserNo(user.getUser_id());
		model.addAttribute("room", room);

		return "groupPage/voiceChatting2";
	}



}
