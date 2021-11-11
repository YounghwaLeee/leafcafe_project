package com.leaf.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leaf.myapp.service.FranNoticeService;
import com.leaf.myapp.service.MapService;
import com.leaf.myapp.vo.MapVO;

@Controller
public class MapController {

	@Inject
	MapService mapservice;
	
	@RequestMapping("/map")
	@ResponseBody
	public List<MapVO> map(String search) {
		System.out.println(search);
		List<MapVO> vo = mapservice.mapAll(search);
		//System.out.println(vo.get(0).getFc_addr());
		return vo;
	}
}
