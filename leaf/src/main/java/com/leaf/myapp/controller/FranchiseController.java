package com.leaf.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.FranchiseService;
import com.leaf.myapp.vo.OpenRequestVO;


@Controller
public class FranchiseController {
@Inject
FranchiseService franchiseService;
	
	@RequestMapping("/franchise")
	public String fanchise() {
		return "franchise/franchiseMain";
	}
	@RequestMapping("/storemap")
	public String storemap() {
		return "franchise/storemap";
	}
	@RequestMapping("/franchiseInfo")
	public String franchiseInfo() {
		return "franchise/franchiseInfo";
	}	

	@RequestMapping("/franchiseQuestion")
	public String franchiseQuestion() {
		return "franchise/franchiseQuestion";
	}
}
