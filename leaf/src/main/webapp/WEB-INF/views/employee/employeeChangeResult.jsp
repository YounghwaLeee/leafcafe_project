<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<script>
	let result = ${result};
	
	if(result==1){
		alert("������� ������ �����Ͽ����ϴ�.");
		location.href="<%=request.getContextPath()%>/employeeChange?emp_num=${emp_num}";
	} else if(result==2){
		alert("������� ������ �����Ͽ����ϴ�");
		history.go(-1);
	}	
</script>