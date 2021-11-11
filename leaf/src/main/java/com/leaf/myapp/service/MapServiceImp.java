package com.leaf.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.FranNoticeDAO;
import com.leaf.myapp.dao.MapDAO;
import com.leaf.myapp.vo.MapVO;

@Service
public class MapServiceImp implements MapService {
	@Inject
	MapDAO mapdao;
	@Override
	public List<MapVO> mapAll(String searchMap) {
		return mapdao.mapAll(searchMap);
	}
	
}
