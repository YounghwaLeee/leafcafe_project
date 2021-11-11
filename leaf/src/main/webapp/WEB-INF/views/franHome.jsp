<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/franTop.jspf" %>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

<style>
	.bx-wrapper {
		border: none;
		
		}
	a:link, a:hover, a:visited {
		text-decoration: none;
		color: black;
	}
	
	body {
		margin: 0;
		padding: 0;
	}
	
	li, ul {
		margin: 0;
		padding: 0;
		list-style-type: none;
	}
	
	#wrapper {
		width: auto;
		margin: 0 auto;
	}

	.item>img{
    width: 100%;
    border:0;
    margin-top: -150px;
}
/* 이솜이 파일 css */
	#backImg{
	    position: fixed;
	    top:0;
	    z-index: -1;
	    opacity: 0.7;
	    width: 100%;
	    height: 100vh;
	}
	#backImg>img{
	    width: 100%;
	    height: 100vh;
	}
	.bx-default-pager{
	    display: none;
	}
	.bx-wrapper img{
	    -moz-box-shadow: none;
	    -webkit-box-shadow: none;
	    box-shadow: none;
	    border: 0;
	}
	.bx-wrapper{
		height: 920px;
		overflow: hidden;
	}
	.blank{
	    position: relative;
	    z-index: -2;
	    height:25vh;
	    background-color: white;
	    opacity: 0;
	}
	.notice{
	    display: flex;
	    flex: 4 1 0;
	    height: 740px;
	    background-color:white;  /*#e0e5ec;*/
	    
	}
	
	.noticeText_icon{
		font-size: 6em;
	}
	
	.text{
	    color:rgb(0, 163, 239);
	}
	.list{
	    font-size: 1.5em;
	}
	
	
	#main1_imgSlider_Txt>li {
		position: absolute;
		z-index: 10;
		top: -300px;
		right:3%;
		color:white;
		font-size: 2em;
		font-weight:bold;
		margin-left: 200px;
	}
	#imgText{
		font-size:1.5em;
		color:white;
	}
	.noticeText_icon, .blank_text{
		margin-left:-500px;
	}
	.noticeText{
		margin-top:100px;
		font-weight:bold;
	}

	.blank_text1,.blank_text2,.blank_text3{
		position: relative;
	    z-index: 0;
	    color:white;
	    font-size:6em;
	    font-weight:bold;
	    margin-left:-500px;
	    top:-25px;
	}
	.fav_img{
	    top: 1280px;
   		left: 1060px;
	    width: 672px;
	    height: 458px;
	    position: absolute;
	}

	/*불러온 css*/
	:root{
  --background-dark: #2d3548;
  --text-light: rgba(255,255,255,0.6);
  --text-lighter: rgba(255,255,255,0.9);
  --spacing-s: 8px;
  --spacing-m: 16px;
  --spacing-l: 24px;
  --spacing-xl: 32px;
  --spacing-xxl: 64px;
  --width-container: 1200px;
}

