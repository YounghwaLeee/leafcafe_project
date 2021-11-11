package com.leaf.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.SirenDAO;
import com.leaf.myapp.vo.FranVO;
import com.leaf.myapp.vo.MenuVO;
import com.leaf.myapp.vo.RegisterVO;
import com.leaf.myapp.vo.SirenCartVO;
@Service
public class SirenServiceImp implements SirenService {
	@Inject
	SirenDAO sirenDAO;

	@Override
	public List<MenuVO> setSirenList() {
		return sirenDAO.setSirenList();
	}

	@Override
	public RegisterVO sirenRegData(String logname) {		
		return sirenDAO.sirenRegData(logname);
	}

	@Override
	public int addOrderTbl(SirenCartVO cVo) {
		return sirenDAO.addOrderTbl(cVo);
	}

	@Override
	public List<FranVO> fcList() {
		return sirenDAO.fcList();
	}


	
}
