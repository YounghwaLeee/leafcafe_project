<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@200&display=swap" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	font-family: 'Hahmlet';
}

h1 {
clear:both;
	margin: 5px 0;
	font-size: 1.3rem;
	font-weight: none;
	font-family: 'Hahmlet';
}

h2 {
	font-size: 1.875rem;
	line-height: 120%;
	font-family: 'Malgun Gothic';
	width: 75%;
	margin: 50px auto;
}

.top {
	position: relative;
	background:
		url(img/Coffee_Drink_Food_Theme_HD_Desktop_Wallpaper_16_1366x768.jpg)
		80% 50% no-repeat;
	height: 450px;
	background-size: cover;
}

section {
	height: 900px;
	width: 100%;
	position: relative;
	font-size: 1rem;
}
.sectionLast{
	height: 961px;
}

.text {
	position: absolute;
	right: 13%;
	top: 24%;
	font-size: 3rem;
	color: white;
	font-family: 'Do Hyeon';
}

p {
	color: rgb(0, 163, 239);
	font-size: 4rem;
	border-bottom: 1px solid rgb(0, 163, 239);
	margin: 0;
	font-family: 'Do Hyeon';
}

.container li {
	height: 285px;
	margin: 0 6px 12px;
	padding: 0px 12px;
	width: calc(20% - 12px);
	float: left;
}

.container ul {
	width: 100%;
	list-style: none;
	margin: 0 auto;
}

dt {
	margin-bottom: 1.3rem;
	font-size: 1.15rem;
	font-weight: 500;
	color: rgb(0, 163, 239);
	font-family: 'gothic';
}

dd {
	margin-left: 0;
	margin-bottom: 1.5rem;
	letter-spacing: -0.25px;
	font-size: 0.937rem;
	line-height: 150%;
	font-family: 'Hahmlet';
	font-weight: 600;
}

.msg_box {
	width: 75%;
	margin: 20px auto;
	padding: 28px 24px;
	border: 1px solid rgb(0, 163, 239);
	color: rgb(0, 163, 239);
}

.msg_box>p {
	font-size: 0.937rem;
	border-bottom: none;
	font-family: 'Malgun Gothic';
	font-weight: 600;
}
.condition>li{ 
	height:120px;
	width:30%;
	border-bottom: solid 1px rgb(0, 163, 239);
	margin:0px;
	padding: 20px 12px;
    
}
.condition>li:nth-child(2n){width:60%;
    font-weight: 600;} 
.condition>li:nth-child(2n-1){
	font-size:1.7rem;
	color: rgb(0, 163, 239);
	font-family: 'Do Hyeon';
    text-align: center;
    line-height: 80px;
	} 
	header img{width:100%;}
	header{height:330px;overflow:hidden;}
	#headerText{position:relative;top:-100px;left:755px;font-size:3em;color:white;opacity:0.5}
