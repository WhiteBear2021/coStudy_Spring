package org.coStudy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.coStudy.domain.LoginVO;
import org.coStudy.domain.ManagerVO;
import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.StudyNoteVO;
import org.coStudy.domain.UserVO;
import org.coStudy.service.ManagerService;
import org.coStudy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService service;
	@Autowired
	ManagerService m_service;
	
	@GetMapping("/signUp")
	public String signUp(){
		log.info("*********************");
		log.info("signUp 페이지로 이동!!");
		return "user/signUpform";
	}
	
	@PostMapping("/signUp")
	public String signUp(UserVO user,Model model){
		int re=service.insertUser(user);
		log.info("회원가입 여부 (-1,1):"+re);
		if(re==1){
			model.addAttribute("mesg",user.getUser_firstName()+"님, 회원가입 성공!");
			return "user/loginForm";	
		}else{
			model.addAttribute("mesg","회원가입 실패!");
			return "user/signUpform";
		}
		
	}
	
	@GetMapping("/login")
	public String login(){
		log.info("*********************");
		log.info("login 페이지로 이동!");
		
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	public String login(LoginVO login,@RequestParam("member")String member,HttpSession session){
		log.info("*********************");
		log.info("login 실시");
		
		if(member.equals("user")) {
			UserVO user = service.login(login);
			log.info("로그인 결과:"+user);
			if(user!=null) {
				session.setAttribute("user", user);
				return "home";
			}else {
				return "user/loginForm";
			}
		}
		else if(member.equals("manager")) {
			ManagerVO manager= m_service.login(login);
			if(manager!=null) {
				session.setAttribute("manager", manager);
				return "redirect:/manager/main";
			}else {
				return "user/loginForm";
			}
		}
		return "home"; //이것도 임시로 설정해놓은 것!!
	}
	
	@GetMapping("/searchId")
	public void searchId(){
	
	}
	
	@GetMapping("/searchPassword")
	public void searchPassword(){
		log.info("*********************");
		log.info("searchPassword 페이지로 이동!!");	
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session){
		log.info("*********************");
		log.info("logout 세션 login 제거");
		UserVO user=(UserVO)session.getAttribute("user");
		System.out.println(user);
	    session.removeAttribute("user");
		
	    return "user/login";
	}
	
	@GetMapping(value="/checkId",produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkId(@RequestParam("user_id") String user_id){
		log.info(user_id);
		int re=service.idCheck(user_id);
		log.info("id 갯수(0이 나와야 가입가능):"+re);
		String mesg="중복되는 ID 값";
		if(re==0){
			mesg="사용가능한 ID";
		}
		return mesg;
	}
	
	
}
