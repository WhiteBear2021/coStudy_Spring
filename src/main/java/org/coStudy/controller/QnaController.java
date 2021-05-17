package org.coStudy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.coStudy.domain.QnaVO;
import org.coStudy.service.QnaService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*@RestController*/
@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QnaController {
	private QnaService service;

/*	@PostMapping(value = "/user_insert", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody QnaVO qna) {
		log.info("qnavo:" + qna);
		log.info("===================");
		int insertCount = service.Userinsert(qna);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}*/
/*	   @RequestMapping(value="/user_insert", method=RequestMethod.POST)
	   @ResponseBody
	public String serialize(Jamong jamong) {
        //필요한 로직 처리   
		   log.info(jamong.getName());
        return jamong.getName() + jamong.getAge();
    }
	
	
	@GetMapping(value = "/user_insert")
	public void insert() {

	}*/
	
	@GetMapping(value="/user_insert")
	public void insert() {

	}
	
	@GetMapping(value="/list")
	public void list() {

	}
	
	
	@PostMapping(value="/user_insert")
    @ResponseBody
    public String ajax_addComment(@ModelAttribute("qnaVO") QnaVO qnaVO) throws Exception{
        QnaVO qna=new QnaVO();
      
        
        try{
        	qna.setQna_content(qnaVO.getQna_content());
        	qna.setQna_title(qnaVO.getQna_title());
        	qna.setUser_no(qnaVO.getUser_no());
        	service.Userinsert(qna);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }
	
	 @RequestMapping(value="/commentList", 
			 produces="application/json; charset=utf8")
	    @ResponseBody
	    public ArrayList<HashMap> ajax_commentList(@ModelAttribute("qnaVO") QnaVO qnaVO) throws Exception{
	           
		 ArrayList<HashMap> hmlist = new ArrayList<HashMap>();

		 
		 	int user_no=qnaVO.getUser_no();
		 	log.info("========================================");
		 log.info(user_no);
	        // 해당 게시물 댓글
	        List<QnaVO> commentVO =service.UserList(user_no);
	        
	        if(commentVO.size() > 0){
	            for(int i=0; i<commentVO.size(); i++){
  	
	                HashMap hm = new HashMap();
	                hm.put("qna_title", commentVO.get(i).getQna_title());
	                hm.put("qna_content", commentVO.get(i).getQna_content());
	                
	                hmlist.add(hm);

	            }
	            
	        }
  
	        return hmlist;
	        
	    }
}
