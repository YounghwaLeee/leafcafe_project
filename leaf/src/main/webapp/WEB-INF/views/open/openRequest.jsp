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
		let area0 = ["??????","???????????????","???????????????","???????????????","???????????????","???????????????","???????????????","???????????????","?????????","?????????","????????????","????????????","????????????","????????????","????????????","????????????","?????????"];
		let area1 = ["?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","????????????","?????????","?????????","????????????","?????????","?????????","?????????","?????????","?????????","????????????","?????????","?????????","?????????","??????","?????????"];
		let area2 = ["?????????","??????","?????????","??????","?????????","??????","?????????","??????","?????????","?????????"];
		let area3 = ["?????????","??????","??????","?????????","??????"];
		let area4 = ["?????????","??????","??????","??????","??????"];
		let area5 = ["??????","?????????","??????","??????","??????","?????????","??????","?????????"];
		let area6 = ["??????","??????","??????","??????","?????????"];
		let area7 = ["?????????","?????????","??????","??????","?????????","????????????","??????","?????????","?????????","??????","?????????","?????????","?????????","??????","????????????","?????????"];
		let area8 = ["?????????","?????????","?????????","?????????","?????????","?????????","?????????","????????????","????????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","????????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????"];
		let area9 = ["?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????"];
		let area10 = ["?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????"];
		let area11 = ["?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????"];
		let area12 = ["?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????"];
		let area13 = ["?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????"];
		let area14 = ["?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????"];
		let area15 = ["?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????"];
		let area16 = ["????????????","?????????","????????????","????????????"];
		
		$("select[name^=sido]").each(function() {
			  $selsido = $(this);
			  $.each(eval(area0), function() {
			   $selsido.append("<option value='"+this+"'>"+this+"</option>");
			  });
			  $selsido.next().append("<option value=''>??????</option>");
		});
		
		 // ???/??? ????????? ???/??? ??????

		 $("select[name^=sido]").change(function() {
			 $('#localSelect').css('display','none');
			 var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // ??????????????? ?????? Array
			 var $gugun = $(this).next(); // ???????????? ?????? ??????
			 $("option",$gugun).remove(); // ?????? ?????????

		 if(area == "area0"){
		 	$gugun.append("<option value=''>??????</option>");
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
		if($('#sido').val()=="??????"){
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
<div id="chat">????????????</div>
<div id="chatTab">
	<ul>
		<li class="chatTitle">leaf <span id ="chatClose"><svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="InnerIconstyled__Icon-sc-197h5bb-0 jdUMxO FullHeaderstyled__ThemeCloseIcon-sc-1aljhke-10 drXuSo" defaultOpacity="0.6" hoveredOpacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0"><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M16.4818 4.69668L15.3033 3.51817L10 8.82147L4.69671 3.51817L3.5182 4.69668L8.8215 9.99998L3.51819 15.3033L4.6967 16.4818L10 11.1785L15.3033 16.4818L16.4818 15.3033L11.1785 9.99998L16.4818 4.69668Z"></path></svg></span></li>
		<li class="openTime">???????????? ??????????????? ?????? 9:00 ~ 18:00 <br/>(??????, ????????? ??????) ?????????.</li>
			<iframe id="chatBody" src="http://192.168.0.45:10077/leafChat"><input type="button" value="??? ????????????" onclick="javascript:chat()"/></iframe>
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
					<li><b>??????</b></li>
					<li><input type="text" id="username" name="username" value="${orqVo.username}"
						required maxlength="50" class="w280" readonly></li>
					<li><b>????????? ??????*</b></li>
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
					
					<li><b>?????????*</b></li>
					<li><input class="email" type="text" name="emailid" id="emailid" value="${orqVo.emailid}"> @ 
					<input class="email"	type="text" name="domain" id="domain" value="${orqVo.domain}"></li>
					<li><b>??????????????????*</b></li>
					<li>???/??? : <select name="sido"  id="sido" class="addr"></select>
					 ???/??? : <select name="gugun" id="gugun" class="addr"></select> 
					</li>
					<div class="errorMessage" id="localSelect">????????? ??????????????????!</div>
					<li><b>?????? ?????? ??????</b></li>
					<li><textarea cols="57" rows="8" name="content" id="content" style="resize: none;width:500px;"
							placeholder="????????? ?????????????????? ???????????? ????????? ?????? ??????????????? ?????? ??????, ????????? ??????/????????? ??? ???????????? ????????? ??????????????? ?????? ??? ????????? ????????? ???????????????. ??? ???, ???????????? ????????? ?????? ?????? ???????????????!"
							></textarea></li>
					<div class="errorMessage" id="insertContent">?????? ????????? ??????????????????!</div>
					<li><b>???????????? ????????? ?????? ????????? ?????????</b></li>
					<li><div class="agree-info">
							<p>
								Leaf????????? ???????????? ??? ????????? ?????? ?????? ???????????? ???????????? <span style="color: red;">(??????)</span><br>
								1. ??????????????? ?????? ??? ?????? ??????<br> - Leaf????????? ????????? ?????? ????????? ?????? ????????? ??????<br>
								- Leaf????????? ?????? ?????? ?????? ??????<br> 2. ???????????? ??????????????? ??????<br> - ??????,
								???????????????, ?????????, ??????????????????, ??????????????????(?????? ???, ???????????????)<br> 3. ???????????? ?????? ???
								????????????<br> - ?????? ?????? ?????? ???, ??????????????? ?????? ?????? ??? ???????????? ??????<br>
								?????????????????? ??? ???????????? ??????, ????????? ?????? ????????? ????????? ????????? ?????????, ?????? ?????? ????????? ???????????? ????????? ?????????
								????????? ??? ??? ????????????.
							</p>
						</div></li>
					<div class="errorMessage" id="userInfoAgree">???????????? ????????? ???????????????!</div>					
					<li></li>
					<li>
						<input type="radio" value="1" name="person_agree" id="person_agree_y"><label for="person_agree_y">&nbsp;</label>
						<label for="person_agree_y">???????????????</label>
						<input type="radio" value="0" name="person_agree" id="person_agree_n"><label for="person_agree_n">&nbsp;</label>
						<label for="person_agree_n">???????????? ????????????</label></li>
					<li><b>????????? ?????? ?????????</b></li>
					<li><div class="agree-info">
					<p>
							????????? ???????????? ???????????? ?????? ?????? <span style="color: red;">(??????)</span><br>
							????????? ??? ??????????????? ????????????????????? ???????????? ???????????? ?????? ??? ??????????????? ???????????????.<br> ????????? ?????? ???
							????????? ?????? ??????????????? ?????? ??????, ???????????? ????????????.<br> ??????, Leaf??????????????? ???????????? ???????????? ???
							???????????? ?????? ??????????????? ??? ????????????.
						</p>
						</div></li>
					<li></li>
					<li><input type="radio" value="1" name="marketing_agree" id="marketing_agree_y"><label for="marketing_agree_y">&nbsp;</label>
					<label for="marketing_agree_y">???????????????</label> 
					<input type="radio" value="0" name="marketing_agree" id="marketing_agree_n"><label for="marketing_agree_n">&nbsp;</label>
					<label for="marketing_agree_n">???????????? ????????????</label></li>
				</ul>
				<div class="btn-wrap">
					<input type="submit" class="reg" id="btn_submit" value="?????? ??????"/>
					<a class="reg cancel" id="btn_cancle">??????</a>										
				</div>				
			</form>
		</div>
	</div>
	<!-- ????????? -->
	<!-- <section></section> -->
	<div id="bottombox"></div>
</body>
</html>