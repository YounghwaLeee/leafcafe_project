package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.AdminSalesPageVO;
import com.leaf.myapp.vo.SalesVO;

public interface AdminSalesService {
	public Integer topTotalFran(); // ��� �Ѱ�������
	public Integer topTotalBuyCnt(String startdate, String enddate); //��� �� ����Ƚ��
	public Integer topTotalBuyUser(String startdate, String enddate); //��� �� �̿����
	public Integer topTotalSales(String startdate, String enddate); //��� �� �Ǹž�
	
	
	/////////////////////��ü������
	public int totalRecordCnt(AdminSalesPageVO aspVo); //����¡
	public List<SalesVO> rankList(SalesVO sVo); // �ش���Ͽ� �ش��� ��Ʈ�� ��ü��������Ʈ 
	public List<SalesVO> searchRankList(AdminSalesPageVO aspVo); // ����¡����Ʈ
	
	//������ ����
	public int totalRecordFranCnt(AdminSalesPageVO aspVo);
	public List<SalesVO> franRankList(SalesVO sVo);
	public List<SalesVO> searchFranRankList(AdminSalesPageVO aspVo);
	
	//���Ǹż��� ����
	public int totalRecordSalesCnt(AdminSalesPageVO aspVo);
	public List<SalesVO> salesRankList(SalesVO sVo);
	public List<SalesVO> searchSalesRankList(AdminSalesPageVO aspVo);
}
