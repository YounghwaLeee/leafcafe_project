package com.leaf.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.SirenService;
import com.leaf.myapp.vo.RegisterVO;
import com.leaf.myapp.vo.SirenCartVO;

@Controller
public class SirenController {
	@Inject
	SirenService sirenService;
	
	@RequestMapping("/siren")
	public ModelAndView sirenList(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String logname = (String)ses.getAttribute("logname");
		if(logname==null) {
			mav.setViewName("register/login");
			return mav;
		}else {
			mav.addObject("menuVo", sirenService.setSirenList());
			mav.addObject("regVo", sirenService.sirenRegData(logname));
			mav.addObject("franVo" , sirenService.fcList());
			mav.setViewName("siren_Order/siren");
			return mav;
		}
	}
	//바로주문
	@RequestMapping("/order")
	@ResponseBody
	public void order(SirenCartVO cVo) {
		int result = sirenService.addOrderTbl(cVo);
		if(result>0) {
			System.out.println("정보전달 성공");
		}
	}
	//장바구니 결제
	@RequestMapping("/cartOrder")
	@ResponseBody
	public void cartOrder(String param) {
		String rows[] = param.split("/");

		for(int i=0;i<rows.length;i++) {
			SirenCartVO cVo = new SirenCartVO();
			String cartList[] = rows[i].split(",");
			cVo.setOd_price(Long.parseLong(cartList[0]));
			cVo.setP_num(Integer.parseInt(cartList[1]));
			cVo.setOd_cnt(Integer.parseInt(cartList[2]));
			cVo.setFc_num(Integer.parseInt(cartList[3]));
			cVo.setUserid(cartList[4]);
			
			int result = sirenService.addOrderTbl(cVo);
			if(result>0) {
				System.out.println("결제 성공");
			}
		}

	}
}
