package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.MenuVO;

public interface MenuService {
	public List<MenuVO> MenuList(String m_code);//�޴�����
	public MenuVO MenuDetail(int p_num);//�󼼼���������
	public int Menu_RegisterOk(MenuVO vo);//�޴����
}

