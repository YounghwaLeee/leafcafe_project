package com.leaf.myapp.dao;

import java.util.List;

import com.leaf.myapp.vo.NoticePagingVO;
import com.leaf.myapp.vo.NoticeVO;

public interface NoticeDAO {
//	public List<NoticeVO> noticeAllSelect();
	public String checkAuto(String userid);
	public int hitCount(NoticeVO vo);
	public NoticeVO noticeView(int no);
	public int noticeWrite(NoticeVO vo);
	public int noticeEdit(NoticeVO vo);
	public int noticeDel(int no);	
	public int delChk(int[] delCheck);	
	public int totalRecordCount(NoticePagingVO pVo);
	public List<NoticeVO> noticePageSelect(NoticePagingVO pVo);

}
