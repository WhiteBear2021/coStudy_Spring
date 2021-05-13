package org.coStudy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.coStudy.domain.UserVO;
import org.coStudy.service.ManagerUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/manageUser/*")
@AllArgsConstructor
@Controller
public class ManageUserController {

		private ManagerUserService service;
		
		@GetMapping("/list")
		public String list(Model model){
			log.info("user list");
			model.addAttribute("list", service.list());
			return "manager/userInfoList";
		}
		
		@GetMapping("/newList")
		public String newList(Model model){
			log.info("new user list");
			String dateString = null;
			SimpleDateFormat sd = new SimpleDateFormat("yy/MM/dd");
			dateString=sd.format(new Date());
			model.addAttribute("newList", service.newList(dateString));
			return "manager/newUserList";
		}
}
