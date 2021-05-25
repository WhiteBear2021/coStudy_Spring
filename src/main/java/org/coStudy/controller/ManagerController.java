package org.coStudy.controller;

import java.util.HashMap;
import java.util.List;

import org.coStudy.domain.ManagerVO;
import org.coStudy.domain.UserNewSta;
import org.coStudy.domain.UserVO;
import org.coStudy.service.ManagerService;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/manager/*")
@AllArgsConstructor
@Controller
public class ManagerController {
      
   private ManagerService service;
   
   @GetMapping("/main")
   public String main(Model model){
      log.info("main");
      log.info("------manager main 부분------");
      //회원 카테고리
      List<Integer> user_category_sta=service.user_category_sta();
      model.addAttribute("user_category_sta",user_category_sta);
   
      //스터디그룹 카테고리
      List<Integer> studygroup_Category_Sta=service.studygroup_Category_Sta();
      model.addAttribute("studygroup_Category_Sta",studygroup_Category_Sta);
      
      log.info("/----------------------");
      log.info(user_category_sta);
      
   //새로운 회원 
      List<UserNewSta> user_New_Sta=service.user_New_Sta();
      String list= new Gson().toJson(user_New_Sta);
      log.info(list);
      model.addAttribute("list", list);
      model.addAttribute("user_New_Sta",user_New_Sta);
      
      log.info(user_New_Sta);
      return "manager_main/manager_index";
   }
   
   @GetMapping("/list")
   public String list(Model model){
      log.info("list");
      model.addAttribute("list", service.list());
      return "manager/ManagerList";
   }
   
   @GetMapping("/add")
   public void add(){
      
   }
   
   @PostMapping("/add")
   public String add(ManagerVO manager, RedirectAttributes rttr){
      log.info("add: "+manager);
      service.insert(manager);
      rttr.addFlashAttribute("result",manager.getManager_no());
      return "redirect:/manager/list";
   }

   
   @GetMapping("/delete")
   public String delete(@RequestParam("manager_no") int manager_no, RedirectAttributes rttr){
      log.info("delete:"+manager_no);
      service.delete(manager_no);
      return "redirect:/manager/list";
   }
   
}