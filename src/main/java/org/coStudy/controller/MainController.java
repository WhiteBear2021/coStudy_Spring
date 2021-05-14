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
@RequestMapping("/user_main/*")
@AllArgsConstructor
public class MainController {
	@GetMapping("/main")
	public void list() {
		
	}

}
