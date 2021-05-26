package org.coStudy.controller;

import java.security.Provider.Service;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.coStudy.domain.ChatRoomVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.GroupReplyVO;
import org.coStudy.domain.TimerVO;
import org.coStudy.domain.UserVO;
import org.coStudy.domain.VChatRoomVO;
import org.coStudy.mapper.GroupPageMapper;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

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
	 * chatting(@PathVariable("roomNo") int roomNo){ String myName = " ֿ ";
	 * return
	 * "redirect:http://192.168.0.163:3000?room="+roomNo+"&myName="+myName; }
	 */// node.js

	/*
	 * @GetMapping("/groupMain") public String groupBoardMain() throws Exception
	 * { log.info("groupMain"); return "groupPage/groupMain"; }
	 */
	@PostMapping("/insertGroupReply")
	public String insertGroupReply(Model model, @RequestParam("studygroup_no") int studygroup_no,
			@RequestParam("group_reply_content") String group_reply_content,
			@RequestParam("group_reply_writer") String group_reply_writer,
			@RequestParam("page_board_no") int page_board_no

	) {
		log.info("----------------------");
		log.info(group_reply_content);
		log.info(group_reply_writer);
		log.info(page_board_no);
		GroupReplyVO vo = new GroupReplyVO();
		vo.setGroup_reply_content(group_reply_content);
		vo.setGroup_reply_writer(group_reply_writer);
		vo.setPage_board_no(page_board_no);

		groupPage_service.insertGroupReply(vo);

		model.addAttribute("relist", groupPage_service.listGroupReply(page_board_no));
		return "redirect:/groupPage/groupMain?studygroup_no=" + studygroup_no;

	}

	@GetMapping("/groupMain")
	public String groupBoardList(Model model, @RequestParam("studygroup_no") int studygroup_no) {
		log.info("groupBoardList(Main)");
		model.addAttribute("boardList", groupPage_service.groupBoardList(studygroup_no));
		model.addAttribute("studygroup_no", studygroup_no);

		return "groupPage/groupMain";

	}

	@PostMapping("/insert")
	public String insertGroupBoard(@RequestParam("studygroup_no") int studygroup_no,
			@RequestParam("page_board_content") String page_board_content) {
		GroupPageBoardVO board = new GroupPageBoardVO();

		try {
			board.setPage_board_content(page_board_content);
			board.setStudyGroup_no(studygroup_no);
			log.info(board);
			groupPage_service.insertGroupBoard(board);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/groupPage/groupMain?studygroup_no=" + studygroup_no;

	}

	@GetMapping("/insert")
	public void insertGroupBoard() {

	}

	@GetMapping("/groupSetting")
	public String AcceptMember() {

		return "groupPage/groupSetting";
	}

	@GetMapping("/voiceChatting")
	public String voiceChatting(Model model, @RequestParam("studygroup_no") int studygroup_no, HttpSession session) {
		log.info("voice chatting~~");
		VChatRoomVO room = new VChatRoomVO();
		room.setStudygroup_no(studygroup_no);
		UserVO user = (UserVO) session.getAttribute("user");
		session.setAttribute("user_nick", user.getUser_nickName());
		room.setUserId(user.getUser_id());
		log.info(room);
		model.addAttribute("room", room);
		return "groupPage/voiceChatting2";
	}

}