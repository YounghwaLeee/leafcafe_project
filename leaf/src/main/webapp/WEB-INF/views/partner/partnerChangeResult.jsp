<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<script>
	let result = ${result};
	
	if(result==1){
		alert("파트너정보 수정에 성공하였습니다.");
		location.href="<%=request.getContextPath()%>/partnerChange?part_num=${part_num}";
	} else if(result==2){
		alert("파트너정보 수정에 실패하였습니다");
		history.go(-1);
	}	
</script>