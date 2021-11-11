package com.leaf.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.myapp.service.EmployeeService;
import com.leaf.myapp.vo.EmployeeVO;
import com.leaf.myapp.vo.PageVO;

@Controller
public class EmployeeController {
	@Inject
	EmployeeService employeeService;	
	
	//�����˻� ����������
	@RequestMapping("/employeeManagePage")
	public ModelAndView employeemain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("employee/employeemain");
		return mav;
	}
	// �������
	@RequestMapping("/employeeRegiPage")
	public String employeeRegiPage() {
		return "employee/employeeRegi";
	}
	// ��� ��������
	@RequestMapping("/employeeChange")
	public ModelAndView employeeChange(int emp_num) {
		ModelAndView mav = new ModelAndView();		
		mav.addObject("empvo", employeeService.employeeChangeInfo(emp_num));		
		mav.setViewName("employee/employeeChange");			
		
		return mav;
	}
	
	// ��������� ���� ���
	@RequestMapping(value="/employeeChangeResult", method=RequestMethod.POST)
	public ModelAndView employeeChangeResult(EmployeeVO empvo) {
		ModelAndView mav = new ModelAndView();		
		
		int cnt = employeeService.employeeChangeResult(empvo);		
		if(cnt>0) {
			mav.addObject("result",1);
			mav.addObject("emp_num",empvo.getEmp_num());						
		}else {
			mav.addObject("result",2);
		}
		mav.setViewName("employee/employeeChangeResult");
		
		return mav;
	}
	
	
	// �����˻�(�����ȣ,�����,�μ���)	
	  @RequestMapping("/empSearch")	  
	  @ResponseBody 
	  public Map<String,Object> searchEmployeeList(PageVO pVo){
		  PageVO ppVo = employeeService.page(pVo.getSearchKey(),pVo.getSearchWord());
		  ppVo.setSearchKey(pVo.getSearchKey());
		  ppVo.setSearchWord(pVo.getSearchWord());
		  ppVo.setNowPage(pVo.getNowPage());
		  
		  
		  int lastPageRecode = ppVo.getTotalRecord()%pVo.getOnePageRecord(); // ������������ ���ڵ� ��
		  		  
		  if(ppVo.getTotalPage()==pVo.getNowPage() && lastPageRecode!=0) {
			  ppVo.setOnePageRecord(lastPageRecode);
		  }else {			  
			  ppVo.setOnePageRecord(pVo.getOnePageRecord());
		  }

		  List<EmployeeVO> empvo = employeeService.searchEmployeeList(ppVo);		  
		  Map<String,Object> empMap = new HashMap<String,Object>();
		  empMap.put("pvo", (PageVO)ppVo);
		  empMap.put("empvo", (List<EmployeeVO>)empvo);		  
		  
		  return empMap; 
	  }
	  
	  // ����¡��
	  @RequestMapping("/totalPage")
	  @ResponseBody
	  public PageVO totalPage(PageVO pVo) {
		  return employeeService.page(pVo.getSearchKey(), pVo.getSearchWord());
	  }
	
	// ������ ������ ������ ���̵����� Ȯ��
	@RequestMapping("/employeeJoinChecking")
	@ResponseBody
	public EmployeeVO employeeJoinCheck(String userid) {
		return employeeService.checkJoinId(userid);
	}
		
	// ������
	@RequestMapping(value="/employeeRegister", method=RequestMethod.POST)
	public ModelAndView employeeRegister(EmployeeVO empVo) { // httpSession
		ModelAndView mav = new ModelAndView();
		int result = employeeService.employeeRegiInsert(empVo);
		if(result>0) {
			mav.setViewName("redirect:employeeRegiPage");			
		}else {
			mav.setViewName("employee/employeeRegiFail");
		}
		return mav;
	}
	
	
}
