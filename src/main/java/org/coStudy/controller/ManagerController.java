package org.coStudy.controller;

import org.coStudy.domain.ManagerVO;
import org.coStudy.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/manager/*")
@AllArgsConstructor
@Controller
public class ManagerController {
		
	private ManagerService service;
	
	@GetMapping("/main")
	public String main(){
		log.info("main");
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
