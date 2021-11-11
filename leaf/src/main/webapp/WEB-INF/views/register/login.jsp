
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/top.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta name ="google-signin-client_id" content="302840924011-i9dtipmm97nh9i37up0qcpmd0b9q7ja0.apps.googleusercontent.com">


<meta charset="UTF-8">
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);



 a:link {text-decoration: none;}

a:hover{text-decoration:none;
		color:rgb(0, 163, 239);
}

ul,li{list-style:none;
		margin:0;
		padding:0;
}

.formdiv{
		width:350px;
		margin: 0 auto;
	}
	

.containers{
		width:1400px;
		margin:0 auto;
		padding-top: 200px;
	
	}
	.nowrapdiv{
		font-size: 0.9rem;
	}
	
.label{
		display:inline-block;
		text-align: center;	
		
		
	}

	.loginPage>li{
	 width:100%;
	 height: 40px;
   	margin-bottom: 25px;
	}
.loginPage input:focus{
	border: 1px solid rgb(0, 163, 239);
	border-bottom: 1px solid rgb(0, 163, 239);
	border-radius: 5px;
}	


.inputBox{
		width: 100%;
		height:40px;
		border:none;border-right:0px; border-top:0px; border-left:0px; border-bottom:1px solid #ddd;
		outline:none;
		
	}
	
#joinbtn{
		
    	padding-top: 10px;
    
	}
.join{
	background-color:white;
	
		height:50px;
		border-radius: 5px;
		transition-duration: 0.3s;
		border:1px solid rgb(0, 163, 239);
		font-size: 1.3em;
		color:rgb(0, 163, 239);
		opacity: 0.8;
		font-family: 'Hanna', fantasy;
	
      
	
		width:350px;
		
	}
.anotherlogindiv{
	margin-top:70px;
	font-weight: 600;
}
	
.anotherlogin{
	margin-top:10px;
	width:350px;
	height:50px;
	line-height:50px;
	border-radius: 2px;
	text-align: center;
	color:black;
}

#naverIdLogin_loginButton{
	background-color: rgb(3,199,90);
	color: white;
}

#kakaologin{
	background-color: rgb(242,220,1);
	}
	
#googlelogin{
	background-color: rgb(64,129,236);
	color: white;
	}
	#googlelogin>img, #naverIdLogin_loginButton>img, #kakaologin>img{
	    height: 46px;
    margin: 2px;
    background: white;
    float: left;
	}
	.center {
	width: 1100px;
	height: 300px;
	display: flex;
	align-items: center; /*div박스들 축중앙으로*/
	justify-content: center; /*위치한 자리에서 가운데정렬*/
	margin: 0 auto;
	position: absolute;
	top: 8%;
	left: 397px;
	z-index: -1;
}

.one, .two, .three, .four { /*로딩할때 leat 글씨 날라오게 하는거.*/
	margin-left: 150px;
	margin-right: 150px;
	font-size: 8rem;
	opacity: 0;
	color: rgb(0, 163, 239);
}
.join:hover { /*마우스 오버시 메뉴색깔 분홍색으로 변하는거*/
	box-shadow: inset 25em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);
}
.search{

	display:flex;
	justify-content: center;
	padding-top: 12px;
    font-size: 0.8rem;
    
}
.search li{
	color: gray;
	padding: 0 7px 0 7px;
}
.search>a{

    border-right: 1px solid #ddd;
}
.search>a:last-child{
border-right:none;
}
.footer_copy, .footer_link{
display: flex;
    justify-content: center;
}
.footer_link{
	margin-bottom: 9px;
}
.footer{
	padding: 80px 0 32px;
    box-sizing: border-box;
    font-size:0.7rem;
    color: gray;
}
.footer_link>li{
	padding: 0 5px 0 5px;
    border-right: 1px solid #ddd;
}
.footer_link>li:last-child{
border-right:none;
}
.footer_link span{
	color: gray;
}
.blind{
	color: rgb(0, 163, 239);
	font-weight: 800;
}
.footer_copy>span{
	padding: 0 5px 0 5px;
}
</style>
</head>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$(()=>{ /*맨처음 글자 날라오는 애니메이션*/
    $('.one').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"5rem"},500)
    .delay(500).animate({marginLeft:"30px",marginRight:"0px" ,opacity:1,fontSize:"6rem"},300);
    $('.two').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"5rem"},500)
    .delay(500).animate({marginLeft:"30px",marginRight:"0px" ,opacity:1,fontSize:"6rem"},300);
    $('.three').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"5rem"},500)
    .delay(500).animate({marginLeft:"30px",marginRight:"0px" ,opacity:1,fontSize:"6rem"},300);
    $('.four').animate({marginLeft:"0px",marginRight:"0px",opacity:1,fontSize:"5rem"},500)
    .delay(500).animate({marginLeft:"30px",marginRight:"0px" ,opacity:1,fontSize:"6rem"},300);
    
    $('.main')
    .delay(2300)
    .queue(function (next) { 
    	$(this).css('display', 'block'); 
    });
});
</script>

