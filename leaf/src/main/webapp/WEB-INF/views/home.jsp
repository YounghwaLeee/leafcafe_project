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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">


<style>
body, html {
	height: 100%;
	margin: 0; /*스크롤을 없애줌*/
}

body { overflow-x: hidden; }

p{
font-family: 'Noto Sans KR';
}
.center {
	width: 1100px;
	height: 300px;
	display: flex;
	align-items: center; /*div박스들 축중앙으로*/
	justify-content: center; /*위치한 자리에서 가운데정렬*/
	margin: 0 auto;
	position: absolute;
	top: 30%;
	left: 22%;
}

.one, .two, .three, .four { /*로딩할때 leat 글씨 날라오게 하는거.*/
	margin-left: 150px;
	margin-right: 150px;
	font-size: 8rem;
	opacity: 0;
	color: rgb(0, 163, 239);
}

.main {
	display: none;
	clip-path: circle(200% at 500px 500px); /*끝난다음에 여기서 실행*/
	animation-duration: 2.5s;
	animation-name: slideDown;

}

@keyframes slideDown {
from { clip-path:circle(0% at 50% 500px);}
70%{clip-path:circle(70% at 50% 500px);}
to {clip-path: circle(100% at 50% 500px);}
}


section { /*section전부다 적용된거*/
	position: relative;
	width: 100%;
	height: 900px;
	z-index: 5;
}
.section1{
	    height: 940px;
}
.section3{
	background: #F5F0E9;
}

.sort {/*정렬div */
	width: 80%;
	height: 820px;
	margin: 0 auto;
	/*background-color:blue;*/
	display: flex;
}


.write {
	width: 30%;
	/*background-color:green;*/
	height: 820px;
	padding-top: 9%;
}
.write>h1{
	font-size: 3.5rem;
    font-family: 'Signika Negative';
    margin-bottom: .5rem;
    font-weight: 600;
    line-height: 1.4;
}
.write>p{
	font-size: 1.2rem;
    font-weight: 600;
    line-height: 1.7;
    margin-bottom: 3rem;
    }
.write>a:hover{
	text-decoration: none;
}

.menubtn { /*메뉴 안에 색깔 변하는거*/
	width: 345px;
	height: 65px;
	padding-left: 30px;
	background: white;
	transition: 0.25s;
	border: 1px solid black;
    line-height: 60px;
    font-size: 1rem;
    font-weight: 600;
}

.menubtn:hover { /*마우스 오버시 메뉴색깔 분홍색으로 변하는거*/
	box-shadow: inset 25em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);
	padding-left: 32px;
}

.img { /*이미지 들어가는div*/
	/* 	img div */
	width: 70%;
}



.slideimg { /*앞에 이미지 나오는div relative로 포지션 잡아줌. 글씨 나오게 하기 위해서 z index로 5*/
	width: 600px;
	height: 600px;
	border-radius: 150px;
	margin: 14% 0% 0 45%;
	position: relative;
	overflow: hidden;
	z-index: 5;
	margin-left:80%;
}

.leaf {
	font-size: 12em; /*이미지 앞에 글씨*/
	color: white;
	position: absolute;
	z-index: 15;
	left: 24%;
	top: 22%;
	opacity: 0.5;
}

.hiddenimg { /*이미지 슬라이더 숨긴div*/
	width: 3691px;
	height: 600px;
	overflow: auto;
	display: flex;
	position: relative;
}

.hiddenimg>img { /*이미지들 슬라이더 넓이 높이*/
	height: 600px;
}

.circleimg {/*원통이미지*/
	
	position: absolute;
	overflow: hidden;
}

.circleimgright{/*원통이미지*/
	width: 400px;
	height: 400px;
	border-radius: 100%;
	top: 8%;
	right: 70%;
}
.circleimgleft{/*사각이미지*/
	width: 900px;
	bottom: 10%;
	left: 0%;
}
.circleimgleft>img{
width:900px;
}

.circleimgright>img{/*원통이미지*/
	width: 400px;
	margin-top: -47px;
}

.circleimg>img:hover {
	cursor: pointer;
	transform: scale(1.2); /* 마우스 오버시 이미지 크기를 1.1 배만큼 확대시킨다. */
	-o-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-webkit-transform: scale(1.2);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
	transition: all 0.3s ease-in-out;
}

.circleimg>img:not(:hover) {
	cursor: pointer;
	transform: scale(1); /* 마우스 오버시 이미지 크기를 1.1 배만큼 확대시킨다. */
	-o-transform: scale(1);
	-moz-transform: scale(1);
	-webkit-transform: scale(1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
	transition: all 0.3s ease-in-out;
}
span{
	display: inline-block;
	margin: 0 -.075em;
	animation: loading .7s infinite alternate;
}

.loading span:nth-child(2) {
	animation-delay: .1s;
}

.loading span:nth-child(3) {
	animation-delay: .2s;
}

.loading span:nth-child(4) {
	animation-delay: .2s;
}

.loading span:nth-child(5) {
	animation-delay: .2s;
}

.loading span:nth-child(6) {
	animation-delay: .2s;
}

@keyframes loading { 
0% {transform: scale(1);}
100%{transform:scale(0.8);}
}
.video{
	position:absolute;
	left:0;
	width:100%;}
.comment{
	position: absolute;
    top: 28%;
    right: 8%;
    z-index: 9;
    color: white;
    font-weight: bold;
    line-height: 50px;
}
.comment>h1{
font-size: 3rem;
    font-family: 'Signika Negative';
    margin-bottom: .5rem;
    font-weight: 900;
    line-height: 1.4;
    }
    #video_area {
  padding: 0;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  position: absolute;
}
#background_video {
    z-index: -1;
    width: 100vw;
    position: absolute;
    top: -260px;
}
.posi{
position: absolute;
    right: 0%;
    }
