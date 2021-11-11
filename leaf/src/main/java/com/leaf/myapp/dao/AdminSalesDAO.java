package com.leaf.myapp.dao;

import java.util.List;

import com.leaf.myapp.vo.AdminSalesPageVO;
import com.leaf.myapp.vo.SalesVO;

public interface AdminSalesDAO {
	public Integer topTotalFran();
	public Integer topTotalBuyCnt(String startdate, String enddate);
	public Integer topTotalBuyUser(String startdate, String enddate);
	public Integer topTotalSales(String startdate, String enddate);
	
	
	public int totalRecordCnt(AdminSalesPageVO aspVo);
	public List<SalesVO> rankList(SalesVO sVo);
	public List<SalesVO> searchRankList(AdminSalesPageVO aspVo);
	
	public int totalRecordFranCnt(AdminSalesPageVO aspVo);
	public List<SalesVO> franRankList(SalesVO sVo);
	public List<SalesVO> searchFranRankList(AdminSalesPageVO aspVo);
	
	public int totalRecordSalesCnt(AdminSalesPageVO aspVo);
	public List<SalesVO> salesRankList(SalesVO sVo);
	public List<SalesVO> searchSalesRankList(AdminSalesPageVO aspVo);
}
