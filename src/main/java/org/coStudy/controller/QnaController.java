package org.coStudy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.coStudy.domain.Criteria;
import org.coStudy.domain.PageDTO;
import org.coStudy.domain.QnaVO;
import org.coStudy.service.QnaService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

   
   @GetMapping(value="/list")
   public void list() {

   }
   
   
   @PostMapping(value="/user_insert")
    @ResponseBody
    public String ajax_addComment(@ModelAttribute("qnaVO") QnaVO qnaVO) throws Exception{
        QnaVO qna=new QnaVO();
      log.info("=============================");
      log.info("들어옴");
        
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
   
   
   @PostMapping(value="/UserReplyInsert")
   @ResponseBody
   public String ajax_addComment3(@RequestParam("qna_no") int qna_no,
		   @RequestParam("qna_content") String qna_content,
		   @RequestParam("user_no") int user_no
		   ) throws Exception{
       QnaVO qna=new QnaVO();
     log.info("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
     log.info("들어옴");
     log.info("내용"+qna_content);
     log.info("글번호"+qna_no);
     log.info("회원번호"+user_no);
     
     
       try{
          qna.setQna_content(qna_content);
          qna.setParentno(qna_no);
          qna.setUser_no(user_no);
          
          service.UserReplyInsert(qna);
           
       } catch (Exception e){
           e.printStackTrace();
       }
       
       return "success";
   }
   
   
   
   
   
   
   @PostMapping(value="/list")
   @ResponseBody
   public String ajax_addComment2(@ModelAttribute("qnaVO") QnaVO qnaVO) throws Exception{
       QnaVO qna=new QnaVO();
     log.info("=============================");
     log.info("들어옴");
       
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
                   hm.put("regdate", commentVO.get(i).getRegdate());
                   hm.put("qna_no", commentVO.get(i).getQna_no());
                   hm.put("qna_title", commentVO.get(i).getQna_title());
                   hm.put("qna_content", commentVO.get(i).getQna_content());
                   
                   hmlist.add(hm);

               }
               
           }
  
           return hmlist;
           
       }
    
    
    
    
    @RequestMapping(value="/detail", 
            produces="application/json; charset=utf8")
         @ResponseBody
         public ArrayList<HashMap> ajax_commentList2(@RequestParam("qna_no") int qna_no) throws Exception{
                
         ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
       log.info("-----------------------------------------------");
       log.info(qna_no);
         QnaVO v=new QnaVO();
         v.setParentno(qna_no);
         v.setQna_no(qna_no);
      /*   v.setUser_no(22);*/
         
         
         
             List<QnaVO> commentVO =service.UserDetail(v);
             
             
             if(commentVO.size() > 0){
                 for(int i=0; i<commentVO.size(); i++){
       
                     HashMap hm = new HashMap();
                     hm.put("regdate", commentVO.get(i).getRegdate());
                     hm.put("qna_no", commentVO.get(i).getQna_no());
                     hm.put("qna_title", commentVO.get(i).getQna_title());
                     hm.put("qna_content", commentVO.get(i).getQna_content());
                     hm.put("user_no", commentVO.get(i).getUser_no());
                    
                     
                     hmlist.add(hm);

                 }
                 
             }
    
             return hmlist;
             
         }
    

	@GetMapping("/manager_list")
	public void manager_list(Model model) {
		model.addAttribute("list", service.ManagerList());
	}
	
	@GetMapping("/manager_detail")
	public void manager_detail(@RequestParam("qna_no") int qna_no, Model model) {
		model.addAttribute("detail", service.ManagerDetail(qna_no));
		model.addAttribute("qna_number",qna_no);
	}
	
	@PostMapping("/ManagerReplyInsert")
	public String manager_detail4(@RequestParam("qna_no") int qna_no,
			@RequestParam("qna_content") String qna_content,
			Model model,
			RedirectAttributes rttr) {
		
	QnaVO qna=new QnaVO();
	qna.setParentno(qna_no);
	qna.setQna_content(qna_content);
	
	service.ManagerReplyInsert(qna);
		
		return "redirect:/qna/manager_detail?qna_no="+qna_no;
	}
	
}