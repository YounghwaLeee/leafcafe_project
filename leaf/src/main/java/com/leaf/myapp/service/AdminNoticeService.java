package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.AdminNoticeVO;
import com.leaf.myapp.vo.AdminPageVO;

public interface AdminNoticeService {
	//public List<AdminNoticeVO> noticeAll();
	public AdminNoticeVO noticeView(int no);
	public int adminnoticeWriteOk(AdminNoticeVO vo);//글쓰기
	public int adminnoticeEditOk(AdminNoticeVO vo);//글수정
	public int adminnoticeDel(int no, String userid);//글삭제
	
	//페이징
	public int totalRecordCount(AdminPageVO pVo);
	public List<AdminNoticeVO> noticePageSelect(AdminPageVO pVo);

	//조회수
	public int hitCount(AdminNoticeVO vo);
}
