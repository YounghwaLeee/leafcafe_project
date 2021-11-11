package com.leaf.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.AdminSalesDAO;
import com.leaf.myapp.vo.AdminSalesPageVO;
import com.leaf.myapp.vo.SalesVO;

@Service
public class AdminSalesImp implements AdminSalesService{
	@Inject
	AdminSalesDAO asDAO;

	@Override
	public Integer topTotalFran() {
		return asDAO.topTotalFran();
	}	
	
	@Override
	public Integer topTotalBuyCnt(String startdate, String enddate) {
		return asDAO.topTotalBuyCnt(startdate,enddate);
	}	
	
	@Override
	public Integer topTotalBuyUser(String startdate, String enddate) {
		return asDAO.topTotalBuyUser(startdate, enddate);
	}	
	
	@Override
	public Integer topTotalSales(String startdate, String enddate) {
		return asDAO.topTotalSales(startdate, enddate);
	}

	@Override
	public List<SalesVO> rankList(SalesVO sVo) {
		return asDAO.rankList(sVo);
	}

	@Override
	public int totalRecordCnt(AdminSalesPageVO aspVo) {
		return asDAO.totalRecordCnt(aspVo);
	}

	@Override
	public List<SalesVO> searchRankList(AdminSalesPageVO aspVo) {
		return asDAO.searchRankList(aspVo);
	}

	@Override
	public List<SalesVO> franRankList(SalesVO sVo) {
		return asDAO.franRankList(sVo);
	}

	@Override
	public List<SalesVO> searchFranRankList(AdminSalesPageVO aspVo) {
		return asDAO.searchFranRankList(aspVo);
	}

	@Override
	public int totalRecordFranCnt(AdminSalesPageVO aspVo) {
		return asDAO.totalRecordFranCnt(aspVo);
	}

	@Override
	public int totalRecordSalesCnt(AdminSalesPageVO aspVo) {
		return asDAO.totalRecordSalesCnt(aspVo);
	}

	@Override
	public List<SalesVO> salesRankList(SalesVO sVo) {
		return asDAO.salesRankList(sVo);
	}

	@Override
	public List<SalesVO> searchSalesRankList(AdminSalesPageVO aspVo) {
		return asDAO.searchSalesRankList(aspVo);
	}



	
	
}
