package org.coStudy.controller;


import org.coStudy.domain.ChatRoomVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.TimerVO;
import org.coStudy.service.GroupPageService;
import org.coStudy.service.TimerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/groupPage/*")
@AllArgsConstructor

public class GroupPageController {

	private TimerService timerService;

	@Autowired
	GroupPageService groupPage_service;

	@ResponseBody
	@PostMapping("/timer")
	public ResponseEntity<String> timer(@RequestBody TimerVO vo) {

		return timerService.insert(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>("success", HttpStatus.INTERNAL_SERVER_ERROR);	
	}

	@GetMapping("/timer")
	public void timer() {

	}

	@GetMapping("/chatting")
	public void chatting() {

	}

	@GetMapping("/chattingForm/{roomNo}/{userNo}")
	public String chattingForm(Model model, @PathVariable("roomNo") String roomNo,
			@PathVariable("userNo") String userNo) {

		ChatRoomVO room = new ChatRoomVO();
		room.setRoomNo(roomNo);
		room.setUserNo(userNo);
		model.addAttribute("room", room);

		return "groupPage/chattingForm";
	}

	/*
	 * @GetMapping("chatting/{roomNo}") public String
	 * chatting(@PathVariable("roomNo") int roomNo){ String myName = "주원";
	 * return
	 * "redirect:http://192.168.0.163:3000?room="+roomNo+"&myName="+myName; }
	 */// node.js

	@GetMapping("/main")
	public String main() {
		log.info("main");
		return "groupPage/groupMain";

	}

	@GetMapping("boardList")
	public String boardList(@RequestParam("groupBoardList") int page_board_no) throws Exception {
		log.info("***********");
		log.info("그룹피드로 이동");

		return "groupPage/groupMain";

	}

	@GetMapping("/insertGroupBoard")
	@ResponseBody
	public String insertGroupBoard(@RequestParam("board") GroupPageBoardVO board) {
		log.info("insertBoard");
		//int groupPage = groupPage_service.insertGroupBoard(board);

		return "groupPage/groupMain";

	}
}
