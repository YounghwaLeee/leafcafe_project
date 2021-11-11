<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/top.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script>
	function allCheck(){
		console.log(iddoublecheck+","+pwdDoubleCheck+","+emailCheck);
		if(iddoublecheck==1&&pwdDoubleCheck==1&&emailCheck==1){
			return true;
		}
		location.href='#userid'; 
		return false;
	};
$(()=>{
	
		
// 	console.log(idDoubleCheck+","+pwdDoubleCheck+","+emailCheck);
// 	if(idDoubleCheck==1&&pwdDoubleCheck==1&& emailCheck==1){
// 		return false;
// 	}else{
// 		return false;
// 	}
	});
</script>
<style>

   ul,li{margin:0; padding:0; list-style:none;}
   .imglogo{
      height:250px;
      padding-left: 400px;
      
   }
   .id1, .pw1, .pw2, .mail{
   		font-size: 0.7rem;
   }
   .imglogo img{
      width: 300px;
   }
   .containers{
   margin:0 auto;
   width: 1400px;
    height: 800px;
    display: flex;
    align-items: center;
    font-size: 0.8rem;
   }
   
   .formdiv{
      width:700px;
      float: right;
      margin-top: 150px;
   }
   .imgdiv{
      width:700px;
      float: left;
   }
   #registerform{/*form은 block type*/
      margin:0 auto;
      width: 700px;
   }
   
   .label{
      display:inline-block;
      width:120px;
      height: 50px;
      text-align: center;   
   }
   .inputBox, .hasDatepicker{
      width:250px;
      height:35px;
      border:none;border-right:0px; border-top:0px; border-left:0px; border-bottom:1px solid #ddd;
   }
   .inputBoxLong{
   	width:370px;
   }
   .inputBoxShort{
   	width:117px;
   }
   .inputBox:focus, .hasDatepicker:focus, .tel:focus{
   	border: 1px solid rgb(0, 163, 239);
	border-bottom: 1px solid rgb(0, 163, 239);
	border-radius: 5px;
   }
   input[type=button], .ui-datepicker-trigger{
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
   input[type=button]:hover, .ui-datepicker-trigger:hover, .join:hover{ /*마우스 오버시 메뉴색깔 분홍색으로 변하는거*/
	box-shadow: inset 30em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);
}
   input[type=radio]{
   		margin-left:20px;
   		margin-right:5px;
   		
   }

   .tel{
      width:113px;
      height:30px;
      border:none;border-right:0px; border-top:0px; border-left:0px; border-bottom:1px solid #ddd;
      outline:none;
      margin-right:11px;
   
   }
   #joinbtn{
      text-align: center;
      margin-top: 15px;
   }
   .join{
   
   background-color: white;
	    width: 370px;
	    height: 45px;
	    border-radius: 2px;
	    border: 1px solid rgb(0, 163, 239);
	    font-size: 1.2em;
	    color: rgb(0, 163, 239);
	 	margin-left:-88px;
	    transition: 0.4s;
      
      
   }
   .emailCheck{
      width: 300px;
      heigh
      
   }
   .formdiv span{
      color:red;
   }
   
   .inputBox{
      outline:none;
   }

