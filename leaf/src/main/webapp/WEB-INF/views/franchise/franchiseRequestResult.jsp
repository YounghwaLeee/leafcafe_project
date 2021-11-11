<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	let result = ${result};
	
	if(result==1){
		alert("창업문의 등록을 완료하였습니다.\n문의내용으로 이동합니다.");
		// 마이페이지 문의내용으로 페이지이동
		location.replace('/myapp/myPageOpenQuestion'); // 우선 페이지이동만 설정
	}else if(result==2){
		alert("창업문의에 실패했습니다. \n다시 시도해주세요.");
		history.go(-1);
	}
</script>