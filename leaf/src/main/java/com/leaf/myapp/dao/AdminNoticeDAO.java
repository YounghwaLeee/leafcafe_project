package com.leaf.myapp.dao;

import java.util.List;

import com.leaf.myapp.vo.AdminNoticeVO;
import com.leaf.myapp.vo.AdminPageVO;
import com.leaf.myapp.vo.MenuVO;
import com.leaf.myapp.vo.NoticePagingVO;
import com.leaf.myapp.vo.NoticeVO;

public interface AdminNoticeDAO {
	//public List<AdminNoticeVO> noticeAll();// ��ü����Ʈ����
	public AdminNoticeVO noticeView(int no);//�۳��뺸��
	public int adminnoticeWriteOk(AdminNoticeVO vo);//�۾���
	public int adminnoticeEditOk(AdminNoticeVO vo);//�ۼ���
	public int adminnoticeDel(int no, String userid);//�ۻ���
	
	//��ȸ��
	public int hitCount(AdminNoticeVO vo);
	//����¡
	public int totalRecordCount(AdminPageVO pVo);
	public List<AdminNoticeVO> noticePageSelect(AdminPageVO pVo);
}
