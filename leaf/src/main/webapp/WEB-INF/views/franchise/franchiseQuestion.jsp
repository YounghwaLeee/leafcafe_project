<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.toggleWrap {
	width: 1400px;
	margin: 101px auto;
}

.list-title {
	border-bottom: 1px solid #ddd;
	font-size: 1em;
	padding: 10px;
}

.toggleBox {
	display: none;
	padding: 20px;
	font-size: 1em;
	color:gray;
	border-bottom: 1px solid #ddd;
}

b {
	color: rgb(0, 163, 239);
}

	header img{width:100%;}
	header{height:330px;overflow:hidden;}
	#headerText{position:relative;top:-100px;left:740px;font-size:3em;color:white;opacity:0.5}
#detailMenu{display:flex;justify-content:center;width:100%;border-bottom:1px solid gray;}
	#detailMenu>div{padding:15px 40px;}
	#menu4{border-bottom:4px solid rgb(0, 163, 239);}
	nav a{color:#62605F;}
	.custom-shape-divider-bottom-1634710677 {
    position: absolute;
    top: 352px;
    left: 0;
    width: 100%;
    overflow: hidden;
    line-height: 0;
    transform: rotate(180deg);
}

.custom-shape-divider-bottom-1634710677 svg {
    position: relative;
    display: block;
    width: calc(100% + 1.3px);
    height: 98px;
    transform: rotateY(180deg);
}

.custom-shape-divider-bottom-1634710677 .shape-fill {
    fill: #FFFFFF;
}
COPY HTMLCOPY C
</style>
<script>
	$(()=>{
		$(".toggleEach").click(function(){
			$(this).children(".toggleBox").toggle( 'slow' );
		});
		
		
	});
	$(()=>{	
		$("#headerText").animate({
	  	  top: "-277px", opacity:1
	  	  }, 1200,);
	});
</script>

<body>
<%@ include file="/inc/top.jspf" %>
<header>
	<img src="https://www.starbucks.co.kr/common/img/coffee/coffee_choice_wrap_bg.jpg"/>
	<span id="headerText">QUESTION & ANSWER</span>
</header>
<div class="custom-shape-divider-bottom-1634710677">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
        <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
    </svg>
</div>
<nav id="detailMenu">
	<div id="menu1"><a href="/myapp/storemap">STORE</a></div>
	<div id="menu2"><a href="/myapp/franchiseInfo">INFORMATION</a></div>
	<div id="menu3"><a href="/myapp/openRequest">REQUEST</a></div>
	<div id="menu4"><a href="/myapp/franchiseQuestion">Q&A</a></div>
</nav>
<div></div>
	<div class="fna-lists toggleWrap">
		<ul>
			<li class="toggleEach" item-data="17">
				<div class="list-title toggleBtns">
					<b>Q1. </b>식자재 공급은 어떻게 이루어지나요?
				</div>
				<div class="toggle-box toggleBox">
					LEAF코리아 본부 및 본부에서 지정한 업체에서 공급하고 있습니다.<br />점포에 대한 표준화를 위해 거래업체를 지정하여
					운영하는 만큼 지정업체는 반드시 해당업체와 거래하여야 하는 것이 가맹계약의 필수 조건입니다.<br />
					<br />또한 통합물류시스템을 활용하고 있으며, 외식브랜드는 주3회 배송 (월·수·금 혹은 화·목·토)입니다. (도서
					산간 지역 제외) 
				</div>
			</li>
			<li class="toggleEach" item-data="16">
				<div class="list-title toggleBtns">
					<b>Q2. </b>매장 직원 구인은 어떻게 하며, 점포 직원 수는 얼마나 필요한가요?
				</div>
				<div class="toggle-box toggleBox">
					점주가 직접 구직 사이트 등을 통해 구인하셔야 하며, 직원 수는 점포의 구조/매출액/영업시간에 따라 달라집니다.<br />
					<br />가맹계약 완료 후에는 본사에서 아르바이트 구인 사이트 코드를 무료로 오픈해 드립니다. 해당 코드로 직원 구인을
					진행하실 수 있습니다.
				</div>
			</li>
			<li class="toggleEach" item-data="15">
				<div class="list-title toggleBtns">
					<b>Q3. </b>본사에서 점포 입지 선정을 도와주시나요?
				</div>
				<div class="toggle-box toggleBox">
					특정 지역 및 상권에 대한 적극적인 추천은 하지 않는 것을 원칙으로 하고 있으며, 희망점포를 예비점주가 직접 확인/조사
					후, 브랜드담당에게 통보하셔야 합니다.<br />
					<br />해당 상권 및 점포가 선택하신 브랜드에 맞는지 판단하여, 예비점주님과 점포 선정을 함께 진행합니다. 또한
					예비점주님께 브랜드별 상권 및 점포 선정에 관한 가이드를 전달 드리고 있습니다.
				</div>
			</li>
			<li class="toggleEach" item-data="14">
				<div class="list-title toggleBtns">
					<b>Q4. </b>점포선정부터 오픈까지 기간은 얼마나 걸리나요?
				</div>
				<div class="toggle-box toggleBox">
					브랜드 및 점포 규모·점포 특성에 따라 다소 차이가 발생할 수 있지만, 점포 선정 후 평균적으로 6~8주의 기간이
					소요됩니다.<br />이 기간 동안 직원 구인, 본사 교육, 인테리어 공사, 인허가 및 관련 제반 법규 사항 처리 등이
					이루어집니다.
				</div>
			</li>
			<li class="toggleEach" item-data="13">
				<div class="list-title toggleBtns">
					<b>Q5. </b>매장 오픈 후 사후관리는 어떻게 이루어지나요?
				</div>
				<div class="toggle-box toggleBox">
					담당 슈퍼바이저의 방문과 경영 지도를 통해 가맹점 관리와 매출 증가 위한 사후관리가 이루어지고 있습니다. <br />
					<br />또한 본사는 시즌별 신제품 개발, 마케팅, 이벤트 등을 진행하고 있으며, 정기적인 모니터링을 통해 매출 및
					수익 증대 방안을 제시하고 있습니다.<br />
					<br />점주님들의 이해를 돕기 위한 점주간담회도 정기적으로 진행 중입니다.
				</div>
			</li>
			<li class="toggleEach" item-data="12">
				<div class="list-title toggleBtns">
					<b>Q6. </b>매장의 매출과 수익률은 어느 정도인가요?
				</div>
				<div class="toggle-box toggleBox">
					매출과 수익률은 점포의 입지 조건, 운영 형태에 따라 차이가 있습니다.<br />
				</div>
			</li>
			<li class="toggleEach" item-data="11">
				<div class="list-title toggleBtns">
					<b>Q7. </b>오픈 가능한 평수 또는 층수에 제한이 있나요?
				</div>
				<div class="toggle-box toggleBox">
					컨셉과 상권에 따라 최소 평수와 층수가 달라집니다.<br />
					<br />예를 들어, 기본 점포는 1층, 2층 출점이 가능하며 최소 평수는 30평 이상입니다. 소형 점포의 경우는 1층만
					가능하며 최소 평수는 8평입니다.<br />
					<br />자세한 내용은 창업문의를 남겨주시면 각 브랜드 담당자를 통해 상담받으실 수 있습니다.
				</div>
			</li>

		</ul>
	</div>
	<%@ include file="/inc/bottom3.jspf" %>
</body>
</html>