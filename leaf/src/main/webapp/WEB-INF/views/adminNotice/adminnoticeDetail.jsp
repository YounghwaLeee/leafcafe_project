<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/franTop.jspf" %>
<style>
	.container{

		margin:0 auto;
		max-width: 1250px;
	}
	h3{
		margin-top: 50px;
	}
	.menu_bar{
	    margin-top: 50px;
	    font-size: 1.3em;
	    line-height: 60px;
	    border-radius: 10px;
	    padding: 10px;
	    background-color: antiquewhite;
	}
	.bottom_bar{
		margin-top: 50px;
	    line-height: 30px;
		border-top:3px solid gray;
		border-bottom:3px solid gray;
		margin-bottom: 150px;
		display: flex;
	}
	.bottom_bar>ul{
		width:100%;
	}
	.bottom_bar li{
		border-bottom:1px solid gray;
		width:100%;
		display:flex;
	}

	.btn{
		margin-left:5px;
		background-color:rgb(119, 119, 119);
		color:white;
		width:100px;
		height:40px;
	}
	.img{
	    width: 1000px;
	    margin: 110px;
	}
	.button{
		margin:110px;
		display:flex;
    	justify-content: flex-end;
	}
	
	.span{
		width:150px;
		background-color:rgb(244, 244, 242);
	}
	.content{
		 margin-left: 110px;
	}
	.span{
		width:100px;
	}
	.prev{
		width:100px;
	}

</style>
<script>
	function delCheck(admin_no){
		if(confirm("삭제할까요?")){
			location.href='/myapp/adminnoticeDel?no='+admin_no;
		}else{
			alert("삭제불가");
		}
	};
</script>
<div class="container">
	<h3><b>공지사항</b></h3>
	<div class="menu_bar"><b> ${adminnoticeVo.admin_title }</b></div>
	<img src="img/${adminnoticeVo.img}" class="img"/>
	<div class="content">${adminnoticeVo.admin_content }</div>
	<div class="button">
		<input type="button" value="목록" class="btn" onClick="location.href='adminnoticeMain'">
		<c:if test="${adminnoticeVo.userid==logid}">
		
		<input type="button" value="수정하기"class="btn" onclick="location.href='/myapp/adminnoticeEdit?no=${adminnoticeVo.admin_no}'">
		<input type="button" value="삭제하기"class="btn" onclick="location.href='javascript:delCheck(${adminnoticeVo.admin_no})'">
		</c:if>
	</div>
	<div class="bottom_bar">
		<ul>
			<li><div class="prev">윗글</div><a href="/myapp/adminnoticeDetail?no=${adminnoticeVo.next}">${adminnoticeVo.next_title}</a></li>
			<li><div class="prev">아랫글</div><a href="/myapp/adminnoticeDetail?no=${adminnoticeVo.prev}">${adminnoticeVo.prev_title}</a></li>
		</ul>
		
		
	</div>
</div>
<%@ include file="/inc/bottom.jspf" %>