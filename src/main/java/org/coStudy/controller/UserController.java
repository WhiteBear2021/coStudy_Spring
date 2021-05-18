package org.coStudy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.coStudy.domain.CategoryVO;
import org.coStudy.domain.LoginVO;
import org.coStudy.domain.ManagerVO;
import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.StudyNoteVO;
import org.coStudy.domain.UserVO;
import org.coStudy.service.ManagerService;
import org.coStudy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService service;
	@Autowired
	private ManagerService m_service;
    @Autowired
    private JavaMailSender mailSender;
    
	@GetMapping("/signUp")
	public String signUp(Model model){
		log.info("*********************");
		log.info("signUp 페이지로 이동!!");
		List<CategoryVO> list=service.categoryAllList();
		model.addAttribute("categoryList", list);
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
				return "/main";

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
	
	@GetMapping("/searchUser")
	public String searchUser(Model model,String key){
		if(key.equals("id")){
			model.addAttribute("key","아이디 찾기");
		}else if(key.equals("pw")){
			model.addAttribute("key","비밀번호 찾기");
		}
		return "user/searchUser";
	}
	
	@RequestMapping(value="/searchId" ,method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String searchId(@RequestBody HashMap<String, String> map2){
//		log.info("user_firstName:"+user_firstName);
//		log.info("user_lastName:"+user_lastName);
//		log.info("user_phoneNo:"+user_phoneNo);
//		HashMap<String, String> map=new HashMap<>();
//		map.put("user_firstName",user_firstName);
//		map.put("user_lastName",user_lastName);
//		map.put("user_phoneNo",user_phoneNo);
		String result=service.searchId(map2);
		log.info("찾은 결과 user_id==>"+result);
		log.info(map2);
		if(result==null){
			result="해당하는 회원님의 id가 존재하지않습니다.";
		}
		return result;
	}
	
	 /* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<String> mailCheckGET(String email,String user_id) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("user_id 확인:"+user_id);
        log.info("이메일 확인 : " + email);
        HashMap<String, String> map=new HashMap<>();
        map.put("user_email", email);
        map.put("user_id", user_id);
        // id, email 일치 여부 check
        int count=service.checkIdEmail(map);
        log.info("id, email 확인 결과:"+count);
        if(count==1){
        	 /* 인증번호(난수) 생성 */
            Random random = new Random();
            int checkNum = random.nextInt(888888) + 111111;
            log.info(checkNum);
            
            /* 이메일 보내기 */
            String setFrom = "babywhitebear21@gmail.com";
            String toMail = email;
            String title = "COSTUDY 회원가입 인증 이메일 입니다.";
            String content = 
                    "홈페이지를 방문해주셔서 감사합니다." +
                    "<br><br>" + 
                    "인증 번호는 " + checkNum + "입니다." + 
                    "<br>" + 
                    "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
            
            try {
                
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
                helper.setFrom(setFrom);
                helper.setTo(toMail);
                helper.setSubject(title);
                helper.setText(content,true);
                mailSender.send(message);
                
            }catch(Exception e) {
                e.printStackTrace();
            }
            return new ResponseEntity<>(""+checkNum,HttpStatus.OK);
        }else{
        	return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        
       
    }
	
	
    @RequestMapping(value="/searchPw" ,method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> searchPw(@RequestBody HashMap<String, String> map){
		log.info(map);
		String result=service.searchPw(map);
		if(result!=null){
			return new ResponseEntity<>(result,HttpStatus.OK);
		}else{
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
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
