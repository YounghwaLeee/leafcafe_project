<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"	rel="stylesheet">
<script src="https://kit.fontawesome.com/a688454d8e.js"crossorigin="anonymous"></script>
<title>LEAF 관리자 페이지</title>

<style>
*{
  font-family: 'Noto Sans KR', sans-serif;
  list-style: none;
  text-decoration: none;
  border-collapse: collapse;
  margin:0px;
  padding: 0px;
  color: #000;
}
body{width:100%;display:inline-grid;/* body 여백으로인해 임시 선언 */}
h1 {font-size: 48px; font-weight: 100;}
button{-webkit-border-radius: 0; border-radius: 0; -webkit-appearance: none; -moz-appearance: none; appearance: none; border:0; background-color:transparent; color:black;}


.changeColor a:hover{text-decoration:none;
		color:rgb(0, 163, 239);
		font-size:1.1em;
		font-family: 'Signika Negative', sans-serif;
}


a{color:black;}

a:hover{
	text-decoration: none;
}
body{margin:0;

}

ul,li{
	list-style:none;
	margin:0;
	padding:0;
}

.login{
	float:right;
	width:50%;
	height:50px;
	
	font-family: 'Signika Negative', sans-serif;
}
.login>ul{
	display:flex;
	justify-content: flex-end;
	font-size:1em;
}
.login li{
	padding: 10px 30px;
}
.logoimg{/*로고이미지*/
	float:left;
	width:120px;
	height:80px;
	margin-top:20px;
	padding-left: 20px;
	
}
#section3{position:relative;height: 584px;}
#section1{position:relative;height: 800px;}
#section2{position:relative;background: rgb(245, 240, 233);}
.logoimg>img{
	width: 100%;
	justify-content: flex-start;
	margin-top: 20px;
    margin-left: 20px;

}
.menuBar{/*menubar div*/
	position:absolute;
	left:15%;
	width:70%;
	margin-top: 75px;
	font-family: 'Signika Negative', sans-serif;
	
}
.main-ul{
	display:flex;
	justify-content:space-around;
	width:100%;
	font-size:1.2em;
	
}
.ulclass{
	display:none;
    margin-top: -16px
}
.ulclass>li{
	margin-top:50px;
	line-height:10px;

}
.select-li{
    width: 25%;
    text-align: center;
}
.select-li>div{width: 160px;
height: 46px;
    margin: 0 auto;
}
.select-li>div:hover{
	border-bottom: 4px solid rgb(0, 163, 239);
}