<script type='text/javascript'>
Kakao.init('67e4cd913a98a7ac2b4847bd205aa751');

$(function(){
    $("#kakaologin").click(function(){
	
	console.log('들어오나욤');
    //1. 로그인 시도
    Kakao.Auth.login({
        success: function(authObj) {
         
          //2. 로그인 성공시, API 호출
          Kakao.API.request({
            url: '/v2/user/me',
            
            success: function(res) {
              console.log(res);
              var id = res.id;
              var nickName=res.properties.nickname;
			  scope : 'account_nickname';
			alert('로그인성공');
			location.href="/myapp/kakao?nickName="+nickName;
		

              
        }
          })
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
}); //

});
</script>

<script>

//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('googlelogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyAlE0VKVYQJh-gbWzrIsIUnoMs0PQ3IEyU', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>


<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>




<body>
<div class="center">
	<div class="one">l</div>
	<div class="two">e</div>
	<div class="three">a</div>
	<div class="four">f</div>
</div>
<div class="nowrapdiv">
<div class="containers">
	<div class="formdiv">
		<form method="post"action="/myapp/loginOk">
		<ul class="loginPage">
			<li><input placeholder=" 아이디" type="text" name="userid" id="userid" class="inputBox"/></li>
			<li><input placeholder=" 비밀번호" type="password" name="userpwd" id="userpwd" class="inputBox"/></li>
			<input type="submit" value="로 그 인" class="join" />
		</ul>
		<ul class="search">
			<a href="/myapp/idOk"><li>아이디찾기</li></a>
			<a href="/myapp/pwdOk"><li>비밀번호 찾기</li></a>
			<a href="/myapp/register"><li>회원가입</li></a>
		</ul>
		<div class="anotherlogindiv">
			<a href="#"><div class="anotherlogin" id="kakaologin"><img src="img/kakao_logo.png">카카오 계정으로 로그인</div></a>
			<a href="#"><div class="anotherlogin" id="naverIdLogin_loginButton"><img src="img/naver_logo.png">네이버 아이디로 로그인</div></a>
			<a href="#"><div class="anotherlogin" id="googlelogin"><img src="img/google_logo_2_littledeep.png">Google 계정으로 로그인</div></a>
		</div>

		</form>
	</div><!-- formdiv -->
</div><!-- container -->
</div>

<div class="footer">
        <div class="footer_inner">
            <!--[주]고객센터,제휴문의,서비스안내-->
            <ul class="footer_link" id="footer_link">
                <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/service.html"
                       id="fot.agreement"><span class="text">이용약관</span></a></li>
                <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/privacy.html"
                       id="fot.privacy"><span class="text">개인정보처리방침</span></a></li>
                <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/disclaimer.html"
                       id="fot.disclaimer"><span class="text">책임의 한계와 법적고지</span></a></li>
                <li><a target="_blank" class="footer_item"
                       href="https://help.naver.com/support/service/main.nhn?serviceNo=532" id="fot.help"><span
                                class="text">회원정보 고객센터</span></a></li>
            </ul>
            <div class="footer_copy">
                    <span class="footer_logo"><span class="blind">LEAF</span></span>
                <span class="text">Copyright</span>
                <span class="corp">© leaf Corp.</span>
                <span class="text">All Rights Reserved.</span>
            </div>
        </div>
    </div>
</body>

<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "grpculC6s_BHHG58yBaw", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://192.168.0.29:9090/myapp/", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>
</html>