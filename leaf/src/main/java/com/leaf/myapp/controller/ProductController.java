package com.leaf.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.ProductService;
import com.leaf.myapp.service.RegisterService;
import com.leaf.myapp.vo.ProductVO;
import com.leaf.myapp.vo.RegisterVO;

@Controller
public class ProductController {
	@Inject
	ProductService productService;
	RegisterService registerService;
	
//////////////////////////////////////////////가맹점 //////////////////////////////////////////////////////		
	
	
	//발주페이지에 목록클릭시 파트너, 발주창 띄우기 ajax
	@RequestMapping(value="/purchasePartner")
	@ResponseBody
	public List<ProductVO>ajaxPartner(int hq_num){
		ModelAndView mav = new ModelAndView();
		List<ProductVO> list = productService.ProductPartner(hq_num);	

		return list;
	} 
	
	//발주하기
	@RequestMapping(value="/Purchase_RegisterOk", method = RequestMethod.POST)
	public ModelAndView Purchase_RegisterOk(ProductVO vo, HttpSession session) {
		String userid=(String)session.getAttribute("logid");
		vo.setUserid(userid);
		ModelAndView mav = new ModelAndView();  
		productService.Purchase_RegisterOk(vo);
		mav.addObject(vo);
		mav.setViewName("redirect:purchase");
		return mav;
	}
		 
	// 발주페이지에 발주 클릭시 발주 창 보여주기,발주페이지에 목록보여주기
	@RequestMapping("/purchase")
	 public ModelAndView purchaseList(HttpSession session) {
	      ModelAndView mav = new ModelAndView();
	      String userid=(String)session.getAttribute("logid");
	      mav.addObject("registerList",productService.mypage(userid));
	      mav.addObject("ProductList", productService.ProductList());
	      mav.addObject("purchaseList", productService.purchaseList(userid));
	      mav.addObject("NoProductList", productService.NoProductList());
	      mav.setViewName("Store/purchase");
	      return mav;
	}
	 //여러레코드 배열로 삭제하기 (발주삭제)
	@RequestMapping(value="/purchaseDel",method=RequestMethod.POST)
	   public ModelAndView purchaseDel(ProductVO vo) {
		ModelAndView mav = new ModelAndView();
	      
	      productService.purchaseDel(vo.getPurchaseDel());
	      mav.setViewName("redirect:purchase");   
	      return mav;
	   }
	
	@RequestMapping("/purchase_Modify")
		public String PurchaseModify() {
			return "Store/purchase_Modify";
	}
	
//////////////////////////////////////////////본사 //////////////////////////////////////////////////////	
	
	
	
		//입고리스트
		@RequestMapping("/Warehousing_Management")
		 public ModelAndView WarehousingList() {
		      ModelAndView mav = new ModelAndView();
		      List<ProductVO> vo = productService.WarehousingList();
		    
		      
		      
		      mav.addObject("WarehousingList", productService.WarehousingList());
		      mav.setViewName("Head/Warehousing_Management");
		      return mav;
		}
		// 본사가 보는 전체가맹점 발주리스트(본사페이지) 
		@RequestMapping("/purchase_Confirm")
		 public ModelAndView purchaseListAll() {
		      ModelAndView mav = new ModelAndView();
		      mav.addObject("purchaseListAll", productService.purchaseListAll());
		      mav.setViewName("Head/purchase_Confirm");
		      return mav;
		}
		//재고리스트
			@RequestMapping("/inventory")
			 public ModelAndView inventoryList() {
			      ModelAndView mav = new ModelAndView();
			      List<ProductVO> vo = productService.inventory();
			      for (int i = 0; i<vo.size(); i++) {
			    	  ProductVO pVo = vo.get(i);
			    	  int hq_num = pVo.getHq_num();
			    	  int inventory = productService.ware_cntAll(hq_num).getWare_cntAll() - productService.pc_cntAll(hq_num).getPc_cntAll();
			    	vo.get(i).setInventory(inventory);
			      }
			      
			      mav.addObject("inventory", vo);
			      mav.setViewName("Head/inventory");
			      return mav;
			}
		@RequestMapping("/Warehousing_Register")
		public ModelAndView Warehousing_Register() {
			ModelAndView mav = new ModelAndView();
		      mav.addObject("items", productService.selectItems());
		      mav.setViewName("Head/Warehousing_Register");
		      return mav;
			
		}	
		//입고등록하기
		@RequestMapping(value="/warehousing_RegisterOk", method=RequestMethod.POST)
		public ModelAndView Warehousing_RegisterOk(ProductVO vo, HttpSession ses) {
			ModelAndView mav = new ModelAndView();  
			productService.Warehousing_RegisterOk(vo);
			mav.addObject(vo);
			mav.setViewName("redirect:Warehousing_Management");
			return mav;
		}
		//제품등록하기
		@RequestMapping(value="/items_RegisterOk", method=RequestMethod.POST)
		public ModelAndView items_RegisterOk(ProductVO vo, HttpSession ses) {
			ModelAndView mav = new ModelAndView();
		      mav.addObject("selectPartner", productService.items_RegisterOk(vo));
		      mav.setViewName("redirect:inventory");
		      return mav;
		}
		/////////////////////////////////////////////////////////////////////////
		@RequestMapping(value="/items_Register")
		public ModelAndView items_Register() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("selectPartner", productService.selectPartner());
		      mav.setViewName("Head/items_Register");
		      return mav;
		}
		//발주확인 페이지에서 확인버튼 누르면 대기-> 완료로 변경
		@RequestMapping(value="/purchaseConfirm", method=RequestMethod.POST)
		public ModelAndView purchaseConfirm(ProductVO vo, HttpSession ses) {
		
			productService.purchaseConfirm(vo);
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("redirect:purchase_Confirm");
			mav.addObject("no", vo.getPc_num());
			return mav;
		}
		@RequestMapping(value="/excelDown")
		@ResponseBody
		public void excelDown(@ModelAttribute ProductVO vo, HttpServletResponse response, HttpServletRequest request) throws Exception{
		   productService.excelDown(vo, response);
		
		}
			}