.header{
	position: relative;
	height:120px;
	z-index: 10;
	border-bottom: 1px solid #ddd;
}
.whitebg{/*마우스 흰색 배경 이벤트*/
	width:100%;
	height:450px;
	position:absolute;
	z-index: 7;
    background-color: white;
    display:none;
}
.menubtn { /*메뉴 안에 색깔 변하는거*/
	width: 345px;
	height: 65px;
	padding-left: 30px;
	background: rgb(245, 240, 233);
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
	/* 드롭다운메뉴 서브메뉴 */
.sublist>li{margin-top: -30px; text-align:center; height:100px;}
.sublist{height:220px; display:none;}
.sublist>li>a{color:black; opacity:0.81;}
/* ===================*/

/* 동영상 */
.jb-box {position: relative; width:99vw; height: 100vh; overflow:hidden; z-index:-1;}
video { width: 100%; position:absolute; top:-111px;}

/* 중단 가맹점현황, 총임직원, 함께하는 회원*/
.amount{
position: absolute;
    z-index: 2;
   top: 380px;
    left: 350px;
    display: flex;
    width: 1200px;
    margin: auto;}
.amount > li {flex: 1; height: 180px;}
.amount > li > div {text-align: center; margin-top:55px; height:57px;}
.amount > li:not(:last-child) > div{border-right:1px solid #E1E1E1;}
.contents1{font-size: 20px; font-weight: lighter;}
.result{margin-bottom:20px;font-weight:600; display:inline-block; font-size:4em;color:rgb(0, 163, 239);}
#sales-container{position:absolute;left: 163px; margin:0 auto;width:800px;top: 60px;}
#sales-count{display:inline-block; width:800px; height:100px; text-align:center; margin-top: 50px; padding-top: 10px;}
#sales-count>span{font-size:2em;}

/*-------------*/

/* 중단 카드슬라이드 */
.container{    top: 310px;position: relative; display: flex; margin: auto;width: 1500px; justify-content: space-between;}
.container .card{position: relative; cursor: pointer; text-align:center; border:none; margin:-135px;}
.container .card .face{width: 300px; height: 200px; transition: 0.5s;}
.container .card .face.face1{position: relative; display: flex; justify-content: center; align-items: center; z-index: 1; transform: translateY(100px);}
.container .card:hover .face.face1{background: rgb(0, 163, 239); transform: translateY(0);}
.container .card .face.face1 .content{opacity: 1; transition: 0.5s; width:300px; height: 200px; text-align:center;}
.container .card:hover .face.face1 .content{transition: 0.5s; background: rgb(0, 163, 239);}
.container .card .face.face1 .content img{width: 100px; height: 100px; padding-top: 24px;}
.container .card .face.face1 .content h3{margin: 10px 0 0; padding: 0; color: #fff; text-align: center; font-size: 1.5em;}
.container .card .face.face2{position: relative; display: flex;background: #fff; padding: 20px; justify-content: center; align-items: center; box-sizing: border-box; box-shadow: 10px 15px 18px rgb(192,192,192); transform: translateY(-100px);}
.container .card:hover .face.face2{transform: translateY(0);}
.container .card .face.face2 .content p{margin: 0; padding: 0;}
.container .card .face.face2 .content a{    display: inline-block;
    margin: 35px 0 0;
    padding: 5px;
    text-decoration: none;
    font-weight: 900;
    color: rgb(0, 163, 239);
    border: 1px solid rgb(0, 163, 239);
    width: 110px;
    height: 48px;
    line-height: 35px;
    border-radius: 2px;
    transition: 0.4s;}
.container .card .face.face2 .content a:hover{box-shadow: inset 8em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);}
.face-bg1{background-image:url('img/springimg.jpg');}
.face-bg2{background-image:url('img/summerimg.jpg');}
.face-bg3{background-image:url('img/autumnimg.jpg');}
.face-bg4{background-image:url('img/winterimg.jpg');}
/*---------------------------*/

/* 중단  NOTICE 슬라이드부   */
.notice-container{width: 100%; height:900px; min-width: 1500px; }
.notice-container .notice{width:1500px; margin:auto; min-width:1400px; position:relative;}
.notice-container .notice:before{content: ""; position: absolute; top: 130px; width: 100%; height: 1px; background-color: #cccccb;}
.notice-top>h1{text-align: center; margin-top:50px; margin-left:100px;}
.notice-top>div {text-align: center; margin-top:5px; margin-left:100px;}
.notice-body{margin-top:75px; position: relative; height: 500px;}
.main-bn {position:absolute; width:100%; height:630px;}
.main-bn > .slider > .slides > .bn {position:absolute; transition:opacity 1s, visibility 1s; background-repeat:no-repeat; background-position:center; background-size:cover;
    top:0; left:0; right:0; bottom:0; opacity:0; visibility:hidden; height:530px; width:60%;}
.main-bn > .slider > .slides > .bn.active {opacity:1; visibility:visible;}
.main-bn > .slider > .slides > .bn > .inner-txt {position:absolute; height:530px; width:500px; left:1000px; color:block; box-sizing:border-box; letter-spacing:0.05rem; display:inline-block;}
.main-bn > .slider > .slides > .bn > .inner-txt > .tt {position: absolute; display: inline-block;top: 110px; height: 50px; width: 500px; text-align:center; font-size: 40px;}
.slider-content{position: absolute; display: inline-block; text-align:center; font-size: 20px; top: 240px; height: 100px; width: 500px;}
.slider{position: relative;}
.main-bn > .slider > .slides > .bn > .inner-txt > .view {position:absolute; display:inline-block; top:420px; left:150px; width:200px; text-align:center; font-size:1.1em; background:rgb(0, 163, 239);}
.main-bn > .slider > .slides > .bn > .inner-txt > div > a {display:block; line-height:45px; transition:color .3s; color:white;}
.main-bn > .slider > .slides > .bn > .inner-txt > div > a:hover {color:red;}
.inner-txt a{
	position:absolute;
	top:390px;
	left:65px; 
}	
.main-bn > .slider > .page-btns {position: absolute; left: 713px; bottom: 55px; width: 200px; top: 550px; height: 50px;}
.main-bn > .slider > .page-btns > .page-btn {position: absolute; display: inline-block; color: black; cursor: pointer; width: 30px; height: 50px; bottom:14px; left:10px;}
.main-bn > .slider > .page-btns > .next-btn {left: 115px;}
.main-bn > .slider > .page-btns > .page-btn > i {position: absolute; display: block; width: 30px; height: 50px; top: 0; font-size: 20px; color: black;}	
.main-bn > .slider > .page-btns > .page-no {position: absolute; top: 3px; left: 43%;}
.main-bn > .slider > .page-btns > .page-no > span {display:inline-block; color:black; font-size:18px;}	
#leaf-left-btn{width:80px; height:60px; transform:scaleX(-1);}
#leaf-right-btn{width:80px;	height:60px;}	

#chat{
	width: 170px;
    height: 80px;
    position: fixed;
    right: 20px;
    top: 785px;
    background: white;
    z-index: 20;
    box-shadow: 1px 1px 1px 1px #ddd;
    border-radius: 60px;
    text-align: center;
    line-height: 80px;
    font-size: 1.2rem;
    font-weight: 600;
}
#chatTab{
	width:391px;
	height: 534px;
	position: fixed;
	right: 20px;
	bottom: 20px;
	background: white;
	z-index: 20;
	border: 1px solid #ddd;
	border-radius: 30px;
	padding:5px 20px;
	display: none;
}
#chatBody{
    height: 480px;
    width: 350px;
        border: none;
	background: lightblue;
	border-radius: 15px;

}
#chatBody::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}

#section3{
background: 	url(img/1i62q22343whvmtlu1C77.jpg);background-position-y: -337px;
height: 818px;
}

