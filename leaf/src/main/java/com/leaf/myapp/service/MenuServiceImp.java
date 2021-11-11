package com.leaf.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.MenuDAO;
import com.leaf.myapp.vo.MenuVO;


@Service
public class MenuServiceImp implements MenuService{
	@Inject
	MenuDAO menuDAO;

	

	@Override
	public int Menu_RegisterOk(MenuVO vo) {
		// TODO Auto-generated method stub
		return menuDAO.Menu_RegisterOk(vo);
	}

	@Override
	public MenuVO MenuDetail(int p_num) {
		// TODO Auto-generated method stub
		return menuDAO.MenuDetail(p_num);
	}

	@Override
	public List<MenuVO> MenuList(String m_code) {
		// TODO Auto-generated method stub
		return menuDAO.MenuList(m_code);
	}


	
}
