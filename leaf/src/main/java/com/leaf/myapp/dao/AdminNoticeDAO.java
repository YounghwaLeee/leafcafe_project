package com.leaf.myapp.dao;

import java.util.List;

import com.leaf.myapp.vo.AdminNoticeVO;
import com.leaf.myapp.vo.AdminPageVO;
import com.leaf.myapp.vo.MenuVO;
import com.leaf.myapp.vo.NoticePagingVO;
import com.leaf.myapp.vo.NoticeVO;

public interface AdminNoticeDAO {
	//public List<AdminNoticeVO> noticeAll();// 전체리스트보기
	public AdminNoticeVO noticeView(int no);//글내용보기
	public int adminnoticeWriteOk(AdminNoticeVO vo);//글쓰기
	public int adminnoticeEditOk(AdminNoticeVO vo);//글수정
	public int adminnoticeDel(int no, String userid);//글삭제
	
	//조회수
	public int hitCount(AdminNoticeVO vo);
	//페이징
	public int totalRecordCount(AdminPageVO pVo);
	public List<AdminNoticeVO> noticePageSelect(AdminPageVO pVo);
}