.count{
    position: absolute;
    top: 373px;
    left: 350px;
    background: white;
    z-index: 2;
    opacity: 0.8;
    border-radius: 26px;
    height: 260px;
    width: 1200px;
    box-shadow: 1px 1px 1px 1px #ddd;
}
span{
	display: inline-block;
	margin: 0 -.075em;
	animation: loading 1.2s infinite alternate;
	color: white;
    font-size: 2rem;
    margin-right: 13px;
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
100%{transform:scale(0.9);}
}
.chatTitle{
	
    font-size: 1.3rem;
    padding: 0px 8px 5px 7px;
    font-weight: 600;
}
.chatTitle>div{
	float:right;
	color: rgb(0, 163, 239);
}


.logname{
   padding-top:10px;
}

h4{
	font-size: 0.9rem !important;
}
</style>
</head>
<script>

$(function(){/*메뉴바 전체가 나오는거*/
	$('.select-li').on({ //이벤트가 발생하는 주체 
		mouseenter:function(){
			$('.ulclass').css('display','block');
			$('.whitebg').css('display','block');
		},mouseleave:function(){
			$('.ulclass').css('display','none');
			$('.whitebg').css('display','none');
		}
	});
});
	
</script>
<body>
<div id="chat">상담하기</div>
<div id="chatTab">
	<ul>
		<li class="chatTitle">leaf <div id ="chatClose"><svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="InnerIconstyled__Icon-sc-197h5bb-0 jdUMxO FullHeaderstyled__ThemeCloseIcon-sc-1aljhke-10 drXuSo" defaultOpacity="0.6" hoveredOpacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0"><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M16.4818 4.69668L15.3033 3.51817L10 8.82147L4.69671 3.51817L3.5182 4.69668L8.8215 9.99998L3.51819 15.3033L4.6967 16.4818L10 11.1785L15.3033 16.4818L16.4818 15.3033L11.1785 9.99998L16.4818 4.69668Z"></path></svg></div></li>
		<iframe id="chatBody" src="http://192.168.0.45:10077/leafAdmin"><input type="button" value="새 문의하기" onclick="javascript:chat()"/></iframe>
			
	
	
	</ul>
