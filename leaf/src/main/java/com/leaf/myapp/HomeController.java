package com.leaf.myapp;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.AdminService;
import com.leaf.myapp.service.ProductService;
import com.leaf.myapp.vo.AdminVO;
@Controller
public class HomeController {
	@Inject
	AdminService adminService;
	
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/franHome")
	public String home2() {
		return "franHome";
	}
	
	@RequestMapping("/adminHome")
	public ModelAndView testlogin() {
		ModelAndView mav = new ModelAndView();
		AdminVO vo = new AdminVO();
		vo.setTotalFran(adminService.TotalFran());
		vo.setTotalManage(adminService.TotalManage());
		vo.setTotalRegi(adminService.TotalRegi());
		vo.setTotalsales(adminService.TotalSales());

		mav.addObject("vo", vo);
		mav.setViewName("adminHome");
		return mav;
	}

	
}
