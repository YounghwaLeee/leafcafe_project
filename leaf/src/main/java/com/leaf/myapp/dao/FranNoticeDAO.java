package com.leaf.myapp.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.leaf.myapp.vo.FranNoticeVO;
import com.leaf.myapp.vo.FranPageVO;

public interface FranNoticeDAO {
	
	public List<FranNoticeVO> noticeAllSelect (FranPageVO pVo); //글목록
	public int franNoticeWriteOk(FranNoticeVO vo);//글등록
	public FranNoticeVO frannoticeDetail(int no);//글내용보기
	public FranNoticeVO franNoticeEdit(int no);//글수정폼
	public int franNoticeEditOk(FranNoticeVO vo);//글수정하고확인
	public int franNoticeDelete(int no);//글삭제
	
	public int totalRecordCount(FranPageVO pVo);//총레코드수
	public int delChk(int[]delCheck);//체크삭제
	
}
