<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<style>	
	.main-form-Con{max-width: 570px; margin: 0 auto; padding: 70px 0 50px;}
	.main-form-Con>strong{display: block;font-size: 30px;font-weight: normal;text-align: center; padding:30px;}
	.mf-inputCon{box-sizing: border-box; max-width: 570px; margin: 0 auto 30px; position: relative;}
	.mfi-img{margin: 0 auto; text-align: center; padding: 30px 20px 0; background: url(img/empimg.png) 50% 100% no-repeat; width: 205px; height: 182px;}
	.mfi-inputbox{height: 130px;background: #fff; padding: 20px 20px; position: relative;}
	.mfi-title{background: #fff; border-bottom: 1px solid #ddd; color: #777; font-size: 18px; line-height: 24px; text-align: center;padding: 30px 20px 30px; margin:0;}
	.mfi-inputbox input{font-size: 0.9rem; border: 0;
    border-bottom: 1px solid #ddd; width:530px; padding:15px;}
	.mfi-inputbox strong{color: #222; display: block; font-size: 18px; margin-bottom: 10px;}
	.mfi-inputbox .mfi-iB-tel #tel1{width:30%; display:inline-block; height:47px; margin-right:20px;} 
	.mfi-inputbox .mfi-iB-tel input{width:30%; margin-right:20px;}
	.mfi-inputbox .mfi-iB-tel input:last-of-type{width:30%; margin-right:0px;}
	.mfi-inputbox #userid{width:400px; float:left;}
	.mfi-inputbox #joinCheck{transition: 0.4s; width:122px; background:#fff; color:rgb(0,163,239); border:1px solid rgb(0,163,239); margin-left:6px; box-sizing:border-box;}
	.mfi-inputbox #joinCheck:hover, #emp-regi:hover{
      
      box-shadow: inset 30em 0 0 0 rgb(0, 163, 239);
	color: white !important;
	border-color: rgb(0, 163, 239);
   }
   input[type=text]:focus{
	   	border: 1px solid rgb(0, 163, 239);
		border-bottom: 1px solid rgb(0, 163, 239);
		border-radius: 5px;
   }
	/* 부서파트 */
	.mfi-inputbox #dept_num{    font-size: 0.9rem;border: 0;
    border-bottom: 1px solid #ddd; width:530px; display:inline-block; height:47px; margin-right:20px;}	
	.mfi-inputbox #emp_posi{    font-size: 0.9rem;border: 0;
    border-bottom: 1px solid #ddd; width:530px; display:inline-block; height:47px; margin-right:20px;}	
	.regiForm-submit{width: 530px; margin: 0 auto; padding:20px 20px 40px;}
	.regiForm-submit #emp-regi{transition: 0.6s;margin-left: 45px;width:400px; padding:13px;background: white; border: 1px solid rgb(0,192,239); color: rgb(0,192,239); font-size: 1em}
	
	/* 상단 이미지와 네비바 */
	a{color:gray}
    a:link, a:hover a:visited{text-decoration: none;}
    button{background-color:white;cursor:pointer;} 
	 .top-banner-imgCon{background:url(img/managerbannerimg.jpg) no-repeat center; background-size:cover;
   					height:250px;position:relative; min-width:1400px; overflow:hidden;
   	}   
   .top-banner-imgCon .headerText{width:1400px;font-size:3em;color:white;z-index:100;opacity:1; margin:90px auto 0;text-align:center;}
   .top-banner-nav{display:flex;justify-content:center;width:100%;border-bottom:1px solid gray;}
   .top-banner-nav>div{padding:15px 40px;}
   .top-banner-nav>.tbn-menu2{border-bottom:4px solid rgb(0, 163, 239);}
   
   /* 네비바 사원등록선택된 파란색 밑줄 */
   .top-banner-nav>.tbn-menu2{border-bottom:4px solid rgb(0, 163, 239);}
   
   /* 폼 데이터 미입력시 나타나는 글씨*/
   .error-Message{display:inline-block; margin:10px 0 0 10px; color:red;}
   #idcheck-error{display:none;font-size: 0.9rem;
    position: absolute;
    top: 103px;
    left: 24px;
    height: 20px;}
   #deptName-error{display:none;}
   #empRegdate-error{display:none;}
   
      #head_img{
      background-image:url(img/wallpaperbetter.com_1920x1080.jpg);
      background-position-y: -120px;
      z-index:-1;
      width:100%;
      height:330px;
   }	
  
   header{
	   height:330px;
	   position:relative;
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script>	
	function goFocus(inputbox){
		if(inputbox.value.length==4){
			$('#tel3').focus();
		}
	}
	$(()=>{
		const regExpId = /^[a-z0-9]*$/;				
		
		$('#joinCheck').click(function(){
			let inputUserid = "";
			inputUserid = $('#userid').val();
			if(inputUserid===null || inputUserid==""){
				alert("가입한 아이디를 입력해주세요.");				
				$('#userid').focus();
				return false;
			}
			else{				
				if(!regExpId.test(inputUserid)){
					alert("아이디는 영문자와 숫자만 입력 가능합니다.");
					$('#userid').focus();
					return false;
				}else{
						// 화면에 회원정보가 출력됨. (아이디,이름,연락처,이메일)
						$.ajax({
							url : "/myapp/employeeJoinChecking",
							data : "userid="+inputUserid,
							method: "post",
							success : function(result){								
								if(result == '' || result==null){
									alert("존재하지 않는 아이디입니다.");
									$('#userid').focus();
									return false;
								}
								if(result.nullid!=0 ){
									alert("이미 가입된 사원입니다.");
									$('#userid').val('');
									$('#userid').focus();									
									return false;
								}
							
								let yesOrNo = confirm("회원이름 : "+result.username+" 이 맞습니까?");
								if(!yesOrNo){
									$('#userid').val("");
									$('#userid').focus();
									return false;						
								}else{
									$('#userid').val(result.userid);
									$('#username').val(result.username);
									$('#tel1').val(result.tel1);
									$('#tel2').val(result.tel2);
									$('#tel3').val(result.tel3);
									$('#email').val(result.email);
									$('#idcheck').val(0);
									$('#userid').prop('readonly',true);
									$('#idcheck-error').css('display','none');
									
								}
							}, error : function(){
								alert("존재하지 않는 아이디입니다.");
								return false;
							}
						});
					}			
			}
		});// 가입확인절차 click함수	
		
		// 입사일 선택달력
		flatpickr("#emp_regdate");
		let dateSelect = document.querySelector('#emp_regdate');
		flatpickr.localize(flatpickr.l10ns.ko);
		flatpickr(dateSelect);
		dateSelect.flatpickr({
			maxDate:new Date(),
			disable:[
				function(date){ // 주말선택 제외
					return(date.getDay()===0||date.getDay()===6);
				}
			]			
		});
		
		$('#dept_img').click(function(){
			if($('#dept_name').val()!='' || $('#dept_name').val()!=null){
				$('#deptName-error').css('display','none');
			}
		});
		$('#emp_regdate').click(function(){
			if($('#emp_regdate').val()!='' || $('#emp_regdate').val()!=null){
				$('#empRegdate-error').css('display','none');
			}
		});
		
		$('form[name=frm]').submit(function(){
			if($('#idcheck').val()===1 || $('#userid').val()==='' || $('#userid').val()==null){
				$('#idcheck-error').css('display','block');
				$('#idcheck-error').focus();
				return false;
			}
			if($('#emp_regdate').val()==='' || $('#emp_regdate').val()==null){
				$('#empRegdate-error').css('display','block');
				return false;
			}
			
		});

		
	});
				
</script>

</head>
<body>
	<%@ include file="/inc/adminTop.jspf" %>	
	<header>
   <div id="head_img"></div>
   
</header>
<div class="custom-shape-divider-bottom-1634814355">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
        <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
        <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
        <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
    </svg>
</div>
	<nav class="top-banner-nav">
	   <div class="tbn-menu1"><a href="<%=request.getContextPath()%>/employeeManagePage">사원검색</a></div>
	   <div class="tbn-menu2"><a href="<%=request.getContextPath()%>/employeeRegiPage">사원등록</a></div>	   	   
	</nav>
	<main>
	<div class="notice-con">
				<div class="page-main-notice">
					<h3>사원등록</h3>
					<p>사원 정보를 입력해 주세요.</p>
				</div>	
			</div>
		<div class="main-Form-bg">
			<form method="post" action="<%=request.getContextPath()%>/employeeRegister" name="frm">
				<div class="main-form-Con" >
									
					<section class="mf-inputCon" style="top: -19px; left: -325px;">
				
						<div class="mfi-inputbox">
							<strong>가입 확인 절차
								<span>(필수)</span>
							</strong>
							<input type="hidden" value="1" id="idcheck" name="idcheck"/>
							<input type="text" name="userid" id="userid" placeholder="가입한 아이디"/>
							<input type="button" value="가입여부확인" id="joinCheck"/>
							<span id="idcheck-error" class="error-Message">가입여부 확인이 필요합니다.</span>
						</div>	
						<div class="mfi-inputbox">
							<strong>사원명</strong>	
							<input type="text" name="username" id="username" placeholder="사원명" readonly/>
						</div>
						<div class="mfi-inputbox">
							<strong>연락처</strong>
							<div class="mfi-iB-tel">
								<input type="text" id="tel1" name="tel1" readonly>									
								<input type="text" name="tel2" id="tel2" readonly/>
								<input type="text" name="tel3" id="tel3" readonly/>
							</div>
						</div>
						<div class="mfi-inputbox">
							<strong>이메일</strong>
							<input type="email" name="email" id="email" placeholder="이메일" readonly/>
						</div>
					</section>

					<section class="mf-inputCon" style="border-left:1px solid gray;position: absolute;
    right: 380px;
    top: 730px;">
						<div class="mfi-inputbox" style="padding-left: 60px;">
							<strong>부서명
								<span>(필수)</span>
							</strong>
							<select name="dept_num" id="dept_num">
								<option value="7100">품질관리부</option>
								<option value="7000">인사부</option>
								<option value="7300">시설부</option>
								<option value="7200">가맹관리부</option>
								<option value="8000">경영부</option>
							</select>							
						</div>
						<div class="mfi-inputbox" style="padding-left: 60px;">
							<strong>직급
								<span>(필수)</span>
							</strong>	
							<select name="emp_posi" id="emp_posi">
								<option value="사원">사원</option>
								<option value="주임">주임</option>
								<option value="대리">대리</option>
								<option value="과장">과장</option>
								<option value="차장">차장</option>
								<option value="부장">부장</option>
							</select> 						
						</div>
						<div class="mfi-inputbox" style="padding-left: 60px;">
							<strong>입사일</strong>	
							<input name="emp_regdate" id="emp_regdate" placeholder="입사일 선택하기"/>
												
						</div>
						<div class="mfi-inputbox" style="padding-left: 60px; font-size:0.9rem;">
						<span id="empRegdate-error" class="error-Message">입사일을 선택해주세요!</span>		
						</div>						
					</section>
				<div class="regiForm-submit">															
					<input type="submit" id="emp-regi" value="등록하기"/>
				</div>
				</div>
			</form>
		</div>		
	</main>
	<%@ include file="/inc/bottom3.jspf" %>
</body>
</html>