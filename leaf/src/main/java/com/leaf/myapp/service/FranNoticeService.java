package com.leaf.myapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.leaf.myapp.vo.FranNoticeVO;
import com.leaf.myapp.vo.FranPageVO;

public interface FranNoticeService {

	public List<FranNoticeVO> noticeAllSelect(FranPageVO pVo);
	public int franNoticeWriteOk(FranNoticeVO vo);
	public FranNoticeVO frannoticeDetail(int no);
	public FranNoticeVO franNoticeEdit(int no);
	public int franNoticeEditOk(FranNoticeVO vo);
	public int franNoticeDelete(int no);
	
	public int totalRecordCount(FranPageVO pVo);
	
	public int delChk(int[]delCheck);
	
}
