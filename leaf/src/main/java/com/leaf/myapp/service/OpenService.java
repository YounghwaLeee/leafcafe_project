package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.OpenPageVO;
import com.leaf.myapp.vo.OpenRequestReplyVO;
import com.leaf.myapp.vo.OpenRequestVO;

public interface OpenService {
	public OpenRequestVO openUserPageGoInfo(String userid); // 고객 창업문의 페이지로 이동시 로그인한 유저의 정보를 출력
	public int openRequestInfo(OpenRequestVO oprVo); // 고객 창업문의 페이지에서 입력한 정보를 저장	
	public int authOpenAccess(String authid);//창업문의목록 가맹관리부만 접근가능하도록(7200번)
	//
	public List<OpenRequestVO> searchOpenQuestionList(OpenPageVO pvo); // 창업문의 리스트 출력
	public int openListpage(String searchKey, String searchWord, String oq_status);//페이징
	public OpenRequestVO openBoardInfo(int oq_num);//게시글답변시 게시글정보 가져가기
	public OpenRequestReplyVO openReplyExist(int oq_num);//게시글에 답변자가 있는지 확인
	public OpenRequestReplyVO openReplyWriter(String userid,int oq_num);// 게시글에 답변자가 있는 경우 답변자 이름출력
	public String openReplyLastDate(int oq_num);// 최종작성일 가져오기
	
	public int openReplyWriteInsert(OpenRequestReplyVO rpvo);// 게시글 답변 등록하기
	public int openReplyWriteOk(int oq_num);//게시글 등록되면 등록완료라고 변경하기
	
	public int openReplyEdit(int rp_num, String rpcon);// 답글 수정하기
	public int openReplyEditNum(int oq_num);//답글수정시 답글번호 가져오기
	
	public int openReplyDelete(int rp_num); // 답글삭제하기
	public int openReplyDeleteResult(int oq_num);//답글삭제완료시 답변대기로 변경
	
}
