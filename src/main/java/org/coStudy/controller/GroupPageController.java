package org.coStudy.controller;

import java.io.File;
import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.ChatRoomVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.GroupReplyVO;
import org.coStudy.domain.GroupUserVO;
import org.coStudy.domain.TimerVO;
import org.coStudy.domain.UserVO;
import org.coStudy.domain.VChatRoomVO;
import org.coStudy.service.GroupPageService;
import org.coStudy.service.TimerService;
import org.coStudy.service.UserService;
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
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/groupPage/*")
@AllArgsConstructor
public class GroupPageController {

	private TimerService timerService;
	private GroupPageService groupPage_service;
	private UserService user_service;

	@ResponseBody
	@PostMapping("/timer")
	public ResponseEntity<String> timer(@RequestBody TimerVO vo) {
		int a = timerService.insert(vo);
	
		return new ResponseEntity<>("success", HttpStatus.OK);	
			
	}

	@GetMapping("/timer")
	public void timer() {
	}
	
	@ResponseBody
	@PostMapping("/getTimer")
	public ResponseEntity<List<TimerVO>> getTimer(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if(user != null){
			List<TimerVO> list = timerService.list(user.getUser_no());
			return new ResponseEntity<>(list, HttpStatus.OK);
		}
		return null;
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
	 * 
	 * 
	 */

	@GetMapping("/groupMain")
	public String groupBoardList(Model model, @RequestParam("studygroup_no") int studygroup_no) {
		log.info("groupBoardList(Main)");

		model.addAttribute("boardList", groupPage_service.groupBoardList(studygroup_no));
		model.addAttribute("studygroup_no", studygroup_no);

		model.addAttribute("userList", groupPage_service.groupUserList(studygroup_no));
		model.addAttribute("relist", groupPage_service.listGroupReply());
		
		return "groupPage/groupMain";

	}

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
		

		
		return "redirect:/groupPage/groupMain?studygroup_no=" + studygroup_no;

	}

	@GetMapping("/insertGroupReply")
	public void insertGroupReply() {

	}

	@PostMapping("/insert")
	public String insertGroupBoard(@RequestParam("studygroup_no") int studygroup_no,
			@RequestParam("page_board_content") String page_board_content,
			@RequestParam("page_board_writer") String page_board_writer) {
		GroupPageBoardVO board = new GroupPageBoardVO();

		try {
			board.setPage_board_content(page_board_content);
			board.setStudyGroup_no(studygroup_no);
			board.setPage_board_writer(page_board_writer);
			
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

	//@GetMapping("/groupSetting")
	//public String acceptMember(Model model, @RequestParam("studygroup_no") int studygroup_no) {
	//	model.addAttribute("selectList",groupPage_service.selectApplyList(studygroup_no));
		
		
		//return "groupPage/groupSetting";}



	@GetMapping("/groupUserList")
	public void groupUserList() {
		
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
	
	@GetMapping("/groupSetting")
	public String groupSetting(Model model, @RequestParam("studygroup_no") int studygroup_no) {
		model.addAttribute("applyUserList", groupPage_service.selectApplyList(studygroup_no));
		return "groupPage/groupSetting";
		
	}

	
	@ResponseBody
	@PostMapping("/acceptMember")
	public ResponseEntity<String> acceptMember(@RequestBody ApplyGroupMemberVO applyMember){
		groupPage_service.acceptMember(applyMember);
		groupPage_service.insertAcceptMember(applyMember);
		return new ResponseEntity<>("success", HttpStatus.OK);
		/*return groupPage_service.acceptMember(applyMember) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>("success", HttpStatus.INTERNAL_SERVER_ERROR);*/
	}
	
	@GetMapping("/fileList")
	   public void fileList(){
		   log.info("filel upload");
		   
	   }
	   
	   @PostMapping("/fileList")
	   public void fileList(@RequestParam("studygroup_no") int studygroup_no, MultipartFile[] uploadFile, Model model){
		   String uploadFolder="C:\\upload";
		   for(MultipartFile multipartFile:uploadFile){
			  log.info(multipartFile.getOriginalFilename());
			  
			  File saveFile=new File(uploadFolder, multipartFile.getOriginalFilename());
			  
			  try{
				  multipartFile.transferTo(saveFile);
				  
			  }catch(Exception e){
				  log.error(e.getMessage());
			  }
		   }
		   //return "redirect:/groupPage/fileList?studygroup_no?"+studygroup_no;
		   
	   }

}

