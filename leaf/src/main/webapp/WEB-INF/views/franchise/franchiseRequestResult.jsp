<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	let result = ${result};
	
	if(result==1){
		alert("â������ ����� �Ϸ��Ͽ����ϴ�.\n���ǳ������� �̵��մϴ�.");
		// ���������� ���ǳ������� �������̵�
		location.replace('/myapp/myPageOpenQuestion'); // �켱 �������̵��� ����
	}else if(result==2){
		alert("â�����ǿ� �����߽��ϴ�. \n�ٽ� �õ����ּ���.");
		history.go(-1);
	}
</script>