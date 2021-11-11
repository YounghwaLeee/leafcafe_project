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
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
html, body {margin: 0; padding: 0; /* background: rgb(249, 244, 240); */font-family: 'Noto Sans KR';}
ul,li{margin: 0; padding-bottom: 10px; list-style: none;}
.w250, .w280, .w118{border: none; border-bottom: 1px solid #ddd; height: 30px;}
.container {position: relative;	height: 700px;}
.leftSide {position: fixed;	top: 20%; background: url(img/pngwing.png) no-repeat; width: 40%; height: 700px;}
.rightSide {position: absolute;	right: 0px;	width: 60%;	height: 700px;	width: 50%;}
section {position: relative; height: 700px;	z-index:8;}
.backimg {position: fixed; top: 40%; left: 30%;	width: 180px;}
.reg{display: block; 
	width: 200px;
    height: 50px;
    border: 1px solid rgb(0, 163, 239);
    line-height: 45px;
    text-align: center;
    background: rgb(0, 163, 239);
    color: white;
    border-radius: 3px;
    font-size: 1.3rem;
    font-family: 'Noto Sans KR';
    float: left;
    margin-right: 10px;
    cursor: pointer;
}
#username{width:500px;}
.rightTitle{height: 70px;}
.btn-wrap{width: 430px; margin-left:50px; margin-top:35px; }
.agree-info{    width: 88%; line-height: 25px; background: rgb(225,219,209); padding: 10px 20px;}
.cancel{background: white; color: rgb(0, 163, 239);}
#bottombox{height:800px;}
form[name=frmInquiry] li:nth-of-type(2n-1){padding-top:25px;margin-bottom: 3px;}
form[name=frmInquiry] input[type=radio]:nth-of-type(2n) {margin-left:30px;}
#tel1{width:160px; border: none; border-bottom: 1px solid #ddd;}
.telinput{border: none; border-bottom: 1px solid #ddd;width: 160px;
    margin-left: 6px;}
.errorMessage{color:red; display:none; font-weight: bold;}
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
	width: 397px;
    height: 505px;
	position: fixed;
	right: 20px;
	bottom: 20px;
	background: white;
	z-index: 20;
	border: 1px solid #ddd;
	border-radius: 30px;
	padding: 5px 20px;
	display: none;
}
#chatBody{
	    height: 400px;
    width: 355px;
    border: none;
    background: lightblue;
    	border-radius: 15px;
    

}
#chatBody::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
.openTime{
font-size: 0.9rem;
    text-align: center;
    padding: 5px 0px;

}
.chatTitle{
	border-bottom: 1px solid #ddd;
    font-size: 1.3rem;
    padding: 0px 8px 5px 7px;
    font-weight: 600;
}
.chatTitle>span{
	float:right;
	color: rgb(0, 163, 239);
}
#frm{
	font-size: 0.9rem;
}
input[type=text], select{
	height: 40px !important;
	padding-left: 10px !important;
}
.email{
	width: 240px;
	border: 0;
	border-bottom: 1px solid #ddd;
}
.addr{
	width: 200px;
	border: 0;
	border-bottom: 1px solid #ddd;
}
</style>
<script>
	$(()=>{
		let area0 = ["선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
		let area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		let area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
		let area3 = ["대덕구","동구","서구","유성구","중구"];
		let area4 = ["광산구","남구","동구","북구","서구"];
		let area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
		let area6 = ["남구","동구","북구","중구","울주군"];
		let area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
		let area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
		let area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
		let area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
		let area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
		let area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
		let area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
		let area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
		let area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
		let area16 = ["서귀포시","제주시","남제주군","북제주군"];
		
		$("select[name^=sido]").each(function() {
			  $selsido = $(this);
			  $.each(eval(area0), function() {
			   $selsido.append("<option value='"+this+"'>"+this+"</option>");
			  });
			  $selsido.next().append("<option value=''>선택</option>");
		});
		
		 // 시/도 선택시 구/군 설정

		 $("select[name^=sido]").change(function() {
			 $('#localSelect').css('display','none');
			 var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
			 var $gugun = $(this).next(); // 선택영역 군구 객체
			 $("option",$gugun).remove(); // 구군 초기화

		 if(area == "area0"){
		 	$gugun.append("<option value=''>선택</option>");
		 }
		 else {
		 	$.each(eval(area), function() {
		    $gugun.append("<option value='"+this+"'>"+this+"</option>");
		   		});
		 	}
		 });
		 
		 $('#content').keydown(function(){
			 if($('#content').val()==null || $('#content').val()==""){
				 $('#insertContent').css('display','none');
			 }
		 });
		 
		 $('#person_agree_y').click(function(){
			 $('#userInfoAgree').css('display','none');
		 });
		 
	}); // jquery
	
	function formInputCheck(){
		if(!$('#person_agree_y').is(':checked')){
			$('#userInfoAgree').css('display','block');
			$('#person_agree_y').focus();			
			return false;
		}
		if($('#content').val()==null || $('#content').val()==""){
			$('#insertContent').css('display','block');	
			$('#content').focus();
			return false;
		}
		if($('#sido').val()=="선택"){
			$('#localSelect').css('display','block');
			$('#sido').focus();
			return false;			
		}
		
	}
</script>
<script>
	$(()=>{
		$('#chat').click(function(){
			$("#chatTab").css('display','block');
		});
		$('#chatClose').click(function(){
			$("#chatTab").css('display','none');
		});
	});
</script>
</head>
<body>
<%@ include file="/inc/top.jspf" %>
<div id="chat">상담하기</div>
<div id="chatTab">
	<ul>
		<li class="chatTitle">leaf <span id ="chatClose"><svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="InnerIconstyled__Icon-sc-197h5bb-0 jdUMxO FullHeaderstyled__ThemeCloseIcon-sc-1aljhke-10 drXuSo" defaultOpacity="0.6" hoveredOpacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0"><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M16.4818 4.69668L15.3033 3.51817L10 8.82147L4.69671 3.51817L3.5182 4.69668L8.8215 9.99998L3.51819 15.3033L4.6967 16.4818L10 11.1785L15.3033 16.4818L16.4818 15.3033L11.1785 9.99998L16.4818 4.69668Z"></path></svg></span></li>
		<li class="openTime">상담하기 운영시간은 평일 9:00 ~ 18:00 <br/>(주말, 공휴일 제외) 입니다.</li>
			<iframe id="chatBody" src="http://192.168.0.45:10077/leafChat"><input type="button" value="새 문의하기" onclick="javascript:chat()"/></iframe>
	</ul>
</div>
	<div class="container">
		<div class="leftSide">
		</div>
		<div class="rightSide">
			<div class="rightTitle">
			</div>
			
			<form method="post" id="frm" name="frmInquiry" action="<%=request.getContextPath()%>/registerOpenRequest" onsubmit="return formInputCheck()">
				<ul>
					<li><b>이름</b></li>
					<li><input type="text" id="username" name="username" value="${orqVo.username}"
						required maxlength="50" class="w280" readonly></li>
					<li><b>휴대폰 번호*</b></li>
					<li>
						<select name="tel1" id="tel1">
							<script>
								let telNumber = ['010','011','016','017','018','019'];
								let tel = '${orqVo.tel1}'  // 031
								
								let aa = "";
								for(var i=0;i<telNumber.length;i++){								
									document.write("<option value='"+telNumber[i]+"'");
									if(tel==telNumber[i]) document.write("selected");
									document.write(">"+telNumber[i]+"</option>");									
								}
								
							</script>
						</select> 
						<input type="text" id="tel2" class="telinput" value="${orqVo.tel2}"
						name="tel2" required maxlength="4" class="w118">
						<input type="text" id="tel3" class="telinput"
						name="tel3" required maxlength="4" class="w118" value="${orqVo.tel3}"></li>
					
					<li><b>이메일*</b></li>
					<li><input class="email" type="text" name="emailid" id="emailid" value="${orqVo.emailid}"> @ 
					<input class="email"	type="text" name="domain" id="domain" value="${orqVo.domain}"></li>
					<li><b>창업희망지역*</b></li>
					<li>시/도 : <select name="sido"  id="sido" class="addr"></select>
					 구/군 : <select name="gugun" id="gugun" class="addr"></select> 
					</li>
					<div class="errorMessage" id="localSelect">지역을 선택해주세요!</div>
					<li><b>추가 정보 입력</b></li>
					<li><textarea cols="57" rows="8" name="content" id="content" style="resize: none;width:500px;"
							placeholder="점포를 보유하셨거나 입점희망 점포에 대한 사전정보가 있을 경우, 점포의 평수/임대료 등 구체적인 정보를 남겨주시면 조금 더 정확한 상담이 가능합니다. 그 외, 추가문의 사항이 있는 경우 남겨주세요!"
							></textarea></li>
					<div class="errorMessage" id="insertContent">추가 정보를 입력해주세요!</div>
					<li><b>개인정보 보호를 위한 이용자 동의서</b></li>
					<li><div class="agree-info">
							<p>
								Leaf코리아 창업문의 및 설명회 신청 관련 개인정보 수집동의 <span style="color: red;">(필수)</span><br>
								1. 개인정보의 수집 및 이용 목적<br> - Leaf코리아 브랜드 창업 문의에 대한 원활한 상담<br>
								- Leaf코리아 창업 관련 정보 안내<br> 2. 수집하는 개인정보의 항목<br> - 이름,
								휴대폰번호, 이메일, 창업희망지역, 점포소유여부(보유 시, 점포주소지)<br> 3. 개인정보 보유 및
								이용기간<br> - 이용 목적 달성 후, 내부규정에 따라 보관 및 지체없이 파기<br>
								※귀하께서는 위 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있으며, 동의 거부 시에는 창업상담 서비스 이용에
								제한이 될 수 있습니다.
							</p>
						</div></li>
					<div class="errorMessage" id="userInfoAgree">개인정보 동의가 필요합니다!</div>					
					<li></li>
					<li>
						<input type="radio" value="1" name="person_agree" id="person_agree_y"><label for="person_agree_y">&nbsp;</label>
						<label for="person_agree_y">동의합니다</label>
						<input type="radio" value="0" name="person_agree" id="person_agree_n"><label for="person_agree_n">&nbsp;</label>
						<label for="person_agree_n">동의하지 않습니다</label></li>
					<li><b>마케팅 활용 동의서</b></li>
					<li><div class="agree-info">
					<p>
							마케팅 정보제공 용도로의 이용 동의 <span style="color: red;">(선택)</span><br>
							수집한 위 개인정보를 더본코리아에서 제공하는 창업관련 자료 및 정보수신에 동의합니다.<br> ※선택 사항 미
							동의에 따른 상담서비스 이용 제한, 불이익은 없습니다.<br> 다만, Leaf코리아에서 제공하는 창업자료 및
							제안정보 등은 제공받으실 수 없습니다.
						</p>
						</div></li>
					<li></li>
					<li><input type="radio" value="1" name="marketing_agree" id="marketing_agree_y"><label for="marketing_agree_y">&nbsp;</label>
					<label for="marketing_agree_y">동의합니다</label> 
					<input type="radio" value="0" name="marketing_agree" id="marketing_agree_n"><label for="marketing_agree_n">&nbsp;</label>
					<label for="marketing_agree_n">동의하지 않습니다</label></li>
				</ul>
				<div class="btn-wrap">
					<input type="submit" class="reg" id="btn_submit" value="문의 등록"/>
					<a class="reg cancel" id="btn_cancle">취소</a>										
				</div>				
			</form>
		</div>
	</div>
	<!-- 수정부 -->
	<!-- <section></section> -->
	<div id="bottombox"></div>
</body>
</html>