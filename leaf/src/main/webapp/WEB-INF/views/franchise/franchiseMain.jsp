<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@200&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style type="text/css">


.hanna * {
 font-family: 'Hanna', fantasy;
}
html,body{
margin:0;
padding:0;
font-family: 'Hanna';
line-height: 25px;

}
h1{
	padding-left:30px;
}
section{
	height: 430px;
	width: 100%;
	background-size: cover;
	position:relative;
	font-size: 1rem;
}
.section1{
	background: #ddd;
}
.section1>img{height: 100%;
    position: absolute;
    left: 18%;
}
.section2{
}
.section2>img{
	height: 100%;
    position: absolute;
    right: 0;
}
.section3{
	background:url(https://www.starbucks.co.kr/common/img/store/store_bn3_img01.jpg) 80% 50% no-repeat;
}
.section4{
	background:url(https://www.starbucks.co.kr/common/img/store/store_bn4_img01.jpg) 80% 50% no-repeat;
}
button{
	width:200px;
	height: 50px;
	line-height: 37px;
	margin-top: 20px;
	font-size:1.2rem;
	background: #ddd;
	border: 2px solid black;
	font-family: 'Do Hyeon';
	cursor: pointer;
	}
.text{
	width:400px;
	position:absolute;
	top: 98px;
	    line-height: 30px
}
.bn1{
	left:60%;
}
.bn1>button{
 margin-top:20px;}
.bn2{left:10%}
.bn2>button{
background: white; margin-top:20px;}
.bn3{left:60%;
color: white;}
.bn3>button{
background: rgb(57,47,46);
	border: 2px solid white;
	color:white;
	margin-top:20px;
	}
.bn4{left:10%}
.bn4>button{
background: rgb(215,210,204);
margin-top:20px;
}
.txthead{
font-size:1.9rem;
font-family: 'Do Hyeon'
}

</style>
</head>
<body>
<%@ include file="/inc/top.jspf" %>

<section class="section1">
<img alt="" src="img/Lovepik_com-401492477-paper-map-icon-free-vector-illustration-material.png">
<div class="text bn1"><span class="txthead">나의 일상이 되는 또 다른 공간</span><br/>커피 한 잔의 여유를 만나는 LEAF 매장<br/>이제 전국 어디에서나 만날 수 있는 LEAF 매장을<br/>지역별, 타입별, 서비스별 등의 설정을 통해 <br/>더욱 쉽고 빠르게 찾아보세요<br/><button type="button" onclick="location.href='storemap'">매장찾기</button></div></section>
<section class="section2"><img alt="" src="img/cafe.png"><div class="text bn2"><span class="txthead">LEAF의 가족이 되시겠습니까?</span><br/>다년간의 경영 노하우를 통해<br/>함께 성장해가는 LEAF입니다.<br/>가맹점 창업을 위한 절차를 확인하세요<button type="button" onclick="location.href='franchiseInfo'">창업안내</button></div></section>
<section class="section3"><div class="text bn3"><span class="txthead">직접 운영하는 새로운 LEAF</span><br/>창업 전문가들의 오랜 노하우<br/>창업시스템과 함께<br/>성공적인 카페 비지니스를 시작하세요!<br/><button type="button" onclick="location.href='openRequest'">창업신청</button></div></section>
<section class="section4"><div class="text bn4"><span class="txthead">예상 매출과 수익률이 궁금하신가요?</span><br/>오픈 후 관리는 어떻게 이뤄지나요?<br/>점포 입지선정은 어떻게 하나요?<br/>Q&A에서 그 답을 찾아보세요!<br/><button type="button" onclick="location.href='franchiseQuestion'">Q&A</button></div></section>

</body>
</html>