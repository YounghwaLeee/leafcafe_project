package com.leaf.myapp.dao;

import java.util.List;

import com.leaf.myapp.vo.PageVO;
import com.leaf.myapp.vo.PartnerVO;

public interface PartnerDAO {
	public List<PartnerVO> searchPartnerList(PageVO pVo);
	public PageVO page(String searchKey, String searchWord);	
	
	public PartnerVO checkJoinId(String userid);
	public int partnerRegiInsert(PartnerVO empVo); 
	
	
	// ������� ����	
	public PartnerVO partnerChangeInfo(int emp_num);
	public int partnerChangeResult(PartnerVO empvo);
}
