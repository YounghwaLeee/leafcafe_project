package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.AdminNoticeVO;
import com.leaf.myapp.vo.AdminPageVO;

public interface AdminNoticeService {
	//public List<AdminNoticeVO> noticeAll();
	public AdminNoticeVO noticeView(int no);
	public int adminnoticeWriteOk(AdminNoticeVO vo);//�۾���
	public int adminnoticeEditOk(AdminNoticeVO vo);//�ۼ���
	public int adminnoticeDel(int no, String userid);//�ۻ���
	
	//����¡
	public int totalRecordCount(AdminPageVO pVo);
	public List<AdminNoticeVO> noticePageSelect(AdminPageVO pVo);

	//��ȸ��
	public int hitCount(AdminNoticeVO vo);
}
