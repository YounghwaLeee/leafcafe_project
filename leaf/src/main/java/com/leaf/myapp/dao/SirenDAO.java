package com.leaf.myapp.dao;

import java.util.List;

import com.leaf.myapp.vo.FranVO;
import com.leaf.myapp.vo.MenuVO;
import com.leaf.myapp.vo.RegisterVO;
import com.leaf.myapp.vo.SirenCartVO;

public interface SirenDAO {
	public List<MenuVO> setSirenList();
	public RegisterVO sirenRegData(String logname);
	public int addOrderTbl(SirenCartVO cVo);
	public List<FranVO> fcList();
	
}
