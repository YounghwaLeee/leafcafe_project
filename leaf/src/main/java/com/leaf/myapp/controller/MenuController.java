package com.leaf.myapp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.MenuService;
import com.leaf.myapp.vo.MenuVO;


@Controller
public class MenuController {
	@Inject
	   MenuService menuService;
	//목록
	@RequestMapping("/menu_Coffee")
	   public ModelAndView menuCoffee() {
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("MenuList", menuService.MenuList("coffee"));
	      mav.setViewName("Consumer/menu_coffee");
	      return mav;
	   }
	@RequestMapping("/menu_Food")
	   public ModelAndView MenuFood() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("MenuList", menuService.MenuList("food"));
			mav.setViewName("Consumer/menu_food");
			return mav;
	   }
	 //메뉴상세설명페이지
	@RequestMapping("/menu_detail")
		public ModelAndView MenuDetail(int p_num) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("MenuVO",menuService.MenuDetail(p_num));
			MenuVO vo = menuService.MenuDetail(p_num);
			System.out.println(vo.getP_info());
			mav.setViewName("Consumer/menu_detail");
		return mav;
		}
		
	@RequestMapping("/menu_Beverage")
	   public ModelAndView MenuBeverage() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("MenuList", menuService.MenuList("beverage"));
			mav.setViewName("Consumer/menu_beverage");
		 return mav;
	   }
	@RequestMapping("/menu_Product")
		public ModelAndView MenuProduct() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("MenuList", menuService.MenuList("product"));
			mav.setViewName("Consumer/menu_product");
		return mav;
		}
	@RequestMapping("/menu_Register")
		public String MenuRegister() {
			return "Head/menu_Register";
	}
	
	
	//메뉴등록하기
	@RequestMapping(value="/menu_RegisterOk", method=RequestMethod.POST)
	public ModelAndView Menu_RegisterOk(MenuVO vo, HttpSession ses) {

	   ModelAndView mav = new ModelAndView();
	  
	    menuService.Menu_RegisterOk(vo);
	   
	  System.out.println(vo.getM_code());
	  mav.addObject("m_code", vo.getM_code());
		   if(vo.getM_code().equals("coffee")) {
			   mav.setViewName("redirect:menu_Coffee");			   
		   }else if(vo.getM_code().equals("food")) {
			   mav.setViewName("redirect:menu_Food");		
		   }else if(vo.getM_code().equals("beverage")) {
			   mav.setViewName("redirect:menu_Beverage");	
		   }else if(vo.getM_code().equals("product")) {
			   mav.setViewName("redirect:menu_Product");
		   }
		   
		   return mav;
	}

	
  
}
