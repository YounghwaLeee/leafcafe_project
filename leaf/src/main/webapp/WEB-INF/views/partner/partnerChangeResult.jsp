<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<script>
	let result = ${result};
	
	if(result==1){
		alert("��Ʈ������ ������ �����Ͽ����ϴ�.");
		location.href="<%=request.getContextPath()%>/partnerChange?part_num=${part_num}";
	} else if(result==2){
		alert("��Ʈ������ ������ �����Ͽ����ϴ�");
		history.go(-1);
	}	
</script>