package com.leaf.myapp.service;

import java.util.List;

import com.leaf.myapp.vo.EmployeeVO;
import com.leaf.myapp.vo.PageVO;

public interface EmployeeService {	

	public List<EmployeeVO> searchEmployeeList(PageVO pVo);
	public PageVO page(String searchKey, String searchWord);	
	
	public EmployeeVO checkJoinId(String userid);
	public int employeeRegiInsert(EmployeeVO empVo); 
	
	
	// ������� ����	
	public EmployeeVO employeeChangeInfo(int emp_num);
	public int employeeChangeResult(EmployeeVO empvo);
}
