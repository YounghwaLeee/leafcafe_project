package com.leaf.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.AdminNoticeDAO;
import com.leaf.myapp.vo.AdminNoticeVO;
import com.leaf.myapp.vo.AdminPageVO;

@Service
public class AdminNoticeServiceImp implements AdminNoticeService {
@Inject
AdminNoticeDAO adminnoticedao;

//@Override
//public List<AdminNoticeVO> noticeAll() {
	// TODO Auto-generated method stub
//	return adminnoticedao.noticeAll();
//}

@Override
public AdminNoticeVO noticeView(int no) {
	// TODO Auto-generated method stub
	return adminnoticedao.noticeView(no);
}

@Override
public int adminnoticeWriteOk(AdminNoticeVO vo) {
	// TODO Auto-generated method stub
	return adminnoticedao.adminnoticeWriteOk(vo);
}

@Override
public int adminnoticeEditOk(AdminNoticeVO vo) {
	// TODO Auto-generated method stub
	return adminnoticedao.adminnoticeEditOk(vo);
}

@Override
public int adminnoticeDel(int no, String userid) {
	// TODO Auto-generated method stub
	return adminnoticedao.adminnoticeDel(no, userid);
}

@Override
public int totalRecordCount(AdminPageVO pVo) {
	// TODO Auto-generated method stub
	return adminnoticedao.totalRecordCount(pVo);
}

@Override
public List<AdminNoticeVO> noticePageSelect(AdminPageVO pVo) {
	// TODO Auto-generated method stub
	return adminnoticedao.noticePageSelect(pVo);
}

@Override
public int hitCount(AdminNoticeVO vo) {
	// TODO Auto-generated method stub
	return adminnoticedao.hitCount(vo);
}


}
