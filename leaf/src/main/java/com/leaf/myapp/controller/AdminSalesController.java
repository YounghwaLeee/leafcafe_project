package com.leaf.myapp.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.AdminSalesService;
import com.leaf.myapp.vo.AdminSalesPageVO;
import com.leaf.myapp.vo.SalesVO;

@Controller
public class AdminSalesController {
	
	@Inject
	AdminSalesService asService;
	
	@RequestMapping("/adminSalesMainPage")
	public ModelAndView adminSales(SalesVO sVo) {
		ModelAndView mav = new ModelAndView();
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String startdate = year+"-"+month+"-"+day;
		String enddate = startdate;

		sVo.setTopTotalFran(asService.topTotalFran());
		sVo.setTopTotalBuyCnt(asService.topTotalBuyCnt(startdate,enddate));
		sVo.setTopTotalBuyUser(asService.topTotalBuyUser(startdate,enddate));
		sVo.setTopTotalSales(asService.topTotalSales(startdate,enddate));
		
		
		mav.addObject("topsVo",sVo);
		mav.setViewName("salesChart/adminSales");
		return mav;
	}
	
	// 그래프, 리스트 등을 출력 (ajax로 다시 넘어옴)
	@RequestMapping("/allTotalSales")
	@ResponseBody
	public Map<String,Object> allTotalSales(SalesVO sVo, AdminSalesPageVO aspVo){
		Map<String,Object> saleMap = new HashMap<String,Object>();

		// 상단 총알림 셋팅
		SalesVO topsVo = new SalesVO();

		topsVo.setTopTotalFran(asService.topTotalFran());
		topsVo.setTopTotalBuyCnt(asService.topTotalBuyCnt(sVo.getSdate(),sVo.getEdate()));
		topsVo.setTopTotalBuyUser(asService.topTotalBuyUser(sVo.getSdate(),sVo.getEdate()));
		topsVo.setTopTotalSales(asService.topTotalSales(sVo.getSdate(),sVo.getEdate()));

		
		int totalRecord = asService.totalRecordCnt(aspVo); // 총레코드수 구하기
		aspVo.setTotalRecord(totalRecord);
		
		int lastPageRecode = aspVo.getTotalRecord()%aspVo.getOnePageRecord();
		  
		  if(aspVo.getTotalPage()==aspVo.getNowPage() && lastPageRecode!=0) {
			  aspVo.setOnePageRecord(lastPageRecode); 
		  }else {
			  aspVo.setOnePageRecord(aspVo.getOnePageRecord()); 
		  }

		// 그래프로 뿌려주기	
		saleMap.put("dateTopsVo", topsVo);
		saleMap.put("chartlist", (List<SalesVO>)asService.rankList(sVo));
		saleMap.put("salesListPage",asService.searchRankList(aspVo));
		saleMap.put("pagesVo", aspVo);
		
		return saleMap;
	}
	
	@RequestMapping("/adminSalesFranPageGo")
	public ModelAndView adminSalesFranPage(SalesVO sVo) {
		ModelAndView mav = new ModelAndView();
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String startdate = year+"-"+month+"-"+day;
		String enddate = startdate;

		sVo.setTopTotalFran(asService.topTotalFran());
		sVo.setTopTotalBuyCnt(asService.topTotalBuyCnt(startdate,enddate));
		sVo.setTopTotalBuyUser(asService.topTotalBuyUser(startdate,enddate));
		sVo.setTopTotalSales(asService.topTotalSales(startdate,enddate));
		
		
		mav.addObject("topsVo",sVo);
		mav.setViewName("salesChart/adminSalesFran");
		return mav;
	}
	
