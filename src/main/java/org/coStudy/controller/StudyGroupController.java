package org.coStudy.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.coStudy.domain.Search;
import org.coStudy.domain.StudyGroupVO;
import org.coStudy.service.StudyGroupService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/studyGroup/*")
@AllArgsConstructor
public class StudyGroupController {
	
	private StudyGroupService service;

	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public String list(Model model
			,@RequestParam(required = false, defaultValue = "category_no")String searchType
			,@RequestParam(required = false)String keyword
	) throws Exception {
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		
		model.addAttribute("list", service.list(search));
		return "studyGroup/list";
	}

	@PostMapping("/insert")
	public String insert(StudyGroupVO studygroup, RedirectAttributes rttr) throws Exception {
		log.info("========================================");
		service.insert(studygroup);
		
		Map<Object, Object> map=new HashMap<>();
		map.put("success_no", studygroup.getStudygroup_no());
		map.put("page", "insert");
		
		rttr.addFlashAttribute("success", map);
		
		return "redirect:/studyGroup/list";
	}
	
	
	@GetMapping("/insert")
	public void insert(){
		
	}
	

	@GetMapping("/detail")
	public void datail(@RequestParam("studygroup_no") int studygroup_no, Model model) {
		model.addAttribute("studygroup", service.detail(studygroup_no));
	}
	
	

}
