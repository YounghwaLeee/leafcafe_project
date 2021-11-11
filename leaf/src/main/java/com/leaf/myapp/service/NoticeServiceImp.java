package com.leaf.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.NoticeDAO;
import com.leaf.myapp.vo.NoticePagingVO;
import com.leaf.myapp.vo.NoticeVO;

@Service
public class NoticeServiceImp implements NoticeService{
	@Inject
	NoticeDAO noticeDAO;
//	@Override
//	public List<NoticeVO> noticeAllSelect() {		
//		return noticeDAO.noticeAllSelect();
//	}
	@Override
	public NoticeVO noticeView(int no) {
		return noticeDAO.noticeView(no);
	}
	@Override
	public int noticeWrite(NoticeVO vo) {
		return noticeDAO.noticeWrite(vo);
	}
	@Override
	public int noticeEdit(NoticeVO vo) {		
		return noticeDAO.noticeEdit(vo);
	}
	@Override
	public int noticeDel(int no) {
		return noticeDAO.noticeDel(no);
	}
	@Override
	public int delChk(int[] delCheck) {
		return noticeDAO.delChk(delCheck);
	}
	@Override
	public int totalRecordCount(NoticePagingVO pVo) {
		return noticeDAO.totalRecordCount(pVo);
	}
	@Override
	public List<NoticeVO> noticePageSelect(NoticePagingVO pVo) {
		return noticeDAO.noticePageSelect(pVo);
	}
	@Override
	public int hitCount(NoticeVO vo) {
		return noticeDAO.hitCount(vo);
	}
	@Override
	public String checkAuto(String userid) {
		return noticeDAO.checkAuto(userid);
	}	
}
