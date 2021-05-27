package org.coStudy.controller;

import java.util.HashMap;
import java.util.Map;

import org.coStudy.domain.Criteria;
import org.coStudy.domain.NoticeVO;
import org.coStudy.domain.PageDTO;
import org.coStudy.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	private NoticeService service;

	@GetMapping("/list")
	public void list(Criteria cri,Model model) {
		model.addAttribute("list", service.list(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 127));//123은 임의의 총 글갯수
	}
	@GetMapping("/user_list")
	public void userlist(Criteria cri,Model model) {
		model.addAttribute("nlist", service.userList());
	}

	@PostMapping("/insert")
	public String insert(NoticeVO notice, RedirectAttributes rttr) {
		service.insert(notice);
		
		Map<Object, Object> map=new HashMap<>();
		map.put("success_no", notice.getNotice_no());
		map.put("page", "insert");

		rttr.addFlashAttribute("success", map);
		
		return "redirect:/notice/list";
	}
	@GetMapping("/insert")
	public void insert(){
		
	}

	@GetMapping("/detail")
	public void detail(@RequestParam("notice_no") int notice_no, @ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("notice", service.detail(notice_no));
	}
	
	@GetMapping("/update")
	public void update(@RequestParam("notice_no") int notice_no, Model model) {
		model.addAttribute("notice", service.detail(notice_no));
	}
	
	
	@PostMapping("/update")
	public String update(NoticeVO notice,RedirectAttributes rttr){
		if (service.update(notice)) {

			Map<Object, Object> map=new HashMap<>();
			map.put("success_no", notice.getNotice_no());
			map.put("page", "update");

			rttr.addFlashAttribute("success", map);

		}
		return "redirect:/notice/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("notice_no") int notice_no,RedirectAttributes rttr){
		if (service.delete(notice_no)) {
			/*rttr.addFlashAttribute("result","success");*/
			Map<Object, Object> map=new HashMap<>();
			map.put("success_no", notice_no);
			map.put("page", "delete");

			rttr.addFlashAttribute("success", map);
		}
		return "redirect:/notice/list";
		
	}
}
