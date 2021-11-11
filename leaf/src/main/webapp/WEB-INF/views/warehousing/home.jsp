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
	z-index: 100;
	top: 30%;
	left: 20%;
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
	height: 1100px;
	z-index: 5;
}

.sort {/*정렬div */
	width: 80%;
	height: 1100px;
	margin: 0 auto;
	/*background-color:blue;*/
	display: flex;
}


.write {
	width: 30%;
	/*background-color:green;*/
	height: 1100px;
	padding-top: 20%;
}


.menubtn { /*메뉴 안에 색깔 변하는거*/
	width: 300px;
	height: 50px;
	padding: 5px;
	font-size: 1.5rem;
	font-weight: bold;
	background: white;
	color: rgb(0, 163, 239);
	transition: 0.25s;
	border: 1px solid black;
}

.menubtn:hover { /*마우스 오버시 메뉴색깔 분홍색으로 변하는거*/
	box-shadow: inset 12.5em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);
}

.img { /*이미지 들어가는div*/
	/* 	img div */
	width: 70%;
}



.slideimg { /*앞에 이미지 나오는div relative로 포지션 잡아줌. 글씨 나오게 하기 위해서 z index로 5*/
	width: 700px;
	height: 700px;
	border-radius: 60px;
	margin: 15% 20% 0 25%;
	position: relative;
	overflow: hidden;
	z-index: 5;
}

.leaf {
	font-size: 12em; /*이미지 앞에 글씨*/
	color: white;
	position: absolute;
	z-index: 15;
	left: 30%;
	top: 25%;
	opacity: 0.5;
}

.hiddenimg { /*이미지 슬라이더 숨긴div*/
	width: 3500px;
	height: 700px;
	display: flex;
	position: relative;
}

.hiddenimg>img { /*이미지들 슬라이더 넓이 높이*/
	width: 700px;
	height: 700px;
}

.circleimg {/*원통이미지*/
	width: 500px;
	height: 500px;
	border-radius: 100%;
	overflow: hidden;
}

.circleimgright{/*원통이미지*/
	
	position: absolute;
	bottom: 5%;
	right: 10%;
	
}

.circleimg>img{/*원통이미지*/
	width: 500px;
	height: 500px;
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

.sec4-2-1>img{
	width:300px;
	height:300px;
	position: relative;
	top:200px;
	left:100px;

}

.section5{
	background-color:pink;

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

@keyframes loading { 0% {
	transform: scale(1);
}
100%{transform:scale(0.8);


}
}
/*스크롤이벤트*/
.section4 { width: 250%; height: 100%; display: flex; flex-wrap: nowrap; }
.section01, .section02 { background: orange;}


#img1{
position: absolute;
top:100px;
left:300px;
width:600px;
height:600px;
}

#img2{
position: absolute;
top:500px;
left:1500px;
width:500px;
height:500px;
border-radius: 20%;
}
#img3{
position: absolute;
top:100px;
left:200px;
width:600px;
height:600px;
border-radius: 70%;

}

#img4{
position: absolute;
top:100px;
left:1000px;
width:600px;
height:600px;


}




.section01wirte{
	position: fixed;
	top:0px;
	left:0px;
}
.video{
	position:absolute;
	left:0;
	width:100%;}
.comment{
	position: absolute;
    top: 35%;
    right: 8%;
    z-index: 15;
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
	
	<div class="comment"><h1>누구나<br/>마음편히 <br/>마실 수 있게</h1></div>
	<section class="section1"> <!-- 나중에 이미지 들어갈 곳 -->
	 <video autoplay loop muted class="video">
				<source src="img/mixkit-latte-art-810.mp4" type="video/mp4"/>
			</video>
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
					left에 오시면 <br /> 누구나 언제 어디서든<br /> 최고의 커피를 즐길 수 있습니다
				</p>
				<a href="#"><div class="menubtn">menu</div></a>
				<!-- 효과넣어줄거 -->
			</div>

			<div class="img">
				<!-- 이미지 슬라이더 들어가는div 넓이 70 -->
				<div id="slideimg" class="slideimg">
					<!-- 보더레디오스 적용한거 이미지 500사이즈 -->
					<div class="hiddenimg">
						<!-- 뒤에 가려지는 div -->
						<img src="img/br.jfif" /><img src="img/1.jpg" /><img
							src="img/hand.jfif" /><img src="img/2.jpg" /> <img
							src="img/4.jpg" />

					</div>
					<div class="leaf">leaf</div>
					<!-- 얘 빼줘야돼~~ 앞에 나오는leaf-->
				</div>

			</div>
	</section>
	<section class="section3">
		<div class="sort"><!-- 정렬해주는거 -->
			<div class="write">
				<h3>
					<span>V</span> <span>I</span> <span>S</span> <span>I</span> <span>O</span>
					<span>N</span>
				</h3>
				<h1>
					행복한<br />일상을 함께
				</h1>
				<p>
					일상의 즐거움을 <br />창조하는<br /> 선진기업
				</p>
				<a href="#"><div class="menubtn">menu</div></a>
			</div>


			<div class="img">
				<div class="circleimg">
					<img src="img/br.jfif" />
				</div>
				<div class="circleimg circleimgright">
					<img src="img/beanjpg.jpg" />
				</div>
			</div>
		</div>

	</section>
	
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
		$('.hiddenimg').animate({marginLeft:"-2000px"},7000)
		.animate({marginLeft:"0px"},0,slide);
	});
		
$(()=>{ /*맨처음 글자 날라오는 애니메이션*/
            $('.one').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"5rem"},500)
            .delay(1000).animate({marginLeft:"150px",marginRight:"150px" ,opacity:0,fontSize:"8rem"},500);
            $('.two').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"5rem"},500)
            .delay(1000).animate({marginLeft:"150px",marginRight:"150px" ,opacity:0,fontSize:"8rem"},500);
            $('.three').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"5rem"},500)
            .delay(1000).animate({marginLeft:"150px",marginRight:"150px" ,opacity:0,fontSize:"8rem"},500);
            $('.four').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"5rem"},500)
            .delay(1000).animate({marginLeft:"150px",marginRight:"150px" ,opacity:0,fontSize:"8rem"},500);
            
            $('.main')
            .delay(2300)
            .queue(function (next) { 
            	$(this).css('display', 'block'); 
            });
});
	

         
</script>






</body>
</html>