</div>
	<!-- 상단부 -->
	<div class="whitebg"></div>
	

<div class="header">
 <div class="login">
      <ul>
         <li><a href="/myapp/adminHome">본사</a></li>
         <li><a href="/myapp/franHome">가맹점</a></li>
         <c:if test="${logname==null}"><li><a href="/myapp/login">LOGIN</a></li></c:if>
         <c:if test="${logname!=null}"><li><a href="/myapp/logout">LOGOUT</a></li></c:if>
         <div class="logname">${logname}
         <c:if test="${membership==1}">Silver <i class="fab fa-envira" style="color:gray;"></i></c:if>
         <c:if test="${membership==2}">Gold <i class="fab fa-envira" style="color:gold;"></i></c:if>
         <c:if test="${membership==3}">Platinum <i class="fab fa-envira"style="color:blue;"></i></c:if></div>
       
         <c:if test="${logname==null}"><li><a href="/myapp/register">JOIN</a></li></c:if>
         <c:if test="${logname!=null}"><li><a href="/myapp/mypage">마이페이지</a></li></c:if>
         
      </ul>
   </div>
	<!-- <a href="/leaf"><div class="logoimg"><img src="img/leaflogo-removebg-preview.png"/></div></a> -->
	<div class="logoimg"><img src="img/leaflogo-removebg-preview.png" onclick="location.href='/myapp/'"/></div>
	
<div class="changeColor">	
	
	<div class="menuBar">
		<ul class="main-ul">
			
<!---------------------------  -->			
			<li class="select-li"><div><a href="/myapp/menu_Register">SUPERVISE</a></div>
				<ul class="ulclass">
					<li><a href="/myapp/menu_Register">메뉴 관리</a></li>
					<li><a href="<%=request.getContextPath()%>/employeeManagePage">직원 관리</a></li>
					<li><a href="<%=request.getContextPath()%>/partnerManagePage">파트너 관리</a></li>
				</ul>					
			</li>
<!----------------------------------  -->	
			<li class="select-li"><div><a href="/myapp/purchase_Confirm">PRODUCT</a></div>
				<ul class="ulclass">
					<li><a href="/myapp/inventory">재고관리</a></li>
					<li><a href="/myapp/Warehousing_Management">입고관리</a></li>
					<li><a href="/myapp/purchase_Confirm">발주확인</a></li>
				</ul>			
			</li>
