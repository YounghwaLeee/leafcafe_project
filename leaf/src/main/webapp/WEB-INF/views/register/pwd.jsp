<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/top.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

a:link{
	text-decoration: none;
}

ul,li{list-style:none;
		margin:0;
		padding:0;
}


.formdiv{
		width:700px;
		margin: 0 auto;
		height: 450px;
		
	}
	

.container{
		width:700px;
		margin:0 auto;
		padding-top: 200px;
		font-size: 0.9rem;
	}
	

.inputBox {
	width: 365px;
    height: 40px;
    border: none;
    border-right: 0px;
    border-top: 0px;
    border-left: 0px;
    border-bottom: 1px solid #ddd;
    outline: none;
}
.search{
	width:700px;
	margin:0 auto;
}	

.search>li:first-child>a{
	color:gray;

}
.search>li:first-child{
	 float: left;
    width: 45%;
    height: 50px;
    text-align: center;
    border:none;border-right:2px; border-top:0px; border-left:0px; border-bottom:2px solid;
    box-sizing: border-box;
    line-height: 50px;
}



.search>li:last-child{
	 float: left;
    width: 45%;
    height: 50px;
    text-align: center;
  	border-top: 2px solid black;
  	border-right: 2px solid black;
  	border-left: 2px solid black;
  	
    box-sizing: border-box;
    line-height: 50px;
}

.logins>li{
	 float:left;
	}
.logins{
	clear:both;
	padding-top: 10%;
}
.label{
	height:30px;
}
	.logins>li:nth-child(2n){
	 width:80%;
	 height: 67px;
	}
	.logins>li:nth-child(2n-1){
    width: 20%;
    padding-top: 20px;
	}
.next{
	background-color:white;
	width: 100px;
	height:50px;
	border-radius: 10px;
	transition-duration: 0.3s;
	border:1px solid rgb(0, 163, 239);
	font-size: 1.1em;
	color:rgb(0, 163, 239);
	opacity: 0.8;
	font-family: 'Hanna', fantasy;
	
}
	#subbtn{
		width:350px;
		text-align: center;
	}
	
   input[type=button]{
	   	background-color: white;
	    width: 110px;
	    height: 35px;
	    border-radius: 2px;
	    border: 1px solid rgb(0, 163, 239);
	    font-size: 0.9em;
	    color: rgb(0, 163, 239);
	    margin-left: 7px;
	    transition: 0.4s;
   }
   input[type=button]:hover{ /*마우스 오버시 메뉴색깔 분홍색으로 변하는거*/
	box-shadow: inset 30em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);
}
	input[type=text]:focus{
   	border: 1px solid rgb(0, 163, 239);
	border-bottom: 1px solid rgb(0, 163, 239);
	border-radius: 5px;
   }
	
	#footer{height: 40px;clear:both;position:absolute;left:0;right:0;bottom:0;margin:0;padding:9px 0 6px;border-top:1px solid #e5e5e5;background:#333 url(https://static.nid.naver.com/images/web/user/bg_footer.png) repeat-x 0 0;text-align:center;zoom:1}
.guides{position:relative;letter-spacing:-1px;text-align:right;white-space:nowrap}.guides li{display:inline;padding:0 5px 0 7px;background:url(https://static.nid.naver.com/images/web/user/bu_footer_bar.png) left 50% no-repeat;_background-position:left 10%;font-size:11px;white-space:nowrap}.guides li.first{padding:0 3px 0 0;background:0 0}.guides a{color:#9c9da1}.fl{float:left;z-index:20;margin:0 auto 0 20px}.fr{float:right;z-index:10;margin:0 20px 0 auto; top:-35px;}.fr li:first-child{background:0 0}
.copyright{margin-right:305px;font-size: 0.8rem;color: gray;}.guides li{padding:0 0 0 6px}.guides strong{font-weight:400; color: #ddd;}.copyright strong{color: #ddd;}
	
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>

<div class="container">
	<ul class="search">
		<li><a href="/myapp/idOk">아이디찾기</a></li>
		<li>비밀번호찾기</li>
	</ul>
	<div class="formdiv">
	<ul class="logins">
			<li><label class="label">아이디</label></li>
			<li><input type="text" name="userid" id="userid" class="inputBox"/></li>
			<li><label class="label">전화번호</label></li>
			<li><input type="text" name="tel" id="tel" class="inputBox" placeholder="휴대전화번호"/>
			<input type="button" id="inputPhoneNumber" value="인증번호발송"/></li>
			<li><label class="label">인증번호</label></li><li><input type="text" name="inputCertifiedNumber" id="inputCertifiedNumber"  placeholder="인증번호 4자리 숫자 입력"class="inputBox"/>
			<input type="button" id="checkBtn" value="인증번호확인"/>
		
		</ul>

	</div><!-- formdiv -->
</div><!-- container -->
<div id="footer">
		<ul class="guides fl">
		<li class="first"><a href="https://pay.naver.com/npoint/pay/terms-of-electronic-financecontract_20140701.html" target="_blank" onclick="clickcr(this,'fot.ecommerce','','',event);">전자금융거래 이용약관</a></li>
		<li><a href="http://policy.naver.com/policy/privacy.html" target="_blank" onclick="clickcr(this,'fot.privacy','','',event);"><strong>개인정보처리방침</strong></a></li>
		<li><a href="http://policy.naver.com/rules/disclaimer.html" target="_blank" onclick="clickcr(this,'fot.disclaimer','','',event);">책임의 한계와 법적고지</a></li>
		</ul>
		<address class="copyright">
		Copyright <em>&copy;</em> <a href="https://www.navercorp.com/" target="_blank" onclick="clickcr(this,'fot.navercorp','','',event);"><strong>LEAF Corp.</strong></a> All Rights Reserved.
		</address>
		<ul class="guides fr">
		<li><a href="https://help.naver.com/support/alias/membership/p.membership/p.membership_26.naver" target="_blank" title="새창" onclick="clickcr(this,'fot.help','','',event);"> 회원정보 고객센터 </a></li>
		</ul>
	</div>
<script>

$(function(){

	
	$('#inputPhoneNumber').click(function(){
		let phoneNumber = $('#tel').val();
		alert('인증번호 발송 완료!');
		$.ajax({
			type: "GET",
			url: "/myapp/check/sendSMS",
			data: {"phoneNumber" : phoneNumber}, 
			success: function(res){
		   		$('#checkBtn').click(function(){
		        	if($.trim(res) ==$('#inputCertifiedNumber').val()){ 
	                	alert( '인증성공!','휴대폰 인증이 정상적으로 완료되었습니다.','success')
	                	
							$.ajax({//메일만 보내면된다
								url:"/myapp/update/emailNumber",
								data:{"tel" : $('#tel').val()},
								success: function(res){
									if(res==0){
										alert('이메일전송실패');
									}else{
										alert('이메일전송완료');
										location.href='/myapp/login';
										
									}
								}
							});
					
					}
				});
			}
		});
	});
});

</script>

</body>
</html>