.cancle{
   margin-left:10px;
}
.footer_copy, .footer_link{
display: flex;
    justify-content: center;
}
.footer_link{
	margin-bottom: 9px;
}
.footer{
	padding: 120px 0 32px;
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
.ui-datepicker-year{
	width:30% !important;
	border:none;
}
 .ui-widget-header { border: 0px solid #dddddd; background: #fff; } 

 .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; } 

 .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; } 
 .ui-state-default{
 	background: white !important;
 }
 .ui-state-default,
 .ui-widget-content .ui-state-default,
 .ui-widget-header .ui-state-default,
 .ui-button,
 html .ui-button.ui-state-disabled:hover,
 html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 

 .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; } 

 .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 

 .ui-widget.ui-widget-content { border: 1px solid #eee; } 

 #datepicker:focus>.ui-datepicker { display: block; } 

 .ui-datepicker-prev,
 .ui-datepicker-next { cursor: pointer; } 

 .ui-datepicker-next { float: right; } 

 .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 

 .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 

 .ui-datepicker-calendar { width: 100%; } 

 .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 

 .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}

 .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; } 

 .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; } 

 .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; } 

 .ui-state-hover,
 .ui-widget-content .ui-state-hover,
 .ui-widget-header .ui-state-hover,
 .ui-state-focus,
 .ui-widget-content .ui-state-focus,
 .ui-widget-header .ui-state-focus,
 .ui-button:hover,
 .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 

 .ui-widget-header .ui-icon { background-image: url('img/btns.png'); } 

 .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; } 

 .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; } 

 .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; } 

 .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; } 

 .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 

 .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 

 .ui-state-highlight,
 .ui-widget-content .ui-state-highlight,
 .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 

 .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 

 .inp:focus { outline: none; background-color: #eee; } 
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
   <div class="containers">
         
      
         
         <div class="imgdiv"/> <img src="img/ilustcut.png" /></div>
         <div class="formdiv">
            <form method="post" id="registerform" action="/myapp/registerOk" onsubmit="return allCheck()">
         <ul>
            <li><label class="label">아이디 <span>*</span></label><input type="text" name="userid" id="userid" class="inputBox"/>
                  <input type="button" id="idChk" value="아이디중복검사"/><br/>
                  <div class="id1"></div>
                  
                  </li>
            <li><label class="label">비밀번호 <span>*</span></label><input type="password" name="userpwd" id="userpwd" class="inputBox inputBoxLong"/>
               <div class="pw1"></div></li>
            <li><label class="label">비밀번호확인 <span>*</span></label><input type="password" name="userpwdchk" id="userpwdchk" class="inputBox inputBoxLong"/>
               <div class="pw2"></div></li>
                  
            <li><label class="label">이름 <span>*</span></label><input type="text" name="username" id="username" class="inputBox"/>
                  <input type="radio" name="gender" value="남" checked="checked"/>남
                  <input type="radio" name="gender" value="여"/> 여</li>
            <li>
               <label class="label">생년월일</label>
               <input name="publeYear" autocomplete="off" readonly="readonly">
               
            </li>
            <li><label class="label">전화번호</label>
               
               <input type="text" name="tel1" id="tel1" class="tel" maxlength='3' onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> <!-- 숫자외 다른문자 입력시 자동으로 지워짐 -->
               <input type="text" name="tel2" id="tel2" class="tel" maxlength='4' onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
               <input type="text" name="tel3" id="tel3" class="tel" maxlength='4' onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
               
            </li>
            
            <li><label class="label">우편번호</label><input type="text" name="addr1" id="addr1" class="inputBox"/>
            <input type="button" onclick="sample6_execDaumPostcode()" id="zipSearch" value="우편번호찾기"/>
            </li>
            <li><label class="label">주소</label><input type="text" name="addr2" id="addr2" class="inputBox inputBoxLong"/></li>
            <li><label class="label">상세주소</label><input type="text" name="addr3" id="addr3" class="inputBox inputBoxLong"/></li>
            <li><label class="label">참고항목</label><input type="text" name="addr4" id="addr4" class="inputBox inputBoxLong"></li>
            <li style="height: 40px;"><label class="label">이메일</label><input type="text" id="emailid" name="emailid" class="inputBox inputBoxShort"/>@
            <input type="text" name="domain" id="domain" class="inputBox inputBoxShort">
            <input type="button" name="emailConfirm" id="emailConfirm" value="인증번호발송"/>
            </li>
            <li id="emailCheck" style="display:none;"><input style="margin-left: 120px;
    margin-bottom: 20px;" id="email"type="text" name="emailCheck"  class="inputBox inputBoxLong" placeholder="인증번호 입력"><br/><div class="mail"></div></li>
            <li id="joinbtn"><input type="submit" value="가입하기"class="join" /></li>
     	 </ul>
      </form>
      <div class="emailCheck"></div>
      </div><!--formdiv  -->
   </div><!-- container -->
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
var idcheck =0;
var iddoublecheck=0;

const config = {
      dateFormat: 'yy-mm-dd',
      showOn : "button",
      buttonText:"날짜 선택",
      changeYear:true,
      yearRange:'1900',
   }
   
         //캘린더
         $(function() {
           $( "input[name='publeYear']" ).datepicker(config);
         });
         
         //아이디 유효성검사
         $(function(){
             var getCheck= RegExp(/^[a-z0-9]{4,12}$/);
            $('#userid').keyup(function(){
                 if(!getCheck.test($("#userid").val())){
                    $(".id1").text("4~12자의 영문 소문자, 숫자만 가능합니다.");
                    $(".id1").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
                    idcheck=0;
                    iddoublecheck=0;
                   }else{
                    $(".id1").text("올바른 형식입니다.");
                    $(".id1").attr("style","color:green").css("margin-left","120px").css("margin-top","-20px");
                    idcheck=1;
                   }
            
            });
         });
         
   
         //아이디 중복체크
         $(function(){
            $("#idChk").click(function(){
               if(idcheck!=0){
            	var datas="userid="+$("#userid").val().trim();
                  //console.log(datas);//고구마들어옴.
               $.ajax({
                  url:"/myapp/idCheck",
                  data:datas,
                  success:function(result){
                     console.log(result);
                     if(result==1){
                        $(".id1").text("중복된 아이디 입니다.");
                        $(".id1").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
                        iddoublecheck=0;
                     }else{
                        $(".id1").text("사용가능한 아이디 입니다.");
                        $(".id1").attr("style","color:green").css("margin-left","120px").css("margin-top","-20px");
                        iddoublecheck=1;
                     }
                  }
               });
               }else{
            	   $(".id1").text("형식에 맞지 않는 아이디는 중복검사를 할 수 없습니다.");
                   $(".id1").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
               }
            });
         }); 
         

         
</script>
<script>
//비밀번호 유효성 검사
var pwdCheck = 0;
var pwdDoubleCheck =0;
var emailCheck = 0;
            $(function(){
               var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
               $('#userpwd').keyup(function(){
               var pw = $("#userpwd").val();
               var id = $("#userid").val();
               if(/(\w)\1\1\1/.test(pw)){
               $(".pw1").text('같은 문자를 4번 이상 사용하실 수 없습니다.');
                $(".pw1").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
                pwdCheck = 0;
                }else if(pw.search(id) > -1){
                   $(".pw1").text("비밀번호에 아이디가 포함되었습니다.");
                   $(".pw1").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
                   pwdCheck = 0;
                }else if(pw.search(/\s/) != -1){
                   $(".pw1").text("비밀번호는 공백 없이 입력해주세요.");
                   $(".pw1").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
                   pwdCheck = 0;
                }else if(false == reg.test(pw)) {
                  $(".pw1").text('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
                  $(".pw1").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
                  pwdCheck = 0;
                }else{
                   $(".pw1").text("사용가능한 비밀번호 입니다.");
                   $(".pw1").attr("style","color:green").css("margin-left","120px").css("margin-top","-20px");
                   pwdCheck = 1;
                }

            });
         });

//비밀번호 확인
         
         
         $(function(){
             $('#userpwdchk').keyup(function(){
            	 if(pwdCheck==1){
            		 
	                 if($('#userpwd').val()!=$('#userpwdchk').val()){
	                    $(".pw2").text("비밀번호가 일치하지 않습니다.");
	                    $(".pw2").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
	                    pwdDoubleCheck =0;
	                   
	                 } else{
	                   $(".pw2").text('비밀번호가 일치합니다.');
	                   $(".pw2").attr("style","color:green").css("margin-left","120px").css("margin-top","-20px");
	                   pwdDoubleCheck =1;
	                 }
            	 }else{
	                   $(".pw2").text('사용가능한 비밀 번호가 아닙니다.');
	                   $(".pw2").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
            		 
            	 }

             });
         });
//이메일 인증번호 확인했을때 팝업창

	$(function(){
		var dice;
		$('#emailConfirm').click(function(){
			var datas="email="+$("#emailid").val()+"@"+$("#domain").val();
        $.ajax({
           url:"/myapp/emailSending",
           data:datas,
           success:function(result){
              dice = result;
              $('#emailCheck').css('display','block');
           }
        });
     });
		
	$('#emailCheck').keyup(function(){
		console.log(dice); 
		console.log($('#email').val()); 
		if($('#email').val()!=dice){
			$(".mail").text("인증번호가 일치하지 않습니다.");
            $(".mail").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
            emailCheck=0;
		}else{
			$(".mail").text("인증번호가 일치합니다.");
            $(".mail").attr("style","color:green").css("margin-left","120px").css("margin-top","-20px");
            emailCheck=1;
		};
		
	});	
});


</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//우편번호 찾기 

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr4").value = extraAddr;
                
                } else {
                    document.getElementById("addr4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr1").value = data.zonecode;
                document.getElementById("addr2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr3").focus();
            }
        }).open();
    }

	
</script>




</body>

</html>