package com.leaf.myapp.dao;

import java.util.List;

import com.leaf.myapp.vo.MapVO;

public interface MapDAO {
	public List<MapVO> mapAll(String searchMap);
}
