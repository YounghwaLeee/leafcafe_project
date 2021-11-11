<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹점 매출현황</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	setInterval(function(){
		$('#rank-one').toggle();},800);
	
	$('.sgc-list-button').click(function(){
		$('.sgc-list-button').removeClass("activebg");
		$('.sgc-list-button').css('color','black');
		$(this).addClass('activebg');
		$(this).css('color','white');
	});
	
	$('.pdb').click(function(){
		$('.pdb').removeClass("activebg");
		$('.pdb').css('color','black');
		$(this).addClass('activebg');
		$(this).css('color','white');
	});
</script>
<script type="text/javascript">
	  // 구글 파이차트
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Good', 'good'],
          ['아메리카노', 11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: '인기 판매 순위',
          pieHole: 0.4,
          width:'100%',
          height:'100%',          
          colors:['#0088ff','#3399ff','#66b2ff','#99ccff','#cce5ff'],
          animation:{duration:1000, easing:'in', startup:true},
          chartArea:{
        	  width:600, height:400, left:250, top:40},
          legend:'right',
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
<style>
	/* 인기상품 3개 */
	#bestConn{margin:50px auto 80px; width:1400px;}
	.amount{display: flex; width:100%; margin: auto; justify-content: space-around;}
	.amount > li {height: 400px; width:400px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); background:white;}
	.amount > li >.bc-inner {box-sizing: border-box; height:400px; width:400px; position:relative; text-align:center;}
	.bc-inner>.bc-img{border-sizing:border-box;background-repeat: no-repeat;width:100%; height:100%; background-size:cover;}	
	
	.bc-con-bg{position:absolute; height:180px; background:#333; width:400px; bottom:0px; background:#888; opacity:0.3;}
	.bc-contentdiv{position: absolute; bottom: 0px; width:400px; height:160px; color:white;}
	.bc-inner>.rank1{background-image:url(img/coffee10.jpg);}
	.bc-inner>.rank2{background-image:url(img/coffee6.jpg);}
	.bc-inner>.rank3{background-image:url(img/coffee9.jpg);}
	.bc-amount{padding-top:30px;}
	
	#rank-Con{height:60px; position:relative; width:1400px;}
	.rank-num{font-size:25px; display:inline-block; padding-top:20px; margin-left:207px; position:absolute;}
	#rank-one{color:red; font-weight:600;}
	#rank-two{color:blue;font-weight:500; left:470px;}
	#rank-three{color:#111;font-weight:400; left:942px;}


	/* 파이 그래프 */	
	#pieCont{width:1400px; margin:50px auto 0;}
	#pieLeftCon{width:900px; height:500px; display:inline-block;}
	#donutchart{width:900px; height:500px;}
	#pieRightCon{width:494px; height:500px; position:relative; display:inline-block; left:49px;}
	#pieDayBg{position:absolute; top:80px; left:87px;}
	#gigan-date{position: absolute; top: -66px; display: inline-block; width: 400px; font-size: 25px; left: -50px; text-align: center;}
	#pieDayBg>button{width:100px; height:40px; border: 0px solid; font-size:1.1em;}
	#pieCont:after{display:block; width:1400px; border-bottom:2px solid rgb(0,128,192); content:''; margin:0 auto;}
		/* 매출 날짜 버튼 */
	.activebg{background:rgb(0,128,192);}
	.activefont{color:black;}
		/* 매출 파이차트 심플 리스트*/
	#psCon{width:400px; height:300px; position:absolute; top:170px;}
	#piechart-saleList-top>li{float:left; width:15%; text-align:center;border-top:2px solid gray; border-bottom:1px solid gray; background:#e5e9eb; font-size:1.2em; padding:5px 0 5px;}	
	#piechart-saleList-top>li:nth-child(2){width:37%;}
	#piechart-saleList-top>li:nth-child(3){width:48%;}
	
	#piechart-saleList-body{margin-top: 10px;display: inline-block; border-bottom: 1px solid gray;}
	#piechart-saleList-body>li{float:left; width:15%; text-align:center; padding-bottom:10px; font-size:1.1em;}
	#piechart-saleList-body>li:nth-child(3n+2){width:37%;}
	#piechart-saleList-body>li:nth-child(3n+3){width:48%;}
	
	/* 페이징 버튼 */
	.page_wrap {text-align:center; font-size:0; height:30px; margin:30px auto; position:relative;}
	.page_nation {display:inline-block; position:relative;}
	.page_nation a {display:block; margin:0 3px; float:left; border:1px solid #e6e6e6; width:28px;
					height:28px; line-height:28px; text-align:center; background-color:#fff; font-size:13px;
					color:#999999; text-decoration:none;}
	.page_nation .arrow {border:1px solid #ccc;}
	.page_nation .pprev {background:#f8f8f8 url('img/page_pprev.png') no-repeat center center; margin-left:0;}
	.page_nation .prev {background:#f8f8f8 url('img/page_prev.png') no-repeat center center; margin-right:7px;}
	.page_nation .next {background:#f8f8f8 url('img/page_next.png') no-repeat center center; margin-left:7px;}
	.page_nation .nnext {background:#f8f8f8 url('img/page_nnext.png') no-repeat center center; margin-right:0;}
	.page_nation a.active {background-color:#42454c; color:#fff; border:1px solid #42454c;}
</style>

</head>
<body>
	<%@ include file="/inc/adminTop.jspf" %>
	<div class=top-banner-imgCon></div>
	
	<main id="admin-sale-main">
		<div id="notice-con">
			<div class="page-main-notice">
				<h3>매출확인</h3>
				<p>LEAF커피 매출 내용을 보실 수 있습니다.</p>
			</div>	
		</div>
		<div id="bestConn">
			<ul class="amount">
				<li>
					<div class="bc-inner">
					    <div class="bc-img rank1"></div>
					    <div class="bc-con-bg"></div>
					    <div class="bc-contentdiv">
						    <h1 class="bc-title">아메리카노</h1>
					      	<h2 class="bc-amount">1,231잔</h2>
					      	<h2 class="bc-price">301,327,000원</h2>
					    </div>  	
				    </div>
				</li>
			  	<li>
				    <div class="bc-inner">
				    	<div class="bc-img rank2"></div>
				    	<div class="bc-con-bg"></div>
				    	<div class="bc-contentdiv">
						    <h1 class="bc-title">녹차라떼</h1>
					      	<h2 class="bc-amount">1,131잔</h2>
					      	<h2 class="bc-price">201,327,000원</h2>
					    </div>
				    </div>
			  	</li>
			  	<li>
			    	<div class="bc-inner">
				        <div class="bc-img rank3"></div>
				        <div class="bc-con-bg"></div>
				        <div class="bc-contentdiv">
						    <h1 class="bc-title">오렌지주스</h1>
					      	<h2 class="bc-amount">631잔</h2>
					      	<h2 class="bc-price">161,327,000원</h2>
					    </div>
			    	</div>
			  	</li>				  	
			</ul>
			<div id="rank-Con">
				<span id="rank-one" class="rank-num">1위</span>
				<span id="rank-two" class="rank-num">2위</span>
				<span id="rank-three" class="rank-num">3위</span>
			</div>	
		</div>
		
		<!-- 일별 차트 -->		
		<div id="pieCont">
			<div id="pieLeftCon">	
				<div id="donutchart"></div>
			</div>	
			<div id="pieRightCon">
				<div id="pieDayBg">
					<button class="pdb activebg" style="color:white;">오늘</button>
					<button class="pdb">주간</button>
					<button class="pdb">월간</button>
				</div>
				<div id="psCon">
					<ul id="piechart-saleList-top">
						<li class="ps-rank">순위</li>
						<li class="ps-product">제품명</li>
						<li class="ps-total">총판매액</li>						
					</ul>
					<ul id="piechart-saleList-body">
						<li class="ps-rank">1</li>
						<li class="ps-product">아메리카노</li>
						<li class="ps-total">32,122,543원</li>
						<!--  -->
						<li class="ps-rank">1</li>
						<li class="ps-product">아메리카노</li>
						<li class="ps-total">32,122,543원</li>
						<!--  -->
						<li class="ps-rank">1</li>
						<li class="ps-product">아메리카노</li>
						<li class="ps-total">32,122,543원</li>
						<!--  -->
						<li class="ps-rank">1</li>
						<li class="ps-product">아메리카노</li>
						<li class="ps-total">32,122,543원</li>
						<!--  -->
						<li class="ps-rank">1</li>
						<li class="ps-product">아메리카노</li>
						<li class="ps-total">32,122,543원</li>
						<!--  -->						
					</ul>
				</div>	
			</div>
		</div>
		
		<div id="saleListCon">
			<h1>전체 매출 목록</h1>
			<div id="sl-top">
				<div id="sale-date-con"><!-- 큰한줄 -->
					<span id="sale-date">2021-09-27</span>
					<div id="sd-group-con"><!-- 버튼그룹 -->
						<button class="sgc-list-button activebg" style="color:white;">오늘</button>
						<button class="sgc-list-button">주간</button>
						<button class="sgc-list-button">월간</button>
					</div>
				</div>
				<form action="">
					<input type="text" name="saleSearch" placeholder="메뉴명을 입력해주세요."/>
					<input type="submit" value="search"/>
				</form>
			</div>
			<div id="saleList">
				<ul id="sl-ul-top">
					<li>순위</li>
					<li>메뉴명</li>
					<li>제품명</li>
					<li>판매수량</li>
					<li>가격</li>
					<li>총액</li>
				</ul>
				<ul id="sl-ul-body">	
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
					<!--  -->
					<li>1</li>
					<li>음료</li>
					<li>아메리카노</li>
					<li>10,321</li>
					<li>4,000</li>
					<li>332,231,000</li>
				</ul>
			</div>
			<div class="page_wrap">				
				<div class="page_nation">
					<a class="arrow pprev" href="#"></a>
					<a class="arrow prev" href="#"></a>
					<a class="active" href="#">1</a> 
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a class="arrow next" href="#"></a>
					<a class="arrow nnext" href="#"></a>
				</div>
			</div>
		</div>
	</main>		
	<%@ include file="/inc/bottom3.jspf" %>
</body>
</html>