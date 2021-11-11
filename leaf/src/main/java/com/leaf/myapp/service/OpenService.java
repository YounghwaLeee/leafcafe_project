package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.OpenPageVO;
import com.leaf.myapp.vo.OpenRequestReplyVO;
import com.leaf.myapp.vo.OpenRequestVO;

public interface OpenService {
	public OpenRequestVO openUserPageGoInfo(String userid); // �� â������ �������� �̵��� �α����� ������ ������ ���
	public int openRequestInfo(OpenRequestVO oprVo); // �� â������ ���������� �Է��� ������ ����	
	public int authOpenAccess(String authid);//â�����Ǹ�� ���Ͱ����θ� ���ٰ����ϵ���(7200��)
	//
	public List<OpenRequestVO> searchOpenQuestionList(OpenPageVO pvo); // â������ ����Ʈ ���
	public int openListpage(String searchKey, String searchWord, String oq_status);//����¡
	public OpenRequestVO openBoardInfo(int oq_num);//�Խñ۴亯�� �Խñ����� ��������
	public OpenRequestReplyVO openReplyExist(int oq_num);//�Խñۿ� �亯�ڰ� �ִ��� Ȯ��
	public OpenRequestReplyVO openReplyWriter(String userid,int oq_num);// �Խñۿ� �亯�ڰ� �ִ� ��� �亯�� �̸����
	public String openReplyLastDate(int oq_num);// �����ۼ��� ��������
	
	public int openReplyWriteInsert(OpenRequestReplyVO rpvo);// �Խñ� �亯 ����ϱ�
	public int openReplyWriteOk(int oq_num);//�Խñ� ��ϵǸ� ��ϿϷ��� �����ϱ�
	
	public int openReplyEdit(int rp_num, String rpcon);// ��� �����ϱ�
	public int openReplyEditNum(int oq_num);//��ۼ����� ��۹�ȣ ��������
	
	public int openReplyDelete(int rp_num); // ��ۻ����ϱ�
	public int openReplyDeleteResult(int oq_num);//��ۻ����Ϸ�� �亯���� ����
	
}
