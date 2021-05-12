package org.coStudy.controller;

import org.coStudy.domain.TimerVO;
import org.coStudy.service.TimerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@ResponseBody
	@PostMapping("/timer")
	public ResponseEntity<String> timer(@RequestBody TimerVO vo){

		return timerService.insert(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
				  : new ResponseEntity<>("success", HttpStatus.INTERNAL_SERVER_ERROR) ;
	}
	
	@GetMapping("/timer")
	public void timer(){

	}
	
	@GetMapping("chatting")
	public void chatting(){
		
	}
	
	@GetMapping("chattingForm")
	public void chattingForm(){
		
	}
	
	@GetMapping("chatting/{roomNo}")
	public String chatting(@PathVariable("roomNo") int roomNo){
		String myName = "주원";
		return "redirect:http://192.168.0.163:3000?room="+roomNo+"&myName="+myName;
	}
}
