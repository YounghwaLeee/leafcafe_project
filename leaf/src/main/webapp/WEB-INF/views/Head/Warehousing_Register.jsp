<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/adminTop.jspf"%>
<style>
body{
		margin: 0;
		background-color:rgb(242, 242, 242);
	}
	.container{
		max-width: 1000px;
		display: flex;
	    justify-content: center;
	    margin:0 auto;
	    box-shadow: 0px 1px 2px 1px lightslategrey;
	    background-color:white;
	    margin-top:100px;
	    margin-bottom:200px;
	    height:900px;
	}


/*head 이미지*/
header {
	height: 270px;
	position: relative;
}

#headerText {
	top: -100px;
	font-size: 3em;
	color: white;
	opacity: 0.5;
	text-align: center;
	position: relative;
}

nav {
	display: flex;
	justify-content: center;
	width: 100%;
	border-bottom: 1px solid gray;
}

nav>div {
	padding: 15px 40px;
}

#head_img {
	background-image:
		url(http://localhost:9090/myapp/img/managerbannerimg.jpg);
	z-index: -1;
	width: 100%;
	height: 270px;
}

.main-form-Con {
	max-width: 570px;
	margin: 0 auto;
	padding: 70px 0 50px;
}

.main-form-Con>strong {
	display: block;
	font-size: 20px;
	font-weight: normal;
	margin: 30px auto;
	text-align: center
}

.mf-inputCon {
	border: 1px solid #ddd;
	border-radius: 3px;
	box-sizing: border-box;
	max-width: 570px;
	margin: 0 auto 30px;
	position: relative;
	top:30px;
}

.mfi-img {
	margin: 0 auto;
	text-align: center;
	padding: 30px 20px 0;
	background: url(img/empimg.png) 50% 100% no-repeat;
	width: 205px;
	height: 88px;
}

.mfi-inputbox {
	background: #fff;
	border-bottom: 1px solid #ddd;
	padding: 20px 20px;
	position: relative;
}

.mfi-title {
	background: #fff;
	border-bottom: 1px solid #ddd;
	color: #777;
	font-size: 15px;
	line-height: 24px;
	text-align: center;
	padding: 30px 20px 30px;
	margin: 0;
}

.mfi-inputbox input {
	border: 1px solid #ddd;
	border-radius: 3px;
	box-sizing: border-box;
	display: inline-block;
	width: 530px;
	padding: 10px;
}

.mfi-inputbox strong {
	color: #222;
	display: block;
	margin-bottom: 10px;
}

.mfi-inputbox .mfi-iB-tel select {
	width: 30%;
	display: inline-block;
	height: 40px;
	margin-right: 20px;
}

.mfi-inputbox .mfi-iB-tel input {
	width: 30%;
	margin-right: 20px;
	
}

.mfi-inputbox .mfi-iB-tel input:last-of-type {
	width: 30%;
	margin-right: 0px;
}
/* 부서파트 */
.mfi-inputbox #dept_name {
	width: 460px;
}

.mfi-inputbox #part_code, #part_num, #hq_name1, #hq_name, #part_company {
	width: 530px;
	display: inline-block;
	height: 40px;
	margin-right: 20px;
	border-top: none;
    border-left: none;
    border-right: none;
}
.regiForm-submit {
	width: 530px;
	padding: 20px 20px;
}

.regiForm-submit #part-regi {
	width: 530px;
	padding: 10px;
	background: rgb(30, 57, 50);
	border: 1px solid white;
	color: white;

}
.regiForm-submit{width: 530px; margin: 0 auto 30px; padding:20px 20px;}
	.regiForm-submit #part-regi{transition: 0.6s;margin-left: 45px;width:400px; padding:13px;background: white; border: 1px solid rgb(0,192,239); color: rgb(0,192,239); font-size: 1em}
	.regiForm-submit #part-regi:hover{
     	box-shadow: inset 30em 0 0 0 rgb(0, 163, 239);
		color: white !important;
		border-color: rgb(0, 163, 239);
   }
   	#name {
	font-size: 2em;
	font-weight: bold;
	text-align: center;
	line-height: 3;
}
#name2 {
	text-align: center;
}
</style>
<script>
$(()=>{

	$("#headerText").animate({
	       top: "-160px", opacity:1
	       }, 1200,);
   
});

</script>
<header>
	<div id="head_img"></div>
	<div id="headerText">Warehousing Register</div>
</header>
<div class="container">
<form method="post" action="/myapp/warehousing_RegisterOk">
		<div class="main-form-Con">
		<div id="name">입고등록</div>
		<div id="name2">입고를 등록해주세요.</div><hr/>
			<section class="mf-inputCon">
				<div class="mfi-inputbox">
					<strong> <span>분류명(필수)</span>
					</strong> <select name="" id="part_code">
						<option value="bipum">비품</option>
						<option value="food">식자재</option>
						<option value="transit">운송</option>
						<option value="equipment">설비</option>
					</select>
				</div>
				<div class="mfi-inputbox">
					<strong>제품명 <span>(필수)</span>
					</strong>
					<select name="hq_num" id="hq_name" class="group_s">
					<c:forEach var="ProductVO" items="${items}">
						<option value="${ProductVO.hq_num }" class="code1">${ProductVO.hq_name }</option>
					</c:forEach>
					</select>
				
				</div>
				<div class="mfi-inputbox">
					<strong>입고수량 <span>(필수)</span>
					</strong>
					<select name="ware_cnt" id="part_company">
						<option value="">입고수량</option>
						<option value="1000">1000</option>
						<option value="2000">2000</option>
						<option value="3000">3000</option>
						<option value="4000">4000</option>
						<option value="5000">5000</option>
						<option value="10000">10000</option>
					</select>
				</div>
				<div class="regiForm-submit">					
						<input type="submit" id="part-regi" value="등록하기"/>
				</div>
			</section>
		</div>
	</form>
</div>
<%@ include file="/inc/bottom3.jspf"%>