<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
	body{margin:0;}
	a:link, a:hover a:visited{text-decoration: none;}
	ul,li{list-style-type: none;padding:0;margin:0;}
	header img{width:100%;height:330px;}
	header{height:330px;}
	#headerText{position:relative;top:-100px;left:800px;font-size:3em;color:white;opacity:0.5}		
	#detailMenu{display:flex;justify-content:center;width:100%;border-bottom:1px solid gray;}
	#detailMenu>div:first-child{padding:15px 53px}
	#detailMenu>div:last-child{padding:15px 28px}
	#detailMenu a{color:#62605F;}
	#menu2{border-bottom:4px solid rgb(0, 163, 239);}
	.container{width:1100px;margin:0 auto;}
	.title{font-size:2.5em;color:#382E2C;text-align:center;padding:40px 0 20px 0;border-bottom:1px solid lightgray}
	.checkBenefit{display:flex;flex-direction:column;align-items:center;padding-bottom:60px;border-bottom:2px solid #382E2C;}
	.checkBenefit>div:first-child{font-size:4em;color:rgb(0, 163, 239);padding:40px 0 5px 0;}
	.checkBenefit>div:nth-child(2){font-size:1.1em;color:#987364}
	.checkBenefit>div:nth-child(3){font-size:1.8em;color:#382E2C;padding:20px 0;}
	.checkBenefit>div:nth-child(4){color:#382E2C;}
	.gradeTable{display:flex;justify-content:space-between;padding:50px 0}
	.gradeTable>ul{border-right:1px solid gray;}
	.gradeTable>ul:first-child{padding-right:50px;}
	.gradeTable>ul:last-child{border:none;}
	.grade{padding-right:13px}
	.grade>ul:first-child, .grade>li:nth-child(2), .grade>li:nth-child(3){text-align:center;}	
	.gradeTable .fa-envira{font-size:3em;}
	.grade>ul:first-child>li:nth-child(2){font-weight:bold;font-size:1.3em;padding:10px 0 40px 0}
	.condition{font-size:1.2em;color:#62605F;}  
	.grade>li:nth-child(3){font-size:3em;padding-bottom:15px}
	.txt1{color:#9B7364;padding-left:4px}
	.txt2{font-size:1.8em;}
	.level{padding-bottom:165px}
	.benefit{display:flex;}
	.benefit>li:first-child{font-size:1.3em;}
	.benefit>li:last-child{padding:0 0 35px 7px}
	.silver> .benefit{color:#B9B9B9}
	.gold> .benefit{color:#BC9F73}
	.platinum> .benefit{color:rgb(0, 163, 239)}
	.care{padding:50px 0 0 0;border-top:2px solid #382E2C;display:flex;padding-bottom:80px;}
	.care>div:first-child{color:#A57346;padding-right:50px;font-weight:bold}
	.care>div:last-child{color:#62605F;font-size:0.9em}
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
	  	  top: "-210px", opacity:0.9
	  	  }, 600,);
	$("#menu1").click(function(){
		$(this).css('border-bottom','4px solid rgb(0, 163, 239)');
		$("#menu2").css('border','none');
	});
	$("#menu2").click(function(){
		$(this).css('border-bottom','4px solid rgb(0, 163, 239)');
		$("#menu1").css('border','none');
	});
});
</script>
</head>
<body>
<%@ include file="/inc/top.jspf" %>
<header>
	<img src="https://www.baristapaulbassett.co.kr/images/menu/subVisual_beverage.jpg"/>
	<span id="headerText">MEMBER GRADE</span>
</header>
<div class="custom-shape-divider-bottom-1634814355">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
        <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
        <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
        <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
    </svg>
</div>
<nav id="detailMenu">
	<div id="menu1"><a href="/myapp/membership">Society</a></div>
	<div id="menu2"><a href="/myapp/memberGrade">회원등급혜택</a></div>
</nav>
<div class="container">
	<div class="title">회원 등급 혜택</div>
	<div class="checkBenefit">
		<div><i class="fab fa-envira"></i></div>
		<div>EXCLUSIVE BENEFITS</div>
		<div><span style="color:rgb(0, 163, 239)">각 등급</span>에 따른 <span style="color:rgb(0, 163, 239)">혜택을</span> 지금 확인 하세요!</div>
		<div>쌓이는 leaf에 따라 회원 등급이 오르고, 혜택 또한 많아집니다.</div>
	</div>
	<div class="gradeTable">
		<ul>
			<ul>
				<li class="txt1">Level</li>
				<li class="txt2 level">등급 기준</li>
			</ul>
			<ul>
				<li class="txt1">Exclusive Benefits</li>
				<li class="txt2">등급 혜택</li>
			</ul>
		</ul>
		<ul class="grade">
			<ul>
				<li><i class="fab fa-envira"></i></li>
				<li>Welcome</li>
			</ul>
			<li class="condition">회원 가입 시</li>
			<li>-</li>
			<ul class="benefit">
				<li><i class="fas fa-user"></i></li>
				<li>멤버십 전용 이벤트 참여</li>
			</ul>
			<ul class="benefit">
				<li><i class="fas fa-mug-hot"></i></li>
				<li>첫 구매 무료 음료 쿠폰</li>
			</ul>		
		</ul>	
		<ul class="grade silver">
			<ul>
				<li><i class="fab fa-envira" style="color:#B9B9B9"></i></li>
				<li style="color:#B9B9B9">Silver</li>
			</ul>
			<li class="condition">leaf 5개 적립 시</li>
			<li style="color:#B9B9B9">-</li>
			<ul class="benefit">
				<li><i class="fas fa-user"></i></li>
				<li>멤버십 전용 이벤트 참여</li>
			</ul>
			<ul class="benefit">
				<li><i class="fas fa-mug-hot"></i></li>
				<li>leaf 8개 적립 무료<br/> 음료 쿠폰</li>
			</ul>		
		</ul>
		<ul class="grade gold">
			<ul>
				<li><i class="fab fa-envira" style="color:#BC9F73"></i></li>
				<li style="color:#BC9F73">Gold</li>
			</ul>
			<li class="condition">leaf 10개 적립 시</li>
			<li style="color:#BC9F73">-</li>
			<ul class="benefit">
				<li><i class="fas fa-user"></i></li>
				<li>멤버십 전용 이벤트 참여</li>
			</ul>
			<ul class="benefit">
				<li><i class="fas fa-mug-hot"></i></li>
				<li>leaf 12개 적립 무료<br/> 음료 쿠폰</li>
			</ul>
			<ul class="benefit">
				<li><i class="fas fa-birthday-cake"></i></li>
				<li>생일 축하 무료 음료 쿠폰</li>
			</ul>
			<ul class="benefit">
				<li><i class="fas fa-gift"></i></li>
				<li>프로모션 시<br/>다양한 혜택 제공</li>
			</ul>		
		</ul>
		<ul class="grade platinum">
			<ul>
				<li><i class="fab fa-envira" style="color:rgb(0, 163, 239)"></i></li>
				<li style="color:rgb(0, 163, 239)">Platinum</li>
			</ul>
			<li class="condition">leaf 20개 적립 시</li>
			<li style="color:rgb(0, 163, 239)">-</li>
			<ul class="benefit">
				<li><i class="fas fa-user"></i></li>
				<li>멤버십 전용 이벤트 참여</li>
			</ul>
			<ul class="benefit">
				<li><i class="fas fa-mug-hot"></i></li>
				<li>leaf 12개 적립 무료<br/> 음료 쿠폰</li>
			</ul>
			<ul class="benefit">
				<li><i class="fas fa-birthday-cake"></i></li>
				<li>생일 축하 무료 음료 쿠폰</li>
			</ul>
			<ul class="benefit">
				<li><i class="fas fa-gift"></i></li>
				<li>프로모션 시<br/>다양한 혜택 제공</li>
			</ul>	
			<ul class="benefit">
				<li><i class="fas fa-ticket-alt"></i></li>
				<li>행사참여권</li>
			</ul>	
		</ul>
	</div>
	<div class="care">
		<div>유의사항</div>
		<div>
			-첫 구매 무료 음료 쿠폰: 신규 회원에게 1회만 발행되며 재가입 시에는 발행되지 않습니다.<br/><br/>
			-leaf 8개, 12개 적립 무료 음료 쿠폰: leaf 8개, 12개 적립 시 다음 날 발행됩니다.<br/><br/>
			-생일 축하 무료 음료 쿠폰: 골드, 플래티넘 회원님 대상으로 등록된 생일 7일 전에 발행됩니다.<br/>
			<span style="color:#969696">(생일 전, 후 7일 이내에 골드/플래티넘 등급에 진입한 경우 진입 다음 날 생일 쿠폰이 발행됩니다.)</span><br/><br/>
			-플래티넘 등급은 조건이 충족된 다음 날부터 적용되며 1년간 유지됩니다.<br/><br/>
			-leaf의 유효기간은 1년입니다.<br/>
		</div>
	</div>
</div>
<%@ include file="/inc/bottom.jspf" %>
</body>
</html>