</style>
</head>
<body>

<div class="center">
	<div class="one">l</div>
	<div class="two">e</div>
	<div class="three">a</div>
	<div class="four">f</div>
</div>
<div class="main">
<%@ include file="/inc/top.jspf" %>	
	<div class="comment"><h1>누구나<br/>마음편히 <br/>마실 수 있게</h1></div>
	<section class="section1"> <!-- 나중에 이미지 들어갈 곳 -->
	 	<div id="video_area">
	 		<video id="background_video" autoplay loop muted class="video">
				<source src="img/latte.mp4" type="video/mp4"/>
			</video>
		</div>
	</section>


	<section class="section2">
		<div class="sort"><!-- 정렬해주는거 -->
			<div class="write">
				<!-- 왼쪽 글자들 들어가는 div 넓이 30 -->
				<h3>
					<span>B</span> <span>a</span> <span>r</span> <span>i</span> <span>s</span>
					<span>t</span> <span>a</span>

				</h3>
				<h1>
					세상의<br /> 모든 바리스타
				</h1>
				<p>
					leaf에 오시면 <br /> 누구나 언제 어디서든<br /> 최고의 커피를 즐길 수 있습니다
				</p>
				<a href="/myapp/menu_Beverage"><div class="menubtn">COFFEE</div></a>
				<!-- 효과넣어줄거 -->
			</div>

			<div class="img">
				<!-- 이미지 슬라이더 들어가는div 넓이 600 -->
				<div id="slideimg" class="slideimg">
					<!-- 보더레디오스 적용한거 이미지 600사이즈 -->
					<div class="hiddenimg">
						<!-- 뒤에 가려지는 div -->
						<img src="img/br.jfif" /><img src="img/1.jpg" /><img
							src="img/hand.jfif" /><img src="img/baristro.jpg" /><img
							src="img/4.jpg" />

					</div>
					<div class="leaf">leaf</div>
					<!-- 얘 빼줘야돼~~ 앞에 나오는leaf-->
				</div>

			</div>
	</section>
	<section class="section3">
		<div class="sort"><!-- 정렬해주는거 -->
			<div class="write posi">
				<h3>
					<span>V</span> <span>I</span> <span>S</span> <span>I</span> <span>O</span>
					<span>N</span>
				</h3>
				<h1>
					당신과 행복한<br />일상을 함께
				</h1>
				<p>
					일상의 즐거움을 <br />창조하는 leaf<br /> 커피에 대한 모든 서비스를 제공합니다.
				</p>
				<a href="/myapp/membership"><div class="menubtn" style="background: #F5F0E9;">MEMBERSHIP</div></a>
			</div>


			<div class="img">
				<div class="circleimg circleimgleft">
					<img src="https://www.baristapaulbassett.co.kr/images/society/introductionVisual.jpg" />
				</div>
				<div class="circleimg circleimgright">
					<img src="img/cute-cafe.jpg" />
				</div>
			</div>
		</div>

	</section>
	<%@ include file="/inc/bottom3.jspf" %>
</div>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/ScrollTrigger.min.js"></script>
<script src="http://www.google.com/jsapi"></script>
<!-- load JQuery and UI from Google (need to use UI to animate colors) -->
<script type="text/javascript">
	google.load("jqueryui", "1.5.2");
</script>

<script>


	$(function() {/*메뉴바 전체가 나오는거*/
		$('#sec2-1span').on({ //이벤트가 발생하는 주체 
			mouseenter : function() {
				$(this).stop().animate({
					backgroundColor : '#4E1402'
				}, 300);
			},
			mouseleave : function() {
				$(this).stop().animate({
					backgroundColor : '#943D20'
				}, 100);
			}
		});
	});
	$(function slide() {
		$('.hiddenimg').animate({marginLeft:"-3091px"},10000)
		.animate({marginLeft:"0px"},0,slide);
	});
		
$(()=>{ /*맨처음 글자 날라오는 애니메이션*/
            $('.one').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"9rem"},500)
            .delay(500).animate({marginLeft:"150px",marginRight:"150px" ,opacity:0,fontSize:"14rem"},300);
            $('.two').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"9rem"},500)
            .delay(500).animate({marginLeft:"150px",marginRight:"150px" ,opacity:0,fontSize:"14rem"},300);
            $('.three').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"9rem"},500)
            .delay(500).animate({marginLeft:"150px",marginRight:"150px" ,opacity:0,fontSize:"14rem"},300);
            $('.four').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"9rem"},500)
            .delay(500).animate({marginLeft:"150px",marginRight:"150px" ,opacity:0,fontSize:"14rem"},300);
            
            $('.main')
            .delay(1300)
            .queue(function (next) { 
            	$(this).css('display', 'block'); 
            });
});
	
$(window).scroll(function() {
	if(window.scrollY > 400) {
	 	$('.slideimg').animate({marginLeft:'40%'},1500);
	 }
	 if(window.scrollY > 1300) {
		 	$('.circleimgright').animate({right:'40%'},1500);
		 }
	 if(window.scrollY > 1400) {
		 	$('.circleimgleft').animate({left:'13%'},3000);
		 }
});
         
</script>






</body>
</html>