<!--------------------------------------------->
			<li class="select-li"><div><a href="/myapp/noticeList">WHAT`S UP</a></div>
				<ul class="ulclass">
					<li><a href="/myapp/adminnoticeMain">NOTICE</a></li>
				</ul>				
			</li>
<!--------------------------------------------->			
			<li class="select-li"><div><a href="/myapp/franchise">FRANCHISE</a></div>
				<ul class="ulclass">
					<li><a href="/myapp/storemap">STORE</a></li>
					<li><a href="<%=request.getContextPath()%>/openQuestionPage">창업 문의 내용</a></li>
					<li><a href="<%=request.getContextPath()%>/adminSalesMainPage">메뉴별 매출 현황</a></li>
				</ul>			
			</li>
			
		</ul>
		
		</div>
</div><!-- changeColor -->		
</div>

<section id='section3'>

    <!-- 중앙부 -->
    <div class="count">
		
	</div>
	<ul class="amount">
			<li>
				<div>
				    <div class="result total-store"></div>
			
				    <div class="contents1">가맹점 현황</div>
			      
			    </div>
			</li>
		  	<li>
			    <div>
			    	<div class="result total-maneger"></div>
			    
			    	<div class="contents1">총 임직원</div>
			    	
			    </div>
		  	</li>
		  	<li>
		    	<div>
			        <div class="result total-member"></div>
			    
			        <div class="contents1">함께하는 회원</div>
			       
		    	</div>
		  	</li>
		</ul>
	
	<div id="sales-container" class="shadow_eff">
		<div id="sales-count">
			
			
			<div style="color:white; font-size:4rem;" class="result total-sale"></div>
			<h2 style="color:white;position: absolute;
    top: 20px;
    left: 200px;"><span>Balance</span> <span>for</span> <span>your</span> <span>Life</span></h2>
		</div>	
	</div>	
</section>
	<!-- 확인 4개버튼 -->	
<section id='section1'> 
 	 <div class="container">
        <div class="card">
            <div class="face face1 face-bg1">
                <div class="content">
                    <img src="img/groupicon.png">
                    <h3>가맹점 확인 </h3>
                </div>
            </div>
            <div class="face face2">
                <div class="content">
                    <p><h4> 전국 가맹점을 검색할 수 있습니다.</h4></p>
                        <a href="/myapp/storemap">Search</a>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="face face1 face-bg2">
                <div class="content">
                       <img src="img/charticon.png">
                        <h3>매출 확인</h3>
                </div>
            </div>
            <div class="face face2">
                <div class="content">
                    <p> <h4>매출을 확인할 수 있습니다.</h4></p>
                        <a href="<%=request.getContextPath()%>/adminSalesMainPage">Search</a>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="face face1 face-bg3">
                <div class="content">
                       <img src="img/stafficon.png">
                       <h3>직원 검색</h3>
                </div>
            </div>
            <div class="face face2">
                <div class="content">
                    <p> <h4>직원을 검색할 수 있습니다.</h4> </p>
                        <a href="/myapp/employeeManagePage">Search</a>
                </div>
            </div>
        </div>
         <div class="card">
            <div class="face face1 face-bg4">
                <div class="content">
                       <img src="img/newsicon.png">
                       <h3> 메인 뉴스 </h3>
                </div>
            </div>
            <div class="face face2">
                <div class="content">
                    <p><h4>관련 뉴스를 확인할 수 있습니다.</h4></p>
                        <a href="/myapp/adminnoticeMain">Search</a>
                </div>
            </div>
        </div>
    </div>

</section>	
	<section id='section2'>
	
	<!-- 홍보물 -->
	<div class="notice-container">
      	<div class="notice">
      		<div class="notice-top">
		        <h1>NOTICE</h1>
		        <div>If you would be loved, love and be lovable</div>
		    </div>
		    <!-- NOTICE 메인부 -->
		    <div class="notice-body">    
			    <div class="main-bn">
			        <div class="slider">
			            <div class="slides">
			                <div class="bn active" style="background-image:url('img/inshop.jpg');">
			                    <div class="inner-txt">
			                        <div class="tt inline-block">마포점 신규인력지원 모집</div>
			                        	<div class="slider-content">
					                        Tough times never last, but tough people do.<br>
					                        자세한 사항은 아래 버튼을 클릭해주세요.
										</div>					                        
			                       		 <a href="/myapp/adminnoticeDetail?no=34&nowpage=1"><div class="menubtn">자세히 보기</div></a>
			                    </div>
			                </div>
			                <div class="bn" style="background-image:url('img/machine.png');">
			                    <div class="inner-txt">
			                        <div class="tt inline-block">홀리데이 커피머신 출시</div>
			                        	<div class="slider-content">	
					                        It is kind of fun to do the impossible.<br>
					                        자세한 사항은 아래 버튼을 클릭해주세요.
					                    </div>    
			                        <a href="/myapp/adminnoticeDetail?no=35&nowpage=1"><div class="menubtn">자세히 보기</div></a>
			                    </div>
			                </div>			                
			                <div class="bn" style="background-image:url('img/bongsa.jpg');">
			                    <div class="inner-txt">
			                        <div class="tt inline-block">해외봉사활동 접수</div>				                        
					                	<div class="slider-content">        
					                        I didn’t get there by wishing for it or hoping for it, but by working for it.<br>
					                        자세한 사항은 아래 버튼을 클릭해주세요.
					                	</div>
			                        <a href="/myapp/adminnoticeDetail?no=33&nowpage=1"><div class="menubtn">자세히 보기</div></a>
			                    </div>
			                </div>				                
			            </div>
			            <div class="page-btns" style="display:none;">
			                <button class="page-btn prev-btn"><i class="xi-angle-left"><img src="img/leaf.gif" id="leaf-left-btn"></i></button>
			                <button class="page-btn next-btn"><i class="xi-angle-right"><img src="img/leaf.gif" id="leaf-right-btn"></i></button>
			                <div class="page-no">
			                    <span class="current-slide-no"></span>
			                    <span class="slash">/</span>
			                    <span class="total-slide-no"></span>
			                </div>
			            </div>
			        </div>
			    </div>    
	      	</div>	
      	</div>
	</div>
	</section>
	<script>
//드롭다운 메뉴창
$('.nav>li:not(.home)').on('mouseenter',function(){
	$('#menu-bg').stop().slideDown();	
	$('.sublist').stop().slideDown();
});
$('#menu-bg').on('mouseleave',function(){
	$(this).stop().slideUp();	
	$('.sublist').stop().slideUp();
});

// 	숫자 증가 카운트
// 가맹점 현황
let tst = '${vo.totalFran}';
$({ val : 0 }).animate({ val : tst }, {
  duration: 5000,
  step: function() {
    var num = numberWithCommas(Math.floor(this.val)); // 소수점 이하 버림
    $(".total-store").text(num);
  },
  complete: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".total-store").text(num);
  }
});

// 총 매출
let tsal = '${vo.totalsales}';
$({ val : 0 }).animate({ val : tsal }, {
  duration: 5000,
  step: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".total-sale").text(num);
  },
  complete: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".total-sale").text(num);
  }
});

// 총 임직원
let tmg = '${vo.totalManage}';
$({ val : 0 }).animate({ val : tmg }, {
  duration: 5000,
  step: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".total-maneger").text(num);
  },
  complete: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".total-maneger").text(num);
  }
});

// 함께하는 회원
let tmb = '${vo.totalRegi}';
$({ val : 0 }).animate({ val : tmb }, {
  duration: 5000,
  step: function() {
    var num = numberWithCommas(Math.floor(this.val));
    $(".total-member").text(num);
  },
  complete: function() { // text(num)사라진 후 수행할 작업
    var num = numberWithCommas(Math.floor(this.val));
    $(".total-member").text(num);
  }
});

// 정규식 사용 -> 천단위를 끊어 , 삽입
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

////////////////////////////////////////////////////////////////////////

// 관리자메인화면 하단 슬라이드
$('.page-btn').click(function(){
    let $clicked = $(this);
    let $slider = $(this).closest('.slider');
    
    let index = $(this).index();
    let isLeft = index == 0;    
    
    let $current = $slider.find(' > .slides > .bn.active');
    let $post;
    
    if ( isLeft ){
        $post = $current.prev();
    }
    else {
        $post = $current.next();
    }    
    
    if ( $post.length == 0 ){
        if ( isLeft ){
            $post = $slider.find(' > .slides >.bn:last-child');
        }
        else {
            $post = $slider.find(' > .slides >.bn:first-child');
        }
    }
    
    $current.removeClass('active');
    $post.addClass('active');
    
    updateCurrentPageNumber();
});

setInterval(function(){
    $('.next-btn').click();
	}, 6000);

// 슬라이더 페이지 번호 지정
function pageNumber__Init(){
    // 전채 배너 페이지 갯수 세팅해서 .slider 에 'data-slide-total' 넣기
    var totalSlideNo = $('.bn').length;
    //console.log(totalSlideNo);
    
    $('.slider').attr('data-slide-total', totalSlideNo);
    
    // 각 배너 페이지 번호 매기기
    $('.bn').each(function(index, node){
        $(node).attr('data-slide-no', index + 1);
    });
};
pageNumber__Init();

// 슬라이더 이동시 페이지 번호 변경
function updateCurrentPageNumber(){
    var totalSlideNo = $('.slider').attr('data-slide-total');
    var currentSlideNo = $('.bn.active').attr('data-slide-no');
    
    $('.total-slide-no').html(totalSlideNo);
    $('.current-slide-no').html(currentSlideNo);
};
updateCurrentPageNumber();

</script>
<script>
	$(()=>{
		$('#chat').click(function(){
			$("#chatTab").css('display','block');
			
		});
		$('#chatClose').click(function(){
			$("#chatTab").css('display','none');
		});
		function chat(){
			console.log('dd');
			
			
		}
	});
</script>
	<%@ include file="/inc/bottom3.jspf" %>
