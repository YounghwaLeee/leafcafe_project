package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.AdminSalesPageVO;
import com.leaf.myapp.vo.SalesVO;

public interface AdminSalesService {
	public Integer topTotalFran(); // 상단 총가맹점수
	public Integer topTotalBuyCnt(String startdate, String enddate); //상단 총 구매횟수
	public Integer topTotalBuyUser(String startdate, String enddate); //상단 총 이용고객수
	public Integer topTotalSales(String startdate, String enddate); //상단 총 판매액
	
	
	/////////////////////전체매출목록
	public int totalRecordCnt(AdminSalesPageVO aspVo); //페이징
	public List<SalesVO> rankList(SalesVO sVo); // 해당요일에 해당한 차트용 전체순위리스트 
	public List<SalesVO> searchRankList(AdminSalesPageVO aspVo); // 페이징리스트
	
	//가맹점 순위
	public int totalRecordFranCnt(AdminSalesPageVO aspVo);
	public List<SalesVO> franRankList(SalesVO sVo);
	public List<SalesVO> searchFranRankList(AdminSalesPageVO aspVo);
	
	//총판매수량 순위
	public int totalRecordSalesCnt(AdminSalesPageVO aspVo);
	public List<SalesVO> salesRankList(SalesVO sVo);
	public List<SalesVO> searchSalesRankList(AdminSalesPageVO aspVo);
}
