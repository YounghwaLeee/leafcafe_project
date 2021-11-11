<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
	* {
		box-sizing: border-box;/*border포함 250*/
	}
	a:link, a:hover, a:visited {
		text-decoration: none;
		color: black;
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
		line-height:50px;
		height:50px;
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
</style>
<script>
$(function(){
	$("#All").click(function(){
		$(".latte").css('display','block');
		$(".espresso").css('display','block');
		$(".coffee").css('display','block');
	});
	
	$("#Coffee").click(function(){
		$(".coffee").css('display','block');
		$(".latte").css('display','none');
		$(".espresso").css('display','none');
		
	});
	$("#Latte").click(function(){
		$(".latte").css('display','block');
		$(".coffee").css('display','none');
		$(".espresso").css('display','none');
	});
	$("#Espresso").click(function(){
		$(".espresso").css('display','block');
		$(".coffee").css('display','none');
		$(".latte").css('display','none');
	});
	
});
</script>
</head>
<body>
	<div class="main">
		<div class="menu_bar">
			<ul class="menu_title_container">
				<li id="All">All</li>
				<li id="Coffee">Coffee</li>
				<li id="Latte">Latte</li>
				<li id="Espresso">Espresso</li>
			</ul>
		</div>
		<div>
			<ul class="menuList">
				<li class="coffee"><div class="imgwrap"><a href="/suyeong/leaf/leaf_menu_detail.jsp"><img src="img/americano.png" id="img"/></a></div>
					<div class="imgtext">아이스아메리카노<br/><span class="imgtext2">Iced Americano</span></div>
					<div class="new">new</div>
				</li>
				<li class="latte"><div class="imgwrap"><img src="img/latte.png" id="img"/></div>
					<div class="imgtext">마키아토<br/><span class="imgtext2">Machiato</span></div>
				</li>
				<li class="espresso"><div class="imgwrap"><img src="img/espresso.png" id="img"/></div>
					<div class="imgtext">에스프레소<br/><span class="imgtext2">Espresso</span></div>
					<div class="best">best</div>
				</li>
				<li class="latte"><div class="imgwrap"><img src="img/icecreamlatte.png" id="img"/></div>
					<div class="imgtext">아이스크림라떼<br/><span class="imgtext2">Icecream Latte</span></div>
					<div class="best">best</div>
				</li>
				<li class="latte"><div class="imgwrap"><img src="img/malcha.png" id="img"/></div>
					<div class="imgtext">아이스 제주 말차 카페 라떼<br/><span class="imgtext2">Iced Jeju Malcha Cafe Latte</span></div>
				</li>
				<li class="latte"><div class="imgwrap"><img src="img/latte2.png" id="img"/></div>
					<div class="imgtext">아이스 카페라떼<br/><span class="imgtext2">Iced Cafe Latte</span></div>
					<div class="best">best</div>
				</li>
				<li class="latte"><div class="imgwrap"><img src="img/caramel.png" id="img"/></div>
					<div class="imgtext">아이스 카라멜마끼야또<br/><span class="imgtext2">Iced Caramel Macchiato</span></div>
				</li>
				<li class="latte"><div class="imgwrap"><img src="img/Einspanner.png" id="img"/></div>
					<div class="imgtext">제주바다 아인슈페너<br/><span class="imgtext2">Jeju Ocean Einspanner</span></div>
				</li>
			</ul>
		</div>
	</div>	
</body>
</html>