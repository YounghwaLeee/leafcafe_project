package com.leaf.myapp.dao;

import java.util.List;

import com.leaf.myapp.vo.MenuVO;

public interface MenuDAO {
	public List<MenuVO> MenuList(String m_code);//�޴�����
	public MenuVO MenuDetail(int p_num);//�󼼼���������
	public int Menu_RegisterOk(MenuVO vo);//�޴����

}
