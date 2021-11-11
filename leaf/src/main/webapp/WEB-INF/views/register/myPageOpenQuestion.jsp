<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/top.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(()=>{	
		$("#headerText").animate({
		  	  top: "-205px", opacity:0.9
		  	  }, 600,);
		$("#menu1").click(function(){
			$(this).css('color','rgb(0, 163, 239)').css('border-bottom','4px solid rgb(0, 163, 239)');
			$("#menu2").css('border','none');
			$("#menu3").css('border','none');
		});
		$("#menu2").click(function(){
			$(this).css('color','rgb(0, 163, 239)').css('border-bottom','4px solid rgb(0, 163, 239)');
			$("#menu1").css('border','none');
			$("#menu3").css('border','none');
		});
		$("#menu3").click(function(){
			$(this).css('color','rgb(0, 163, 239)').css('border-bottom','4px solid rgb(0, 163, 239)');
			$("#menu1").css('border','none');
			$("#menu2").css('border','none');
		});
	});
</script>
<style>
	header{height:330px;}
	header img{height:330px;width:100%}
	#headerText{position:relative;top:-100px;left:860px;font-size:3em;color:white;opacity:0.5}
   ul,li{margin:0; padding:0; list-style:none;}
   .imglogo{height:250px; padding-left: 400px;}
   .id1, .pw1, .pw2, .mail{font-size: 0.7rem;}
   .imglogo img{width: 300px;}
   .containers{margin:0 auto; width: 1400px; height: 800px; align-items: center; font-size: 0.8rem;}
	.custom-shape-divider-bottom-1634814182 {
    position: absolute;
    top:375px;
    left: 0;
    width: 100%;
    overflow: hidden;
    line-height: 0;
    transform: rotate(180deg);
}

.custom-shape-divider-bottom-1634814182 svg {
    position: relative;
    display: block;
    width: calc(100% + 1.3px);
    height: 75px;
}

.custom-shape-divider-bottom-1634814182 .shape-fill {
    fill: #FFFFFF;
}
	#detailMenu{display:flex;justify-content:center;width:100%;border-bottom:1px solid gray;}
	#detailMenu>div:first-child{padding:15px 53px}
	#detailMenu>div:last-child{padding:15px 28px}
	#detailMenu a{color:#62605F;}	
	#menu2{padding: 15px 28px;border-bottom:4px solid rgb(0, 163, 239);}
	
	/* 리스트 */
	.notice-con{width:1400px; margin:50px auto 0;}
	.page-main-notice{text-align:center;}
	.page-main-notice>h3{font-size: 2em; color: #333; font-weight: 700; margin-bottom: 20px;}
	.openQuestionList{width:1400px;}
	
	
	ul,li{list-style:none;}
	.mypageOpenList>li{float:left; width:20%; border-bottom:1px solid gray;}
	.mypageOpenList>li:nth-of-type(4n+1){width:30%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
	.mypageOpenList>li:nth-of-type(4n+3){width:30%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
	.mypageOpenList>li:nth-child(1){border-bottom:2px solid gray;}
	.mypageOpenList>li:nth-child(2){border-bottom:2px solid gray;}
	.mypageOpenList>li:nth-child(3){border-bottom:2px solid gray;}
	.mypageOpenList>li:nth-child(4){border-bottom:2px solid gray;}
	
	
	.manage-listCon{overflow:auto; text-align:center; padding:0; margin-top:70px; width:1400px;}
	#emp-list-top{border-bottom: 2px solid lightblue;overflow:auto; text-align:center; padding:0; height:50px; font-size:0.9rem; line-height:45px;}
	#emp-list-top>li{float:left; width:20%; border-top:3px solid gray;}
	#emp-list-top>li:nth-of-type(4n+1){width:30%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
	#emp-list-top>li:nth-of-type(4n+3){width:30%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
	#emp-list{font-size: 0.9rem;}
	#emp-list>li{float:left; width:20%; border-bottom: 1px solid #ddd; height:50px; font-size:1.1em; line-height:50px;}
	#emp-list>li:nth-of-type(4n+1){width:30%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
	#emp-list>li:nth-of-type(4n+3){width:30%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
</style>
</head>
<body>
<header>
	<img src="https://www.baristapaulbassett.co.kr/images/whatsnew/eventSubVisual.jpg"/>
	<span id="headerText">My Page</span>
</header>
<div class="custom-shape-divider-bottom-1634814182">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
        <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
        <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
        <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
    </svg>
</div>
<nav id="detailMenu">
	<div id="menu1"><a href="/myapp/orderList">주문내역</a></div>
	<div id="menu2"><a href="/myapp/myPageOpenQuestion">창업문의 내역</a></div>
	<div id="menu3"><a href="/myapp/mypage">개인정보 수정</a></div>
</nav>   
	<div class="notice-con">
		<div class="page-main-notice">
			<h3>창업문의 내역</h3>
			<p>창업문의 내역을 확인하실 수 있습니다</p>
		</div>	
	</div>
	<div class="containers">
	
		<div class="manage-listCon">
			<ul id="emp-list-top">
				<li>문의내용</li>
				<li>문의등록일</li>
				<li>답변내용</li>
				<li>답변등록일</li>
			</ul>
			<ul id="emp-list">
			<c:forEach var="oqVo" items="${openReply}">
				<li>${oqVo.content}</li>
				<li>${oqVo.openrequestwrtiedate}</li>
				<li>${oqVo.rpcon}</li>
				<c:if test="${oqVo.rpcon=='답변대기'}">
					<li>답변대기중입니다...</li>
				</c:if>
				<c:if test="${oqVo.rpcon!='답변대기'}">
					<li>${oqVo.rpldate}</li>
				</c:if>	
			</c:forEach>
			</ul>
			</ul>		
		</div>
	</div>	
</body>
</html>