	@RequestMapping("/allTotalFran")
	@ResponseBody
	public Map<String,Object> allTotalFran(SalesVO sVo, AdminSalesPageVO aspVo){
		Map<String,Object> saleMap = new HashMap<String,Object>();

		// 상단 총알림 셋팅
		SalesVO topsVo = new SalesVO();

		topsVo.setTopTotalFran(asService.topTotalFran());
		topsVo.setTopTotalBuyCnt(asService.topTotalBuyCnt(sVo.getSdate(),sVo.getEdate()));
		topsVo.setTopTotalBuyUser(asService.topTotalBuyUser(sVo.getSdate(),sVo.getEdate()));
		topsVo.setTopTotalSales(asService.topTotalSales(sVo.getSdate(),sVo.getEdate()));

		
		int totalRecord = asService.totalRecordFranCnt(aspVo); // 총레코드수 구하기
		aspVo.setTotalRecord(totalRecord);
		
		int lastPageRecode = aspVo.getTotalRecord()%aspVo.getOnePageRecord();
		  
		  if(aspVo.getTotalPage()==aspVo.getNowPage() && lastPageRecode!=0) {
			  aspVo.setOnePageRecord(lastPageRecode); 
		  }else {
			  aspVo.setOnePageRecord(aspVo.getOnePageRecord()); 
		  }

		// 그래프로 뿌려주기	
		saleMap.put("dateTopsVo", topsVo);
		saleMap.put("chartlist", (List<SalesVO>)asService.franRankList(sVo));
		saleMap.put("salesListPage",asService.searchFranRankList(aspVo));
		saleMap.put("pagesVo", aspVo);
		
		return saleMap;
	}
	
	@RequestMapping("/adminSalesBuyCountGo")
	public ModelAndView adminSalesBuyCountGo(SalesVO sVo) {
		ModelAndView mav = new ModelAndView();
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String startdate = year+"-"+month+"-"+day;
		String enddate = startdate;

		sVo.setTopTotalFran(asService.topTotalFran());
		sVo.setTopTotalBuyCnt(asService.topTotalBuyCnt(startdate,enddate));
		sVo.setTopTotalBuyUser(asService.topTotalBuyUser(startdate,enddate));
		sVo.setTopTotalSales(asService.topTotalSales(startdate,enddate));
		
		
		mav.addObject("topsVo",sVo);
		mav.setViewName("salesChart/adminSalesBuyCount");
		return mav;
	}
	
	@RequestMapping("/allSalesBuyCount")
	@ResponseBody
	public Map<String,Object> allSalesBuyCount(SalesVO sVo, AdminSalesPageVO aspVo){
		Map<String,Object> saleMap = new HashMap<String,Object>();

		// 상단 총알림 셋팅
		SalesVO topsVo = new SalesVO();

		topsVo.setTopTotalFran(asService.topTotalFran());
		topsVo.setTopTotalBuyCnt(asService.topTotalBuyCnt(sVo.getSdate(),sVo.getEdate()));
		topsVo.setTopTotalBuyUser(asService.topTotalBuyUser(sVo.getSdate(),sVo.getEdate()));
		topsVo.setTopTotalSales(asService.topTotalSales(sVo.getSdate(),sVo.getEdate()));

		
		int totalRecord = asService.totalRecordSalesCnt(aspVo); // 총레코드수 구하기
		aspVo.setTotalRecord(totalRecord);
		
		int lastPageRecode = aspVo.getTotalRecord()%aspVo.getOnePageRecord();
		  
		  if(aspVo.getTotalPage()==aspVo.getNowPage() && lastPageRecode!=0) {
			  aspVo.setOnePageRecord(lastPageRecode); 
		  }else {
			  aspVo.setOnePageRecord(aspVo.getOnePageRecord()); 
		  }
		 
		// 그래프로 뿌려주기	
		saleMap.put("dateTopsVo", topsVo);
		saleMap.put("chartlist", (List<SalesVO>)asService.salesRankList(sVo));
		saleMap.put("salesListPage",asService.searchSalesRankList(aspVo));
		saleMap.put("pagesVo", aspVo);
		
		return saleMap;
	}
}
