package com.leaf.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leaf.myapp.dao.OpenDAO;
import com.leaf.myapp.vo.OpenPageVO;
import com.leaf.myapp.vo.OpenRequestReplyVO;
import com.leaf.myapp.vo.OpenRequestVO;

@Service
public class OpenImp implements OpenService{
	
	@Inject
	OpenDAO openDAO;

	@Override
	public OpenRequestVO openUserPageGoInfo(String userid) {
		return openDAO.openUserPageGoInfo(userid);
	}
	
	@Override
	public int openRequestInfo(OpenRequestVO oprVo) {
		return openDAO.openRequestInfo(oprVo);
	}

	@Override
	public int authOpenAccess(String authid) {
		return openDAO.authOpenAccess(authid);
	}

	@Override
	public List<OpenRequestVO> searchOpenQuestionList(OpenPageVO pvo) {
		return openDAO.searchOpenQuestionList(pvo);
	}
	
	@Override
	public int openListpage(String searchKey, String searchWord, String oq_status) {
		return openDAO.openListpage(searchKey, searchWord,oq_status);
	}
	
	@Override
	public OpenRequestReplyVO openReplyExist(int oq_num) {
		return openDAO.openReplyExist(oq_num);
	}
	
	@Override
	public OpenRequestReplyVO openReplyWriter(String userid, int oq_num) {
		return openDAO.openReplyWriter(userid, oq_num);
	}	
	
	@Override
	public OpenRequestVO openBoardInfo(int oq_num) {
		return openDAO.openBoardInfo(oq_num);
	}
	
//	@Transactional 
	@Override
	public int openReplyWriteInsert(OpenRequestReplyVO rpvo) {
		return openDAO.openReplyWriteInsert(rpvo);
	}

	@Override
	public int openReplyWriteOk(int oq_num) {
		return openDAO.openReplyWriteOk(oq_num);
	}

	@Override
	public int openReplyEdit(int rp_num, String rpcon) {
		return openDAO.openReplyEdit(rp_num, rpcon);
	}

	@Override
	public String openReplyLastDate(int oq_num) {
		return openDAO.openReplyLastDate(oq_num);
	}

	@Override
	public int openReplyEditNum(int oq_num) {
		return openDAO.openReplyEditNum(oq_num);
	}

	@Override
	public int openReplyDelete(int rp_num) {
		return openDAO.openReplyDelete(rp_num);
	}

	@Override
	public int openReplyDeleteResult(int oq_num) {
		return openDAO.openReplyDeleteResult(oq_num);
	}




}
