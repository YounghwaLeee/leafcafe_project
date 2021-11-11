package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.MapVO;

public interface MapService {
	public List<MapVO> mapAll(String searchMap);
}
