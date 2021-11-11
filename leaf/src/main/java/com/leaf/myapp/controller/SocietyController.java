package com.leaf.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocietyController {
	@RequestMapping("/memberGrade")
	public String memberGrade() {
		return "society/memberGrade";
	}
	@RequestMapping("/membership")
	public String membership() {
		return "society/membership";
	}
}
