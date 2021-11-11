package com.leaf.myapp.dao;

import java.util.List;

import com.leaf.myapp.vo.OpenPageVO;
import com.leaf.myapp.vo.OpenRequestReplyVO;
import com.leaf.myapp.vo.OpenRequestVO;


public interface OpenDAO {
	public OpenRequestVO openUserPageGoInfo(String userid);
	public int openRequestInfo(OpenRequestVO oprVo);
	public int authOpenAccess(String authid);
	//
	public List<OpenRequestVO> searchOpenQuestionList(OpenPageVO pvo);
	public int openListpage(String searchKey, String searchWord, String oq_status);
	
	public OpenRequestVO openBoardInfo(int oq_num);//
	public OpenRequestReplyVO openReplyExist(int oq_num);//
	public OpenRequestReplyVO openReplyWriter(String userid, int oq_num);//
	public String openReplyLastDate(int oq_num);
	
	public int openReplyWriteInsert(OpenRequestReplyVO rpvo);
	public int openReplyWriteOk(int oq_num);
	
	public int openReplyEdit(int rp_num, String rpcon);
	public int openReplyEditNum(int oq_num);
	
	public int openReplyDelete(int rp_num);
	public int openReplyDeleteResult(int oq_num);
	
}