#detailMenu{display:flex;justify-content:center;width:100%;border-bottom:1px solid gray;}
	#detailMenu>div{padding:15px 40px;}
	#menu2{border-bottom:4px solid rgb(0, 163, 239);}
	nav a{color:#62605F;}
	.title{font-size:2.5em;color:#382E2C;text-align:center;padding:40px 0 20px 0;border-bottom:1px solid lightgray; padding-top: 130px;
}
.custom-shape-divider-bottom-1634814355 {
    position: absolute;
    top:360px;
    left: 0;
    width: 100%;
    overflow: hidden;
    line-height: 0;
    transform: rotate(180deg);
}

.custom-shape-divider-bottom-1634814355 svg {
    position: relative;
    display: block;
    width: calc(131% + 1.3px);
    height: 90px;
}

.custom-shape-divider-bottom-1634814355 .shape-fill {
    fill: #FFFFFF;
}
</style>
<script>
$(()=>{	
	$("#headerText").animate({
  	  top: "-418px", opacity:1
  	  }, 1200,);
});
</script>
</head>
<body>
<%@ include file="/inc/top.jspf" %>
<header>
	<img src="	https://www.baristapaulbassett.co.kr/images/whatsnew/classInfoVisual.jpg"/>
	<span id="headerText">Franchise Infomation</span>
</header>
<div class="custom-shape-divider-bottom-1634814355">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
        <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
        <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
        <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
    </svg>
</div>
<nav id="detailMenu">
	<div id="menu1"><a href="/myapp/storemap">STORE</a></div>
	<div id="menu2"><a href="/myapp/franchiseInfo">INFORMATION</a></div>
	<div id="menu3"><a href="/myapp/openRequest">REQUEST</a></div>
	<div id="menu4"><a href="/myapp/franchiseQuestion">Q&A</a></div>
</nav>
	<div class="container">
		<section>
			<div class="title">창업 순서</div>
			<ul>
				<li><p>1</p>
					<dl>
						<dt>창업설명회</dt>
						<dd>가맹지원서 및 상권조사표 <br/>작성</dd>
					</dl></li>
				<li><p>2</p>
					<dl>
						<dt>점포문의 및 본부확인</dt>
						<dd>
							상권 및 입지확인<br />
							<br />수도권:약 1주<br />지방:약 2주 소요
						</dd>
					</dl></li>
				<li><p>3</p>
					<dl>
						<dt>본사 점주 승인</dt>
						<dd>
							LEAF 본사 검토 후<br />가맹점 개설 여부 결정<br />
							<br />정보공개서, 가맹계약서<br />메일로 발송/확인
						</dd>
					</dl></li>
				<li><p>4</p>
					<dl>
						<dt>점포 개설 협의</dt>
						<dd>
							인테리어 및 시설공사 등<br />점포 개설 과정 협의
						</dd>
					</dl></li>
				<li><p>5</p>
					<dl>
						<dt>당사 계약 체결</dt>
						<dd>
							최초 2년 계약, 이후 <br />1년 단위 재계약<br />임대차 계약 후 가맹 계약 체결
						</dd>
					</dl></li>
				<li><p>6</p>
					<dl>
						<dt>인테리어 & 시설공사</dt>
						<dd>
							약 3주 내외 소요, 현장 상황에<br />따라 변동가능
						</dd>
					</dl></li>
				<li><p>7</p>
					<dl>
						<dt>교육</dt>
						<dd>
							점포 포함 최소 2명,<br />교육 기간 최소 14일<br />
							<br />점주1:14일<br />직원2:14일(테스트 미통과 or<br />교육 불성실 시 재교육)
						</dd>
					</dl></li>
				<li><p>8</p>
					<dl>
						<dt>개점준비 & 가오픈</dt>
						<dd>
							운영 시뮬레이션을 통한<br />오픈 준비사항 최종 점검
						</dd>
					</dl></li>
				<li><p>9</p>
					<dl>
						<dt>개점</dt>
						<dd>
							가맹점 정식 오픈 및 <br />인터넷 매장 정보등록
						</dd>
					</dl></li>
				<li><p>10</p>
					<dl>
						<dt>사후 관리</dt>
						<dd>
							관리 본사 점검팀 순회를 통해<br />주기적인 매장 점검
						</dd>
					</dl></li>
			</ul>
		</section>
		<div class="msg_box">
			<p>본사 점검팀 순회를 통해 주기적인 매장 점검</p>
			<p>* 가맹 계약 후 최소 60일~90일 이후 오픈</p>
			<p>* 홈페이지 내 창업문의를 통해 본사와 상담 후 참석 및 가맹지원서 작성/제출하여야만 창업 진행 가능</p>
			<p>* 타겟 고객층에 적합한 입지를 선정/통보하여 본부의 승인을 받고 임대차/가맹 계약을 체결하여야 하며, 점주
				본인이 반드시 교육을 이수해야 함</p>
			<p></p>
		</div>
		<section class="sectionLast">
			<div class="title">창업 조건</div>
			<ul class="condition">
				<li style="line-height: 150px;height: 150px;">브랜드 컨셉</li><li style="line-height: 25px;height: 150px;">좋은 품질의 원두커피를 합리적인 가격으로 판매<br/>고품질/합리적인 가격, 고회전<br/>젊은 층에 어필할 수 있는 빽다방 고유의 메뉴<br/>타 브랜드에 비교하여 10% 이상의 대용량 제공</li>
				<li>타겟 고객층</li><li>남녀노소 구분 없이 다양함</li>
				<li>타겟 입지</li><li>역세권/대학가/Office 등 배후지 및 유동인구가 풍부한 입지 (버스정류장, 횡단보도, 퇴근 동선 가정)</li>
				<li>필요 면적(전용)</li><li>1층, 8평 이상(전용), 식자재 저장 등을 감안한 추가 면적 필요</li>
				<li>주요 메뉴</li><li>아메리카노, 원조커피, LEAF엔나, 옥수크림, 호두크런치 등</li>
				<li>창업 가능 지역</li><li>서울/수도권, 중부권, 부산/경남권, 대구/경북권, 강원권, 전라권, 제주도</li>
			</ul>
			
		</section>
	</div>
	<%@ include file="/inc/bottom3.jspf" %>
</body>
</html>