package com.leaf.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.FranNoticeDAO;
import com.leaf.myapp.vo.FranNoticeVO;
import com.leaf.myapp.vo.FranPageVO;
@Service
public class FranNoticeServiceImp implements FranNoticeService {
	@Inject
	FranNoticeDAO frannoticedao;
	
	@Override
	public List<FranNoticeVO> noticeAllSelect(FranPageVO pVo) {
		return frannoticedao.noticeAllSelect(pVo);
		
	}

	@Override
	public int franNoticeWriteOk(FranNoticeVO vo) {
		
		return frannoticedao.franNoticeWriteOk(vo);
	}

	@Override
	public FranNoticeVO frannoticeDetail(int no) {
		
		return frannoticedao.frannoticeDetail(no);
	}

	@Override
	public FranNoticeVO franNoticeEdit(int no) {
	
		return frannoticedao.franNoticeEdit(no);
	}

	@Override
	public int franNoticeEditOk(FranNoticeVO vo) {
		
		return frannoticedao.franNoticeEditOk(vo);
	}

	@Override
	public int franNoticeDelete(int no) {
		
		return frannoticedao.franNoticeDelete(no);
	}

	@Override
	public int totalRecordCount(FranPageVO pVo) {
		
		return frannoticedao.totalRecordCount(pVo);
	}

	@Override
	public int delChk(int[] delCheck) {
		
		return frannoticedao.delChk(delCheck);
	}



}