*{
  border: 0;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html{
  height: 100%;
  font-family: 'Montserrat', sans-serif;
  font-size: 16px;
}

body{
  height: 100%;
}

.hero-section{
  align-items: flex-start;
  background-image: linear-gradient(15deg, #0f4667 0%, #2a6973 150%);
  display: flex;
  justify-content: center;
  padding: var(--spacing-xxl) var(--spacing-l);
}

.card-grid{
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  grid-column-gap: var(--spacing-l);
  grid-row-gap: var(--spacing-l);
  max-width: var(--width-container);
  width: 100%;
}

@media(min-width: 540px){
  .card-grid{
    grid-template-columns: repeat(2, 1fr); 
  }
}

@media(min-width: 960px){
  .card-grid{
    grid-template-columns: repeat(4, 1fr); 
  }
}

.card{
  list-style: none;
  position: relative;
  border-radius: var(--spacing-l);
}

.card:before{
  content: '';
  display: block;
  padding-bottom: 150%;
  width: 100%;
  
}

.card__background{
  background-size: cover;
  background-position: center;
  border-radius: var(--spacing-l);
  bottom: 0;
  filter: brightness(0.75) saturate(1.2) contrast(0.85);
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
  transform-origin: center;
  trsnsform: scale(1) translateZ(0);
  transition: 
    filter 200ms linear,
    transform 200ms linear;
}

.card:hover .card__background{
  transform: scale(1.05) translateZ(0);
}

.card-grid:hover > .card:not(:hover) .card__background{
  filter: brightness(0.5) saturate(0) contrast(1.2) blur(20px);
}

.card__content{
  left: 0;
  padding: var(--spacing-l);
  position: absolute;
  top: 0;
}

.card__category{
  color: var(--text-light);
  font-size: 0.9rem;
  margin-bottom: var(--spacing-s);
  text-transform: uppercase;
}

.card__heading{
  color: var(--text-lighter);
  font-size: 1.9rem;
  text-shadow: 2px 2px 20px rgba(0,0,0,0.2);
  line-height: 1.4;
  word-spacing: 100vw;
}

</style>
<script>
	$(function (){
	    $('.mainImg').bxSlider({
	        mode:'horizontal', 
	        speed:2000,//변환속도
	        auto:true, //자동시작(true,false)
	        infiniteLoop: true, //반복여부설정(true,false)
	        hideControlOnEnd: true //처음과 마지막에 컨트롤러 표시여부(true, false) infiniteLoop이 있어야함
	
	    });
	    
		//이미지 설명
		$('#main1_imgSlider_Txt').innerfade({
			animationtype : 'fade',
			speed : 2000,
			delay : 500,
			timeout : 5000
		});

		 // 스크롤
		 $(window).scroll(function() {
			 if(window.scrollY > 450) {
				 	$('.blank_text1').animate({marginLeft:'400px'},500);
				 }
			 if(window.scrollY > 420) {
				 	$('.blank_text2').animate({marginLeft:'400px'},1000);
				 }
			 if(window.scrollY > 400) {
				 	$('.blank_text3').animate({marginLeft:'400px'},1500);
				 }
		 });
	});

</script>
</head>
<body>
	 <div class="mainImg">
	 	
        <div class="item">
            <img src="img/coffee9.jpg"/>
        </div>
        <div class="item">
            <img src="img/cafe3.jpg"/>
        </div>
        <div class="item">
            <img src="img/main3.jpg"/>
    	</div>
    </div>
    <div>
		<ul id="main1_imgSlider_Txt">
			<li><span id="imgText">우리의 작은 말과 행동</span><br/>
				 곧 우리의 브랜드가 됩니다</li>
			<li><span id="imgText">고객이 신뢰할 수<br/>있는 품질로</span> <br/>
				사랑받는 브랜드, 존경받는 기업이 됩시다</li>
			<li><span id="imgText">우리가 만드는 <br/>제품과 서비스로</span><br/>
				 고객의 하루를 행복하게 합니다. </li>
			<li><span id="imgText">맛있는 커피와 <br/>최고의 서비스로</span><br/>
				 다시찾고 싶은 휴식공간이 되겠습니다.
			</li>
					
		</ul>
	</div>
    <div class="blank"></div>
    <span class="blank_text1">PICK </span><br/><span class="blank_text2">YOUR</span><br/> <span class="blank_text3">FAVORITE</span>
    <div class="fav_img">
    	<img alt="" src="https://image.istarbucks.co.kr/upload/common/img/main/2021/2021_autumn_fav.png">
    </div>
	<div class="blank"></div>			
<section class="hero-section">
  <div class="card-grid">
    <a class="card" href="#">
      <div class="card__background" style="background-image: url(https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[106509]_20210430111852870.jpg)"></div>
      <div class="card__content">
        <p class="card__category">공지사항</p>
        <h3 class="card__heading">위생점검</h3>
      </div>
    </a>
    <a class="card" href="#">
      <div class="card__background" style="background-image: url(https://image.istarbucks.co.kr/upload/store/skuimg/2021/09/[9200000003490]_20210930200337147.jpg)"></div>
      <div class="card__content">
        <p class="card__category">NEW OPEN</p>
        <h3 class="card__heading">마포점입점</h3>
      </div>
    </a>
    <a class="card" href="#">
      <div class="card__background" style="background-image: url(https://image.istarbucks.co.kr/upload/store/skuimg/2021/03/[9200000003511]_20210322093158370.jpg)"></div>
      <div class="card__content">
        <p class="card__category">EVENT</p>
        <h3 class="card__heading">할로윈이벤트</h3>
      </div>
    </li>
    <a class="card" href="#">
      <div class="card__background" style="background-image: url(https://image.istarbucks.co.kr/upload/store/skuimg/2021/02/[9200000001086]_20210225090838931.jpg)"></div>
      <div class="card__content">
        <p class="card__category">공지사항</p>
        <h3 class="card__heading">교육일정</h3>
      </div>
    </a>
  <div>
</section>
				
             
      
       <!-- background -->
	 <div id="backImg"><img src="https://www.baristapaulbassett.co.kr/images/aboutus/ceo01.jpg"  alt=""></div>
	 <%@ include file="/inc/bottom3.jspf" %>
