<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jspf" %>
<style>
	* {
		box-sizing: border-box;/*border포함 250*/
	}
	a:link, a:hover, a:visited {
		text-decoration: none;
		
	}
	ul,li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	.main {
		display: flex;
		flex-direction: column;
		align-items: center;
		
    	
	}
	.menu_title_container {
		display: flex;
		justify-content: center;
		border-bottom: 1px solid gray;
	}
	.menu_bar li{
		margin: 0 40px;
		line-height:60px;
		height:60px;
	    width: 120px;
	    text-align: center;
	}
	.imgwrap {
		width:250px;
		height:250px;
		display: flex;
		justify-content: center;
		overflow: hidden;
		border-radius: 100%;
		margin: 30px;
		position:relative;
	}
	.imgwrap:hover {
		border:3px solid rgb(0, 163, 239);
	}
	#img{
		width:250px;
		height:250px;
		border-radius: 100%;
	}
	.menuList{
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
		width:1250px;
		margin-top:50px;
		margin-bottom: 50px;
	}
	.imgtext{
		text-align:center;
		font-size:1.3em;
	}
	.imgtext2{
		font-size:0.8em;
		color:rgb(0, 163, 239);
	}
	.menu_title_container>li:hover{
		border-bottom:3px solid rgb(0, 163, 239);
		cursor: pointer
	}
	#img:hover{
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
	#img:not(:hover){
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
	
	.new{
		width:50px;
		height:50px;
		border-radius:100%;
		background-color:rgb(0, 163, 239);
		position:relative;
		top: -328px;
    	left: 43px;
   		color:white;
   		line-height:50px;
	    text-align: center;
	}
	.best{
		width:50px;
		height:50px;
		border-radius:100%;
		background-color:rgb(89, 65, 54);
		position:relative;
		top: -328px;
    	left: 43px;
   		color:white;
   		line-height:50px;
	    text-align: center;
	}
  /*head 이미지*/
   header{
   		height:330px;
   		position:relative;
   		}
   #headerText{
   		top:-100px;
   		font-size:3em;
   		color:white;
   		opacity:0.5;
   		text-align:center;
   		position: relative;
   		}
   nav{
   		display:flex;
   		justify-content:center;
   		width:100%;
   		border-bottom:1px solid gray;
   		}
   nav>div{
   		padding:15px 40px;
   		}
	#head_img{
		background-image:url(https://www.baristapaulbassett.co.kr/images/menu/subVisual_coffee.jpg);
		z-index:-1;
		width:100%;
		height:330px;
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
$(function(){
	$("#All").click(function(){
		$(".latte").css('display','block');
		$(".espresso").css('display','block');
		$(".shot").css('display','block');
	});
	
	$("#Shot").click(function(){
		$(".shot").css('display','block');
		$(".latte").css('display','none');
		$(".espresso").css('display','none');
		
	});
	$("#Latte").click(function(){
		$(".latte").css('display','block');
		$(".shot").css('display','none');
		$(".espresso").css('display','none');
	});
	$("#Espresso").click(function(){
		$(".espresso").css('display','block');
		$(".shot").css('display','none');
		$(".latte").css('display','none');
	});
	
	$("#headerText").animate({
	       top: "-195px", opacity:0.9
	       }, 600,);
	
});
</script>
	<header>
		<div id="head_img"></div>
		   <div id="headerText">COFFEE</div>
	</header>
	<div class="custom-shape-divider-bottom-1634814355">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
        <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
        <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
        <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
    </svg>
</div>
	<div class="main">		
		<div class="menu_bar">
			<ul class="menu_title_container">
				<li id="All">All</li>
				<li id="Shot">Coffee</li>
				<li id="Latte">Latte</li>
				<li id="Espresso">Espresso</li>
			</ul>
		</div>
		<div>
			<ul class="menuList">			
				<c:forEach var="MenuVO" items="${MenuList}"> 
				<li class="${MenuVO.s_code}"><div class="imgwrap"><a href="/myapp/menu_detail?p_num=${MenuVO.p_num}"><img src="img/${MenuVO.p_img}" id="img"/></a></div>
					<div class="imgtext">${MenuVO.p_name}<br/><span class="imgtext2">${MenuVO.p_ename}</span></div>
					<div class="${MenuVO.new_best}">${MenuVO.new_best}</div>
				</li> 
				</c:forEach>
			</ul>
		</div>
	</div>	
	<%@ include file="/inc/bottom3.jspf" %>