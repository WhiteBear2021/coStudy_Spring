package org.coStudy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.TimerVO;
import org.coStudy.domain.UserVO;
import org.coStudy.service.MainPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {
	@Autowired
	private MainPageService service;
	
	@RequestMapping(value = {"/","/main"}, method = RequestMethod.GET)
	public String main(Model model) {
		
		model.addAttribute("random", service.getRandom());

		return "main";
	}
	
	@ResponseBody
	@PostMapping("/getNew")
	public ResponseEntity<List<StudyGroupVO>> getNew(){
		return new ResponseEntity<>(service.getNew(), HttpStatus.OK);	  
	}
	
	@ResponseBody
	@PostMapping("/getHot")
	public ResponseEntity<List<StudyGroupVO>> getHot(){
		return new ResponseEntity<>(service.getHot(), HttpStatus.OK);	  
	}

	@ResponseBody
	@PostMapping("/getRecom")
	public ResponseEntity<List<StudyGroupVO>> getRecom(HttpSession session){
		UserVO user = (UserVO) session.getAttribute("user");
		return new ResponseEntity<>(service.getRecom(user.getUser_no()), HttpStatus.OK);
	}
}
