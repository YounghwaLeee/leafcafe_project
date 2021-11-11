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
	.menuList{
		display:flex;
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
		background-image:url(https://www.baristapaulbassett.co.kr/images/menu/subVisual_food.jpg);
		z-index:-1;
		width:100%;
		height:330px;
	}
	.custom-shape-divider-bottom-1634810632 {
    position: absolute;
    top: 346px;
    left: 0;
    width: 100%;
    overflow: hidden;
    line-height: 0;
    transform: rotate(180deg);
}

.custom-shape-divider-bottom-1634810632 svg {
    position: relative;
    display: block;
    width: calc(110% + 1.3px);
    height: 104px;
}

.custom-shape-divider-bottom-1634810632 .shape-fill {
    fill: #FFFFFF;
}
</style>
<script>
$(function(){
	$("#All").click(function(){
		$(".bakery").css('display','block');
		$(".cake").css('display','block');
	});
	
	$("#Bakery").click(function(){
		$(".bakery").css('display','block');
		$(".cake").css('display','none');
	});
	$("#Cake").click(function(){
		$(".cake").css('display','block');
		$(".bakery").css('display','none');
	});
	$("#headerText").animate({
	       top: "-205px", opacity:0.9
	       }, 600,);
	
	
});
</script>
<header>
<div id="head_img"></div>
   <div id="headerText">FOOD</div>
</header>
<div class="custom-shape-divider-bottom-1634810632">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
        <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
    </svg>
</div>
<div class="main">
	<div class="menu_bar">
		<ul class="menu_title_container">
			<li id="All">All</li>
			<li id="Bakery">Bakery</li>
			<li id="Cake">Cake</li>
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
<%@ include file="/inc/bottom.jspf" %>