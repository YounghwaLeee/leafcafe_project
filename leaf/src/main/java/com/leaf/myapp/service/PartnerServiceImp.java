package com.leaf.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.PartnerDAO;
import com.leaf.myapp.vo.PageVO;
import com.leaf.myapp.vo.PartnerVO;

@Service
public class PartnerServiceImp implements PartnerService {
	@Inject
	PartnerDAO partnerDAO;	
	
	@Override
	public List<PartnerVO> searchPartnerList(PageVO pVo) {
		// TODO Auto-generated method stub
		return partnerDAO.searchPartnerList(pVo);
	}

	@Override
	public PageVO page(String searchKey, String searchWord) {
		// TODO Auto-generated method stub
		return partnerDAO.page(searchKey, searchWord);
	}

	@Override
	public PartnerVO checkJoinId(String userid) {
		// TODO Auto-generated method stub
		return partnerDAO.checkJoinId(userid);
	}

	@Override
	public int partnerRegiInsert(PartnerVO empVo) {
		// TODO Auto-generated method stub
		return partnerDAO.partnerRegiInsert(empVo);
	}

	@Override
	public PartnerVO partnerChangeInfo(int emp_num) {
		// TODO Auto-generated method stub
		return partnerDAO.partnerChangeInfo(emp_num);
	}

	@Override
	public int partnerChangeResult(PartnerVO empvo) {
		// TODO Auto-generated method stub
		return partnerDAO.partnerChangeResult(empvo);
	}

	
}
