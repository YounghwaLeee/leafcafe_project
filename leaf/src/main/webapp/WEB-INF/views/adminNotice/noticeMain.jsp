<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/adminTop.jspf" %>
<style>

	.container{
		display: flex;
		flex-direction: column;
		margin:0 auto;
		max-width: 1250px;
		
	}
	h3{
		margin-top: 50px;
	}
	.menu_bar{
		border:2px solid rgb(229, 227, 215);
		margin-top: 50px;
	}
	.menu_bar>ul, .menu_bar2 ul{
		display:flex;
		margin:20px;
	}

	.notice>ul{
		display:flex;
		margin-top:20px;
		justify-content: space-around;
		border-top:3px solid gray;
		border-bottom:1px solid gray;
		text-align: center;
	}
	.notice li{
		margin:10px;
	}
	.menu_bar li, .menu_bar2 li{
		margin: 0 40px;
		line-height:40px;
		height:40px;
	    width: 215px;
	    text-align: center;
	    margin-left: 40px;
    	margin-right: 40px;
    	border-radius: 5px;
    	cursor: pointer;
	}
	.menu_bar2{
		background-color:rgb(244, 244, 242);
		display:flex;
		justify-content: flex-end;
		margin-top: 50px;
	}
	.menu_bar2 li{
		display:flex;
		width:360px;
		height: 40px;
	}
	.seach{
		border:2px solid rgb(229, 227, 215);
		width:300px;
		padding-left: 7px;
    font-size: 0.9rem;
	}
	.btn{
		margin-left:5px;
		background-color:rgb(119, 119, 119);
		color:white;
	}
	.notice_content>ul{
		display:flex;
		height: 300px;
		justify-content: space-around;
		align-items: center;
		text-align: center;
		border-bottom: 1px solid;
	}
	.notice_content li{
		margin:10px;
	}
	.notice_content{
		height: 300px;
		border-bottom:1px solid gray;
		height:auto;
	}
	.img{
		
		width: 300px;
	}
	.notice li:nth-of-type(1), .notice_content li:nth-of-type(1){
		width:30px;
	}
	.notice li:nth-of-type(2){
		width:300px;
	}
	.notice_content li:nth-of-type(2){
		width:300px;
		height: 200px;
    overflow: hidden;
	}
	.notice li:nth-of-type(3), .notice_content li:nth-of-type(3){
		width:200px;
	}
	.notice li:nth-of-type(4), .notice_content li:nth-of-type(4){
		width:400px;
	}
	
	.selected {
		color: white;
		background-color: rgb(0, 163, 239);
	}
	.not-selected {
		color: black;
		background-color: rgb(244, 244, 242);
	}
	#reg{
		width: 15%;
	    margin-top: 50px;
	    margin-left: 1040px;
	    margin-bottom: 50px;
		}

.paging{display:flex;justify-content:center;margin:30px 0;font-size:1.2em;}
   .paging>li{margin:0 10px;}
   .now>a{font-weight:bold;text-decoration:underline solid #00A3EF;color:#382E2C;font-size:1.1em}

</style>
<script>
$(function(){

	$(".menu").click(function(){
		$(".menu").addClass("not-selected");
		$(".menu").removeClass("selected");
		$(this).removeClass("not-selected");
		$(this).addClass("selected");
	});
	
	$("#menu1").click(function(){
		$(".m1").css('display','flex');
		$(".m2").css('display','flex');
		$(".m3").css('display','flex');
	});
	
	$("#menu2").click(function(){
		$(".m1").css('display','flex');
		$(".m2").css('display','none');
		$(".m3").css('display','none');
		
	});
	$("#menu3").click(function(){
		$(".m2").css('display','flex');
		$(".m1").css('display','none');
		$(".m3").css('display','none');
	});
	$("#menu4").click(function(){
		$(".m3").css('display','flex');
		$(".m1").css('display','none');
		$(".m2").css('display','none');
	});

});
</script>
<div class="container">
	<h3><b>공지사항</b></h3>
	<div class="menu_bar">
		<ul>
			<li class="menu selected" id="menu1">All</li>
			<li class="menu not-selected" id="menu2">상품출시</li>
			<li class="menu not-selected" id="menu3">LEAF와 문화</li>
			<li class="menu not-selected" id="menu4">LEAF 사회공헌</li>
		</ul>
	</div>
	<div class="menu_bar2">
	<form method="post" action="/myapp/adminnoticeMain">
		<ul>
			<li id=""><input type="text" class="seach" placeholder="검색어를 입력해 주세요." name="searchKeyword"/><input type="submit" value="검색" class="btn"/></li>
		</ul>
	</form>	
	</div>
	<div class="notice">
		<ul>
			<li>NO</li>
			<li>이미지</li>
			<li>구분</li>
			<li>내용</li>
			<li>등록일</li>
			<li>조회수</li>
		</ul>
	</div>
	<div class="notice_content">
		<c:forEach var="adminnoticeVO" items="${list}"> 
            <ul  class="${adminnoticeVO.section}">
				<li>${adminnoticeVO.admin_no }</li>
				<li><a href="/myapp/adminnoticeDetail?no=${adminnoticeVO.admin_no }&nowpage=${pVo.nowPage}"><img src="img/${adminnoticeVO.img}" class="img"/></a></li>
				<li><c:if test="${adminnoticeVO.section == 'm1'}">상품출시</c:if>
		             <c:if test="${adminnoticeVO.section == 'm2'}">LEAF와 문화</c:if>
		              <c:if test="${adminnoticeVO.section == 'm3'}">LEAF 사회공헌</c:if>
				</li>	 
	            <li><b><a href="/myapp/adminnoticeDetail?no=${adminnoticeVO.admin_no }&nowpage=${pVo.nowPage}">${adminnoticeVO.admin_title }</a></b></li>
	            <li>${adminnoticeVO.admin_writedate }</li>
	            <li>${adminnoticeVO.admin_hit }</li>
			</ul>
         </c:forEach>
	</div>
	<input type="button" value="글등록" class="btn" id="reg" onClick="location.href='adminnoticeWrite'">
</div>

<ul class="paging">
         <c:if test="${pVo.nowPage>1}">
            <li><a href="/myapp/adminnoticeMain?nowPage=${pVo.nowPage-1}<c:if test='${searchKeyword != null}'>&searchKeyword=${pVo.searchKeyword}</c:if>"><i class="fas fa-angle-left"></i></a></li>
         </c:if>
      <!-- 시작페이지부터 5개의 페이지를 출력한다. -->
         <!-- 6,7,8,9,10 -->
         <c:forEach var="i" begin="${pVo.startPage }" end="${pVo.startPage+pVo.onePageNumCount-1 }">
         <!-- 출력할 페이지번호 총페이지수보다 작을때만 출력한다. -->
         <c:if test="${i<=pVo.totalPage }">
            <c:if test="${i==pVo.nowPage }">
               <li class="now">
            </c:if>
            <c:if test="${i!=pVo.nowPage }">
               <li>
            </c:if>
            <a href="/myapp/adminnoticeMain?nowPage=${i}<c:if test='${searchKeyword != null}'>&searchKeyword=${pVo.searchKeyword}</c:if>">${i}</a></li>
         </c:if>
         </c:forEach>
         <c:if test="${pVo.nowPage<pVo.totalPage}">
            <li><a href="/myapp/adminnoticeMain?nowPage=${pVo.nowPage+1 }<c:if test='${searchKeyword != null}'>&searchKeyword=${pVo.searchKeyword}</c:if>"><i class="fas fa-angle-right"></i></a></li>
         </c:if>   
      </ul>
<%@ include file="/inc/bottom.jspf" %>