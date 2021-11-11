<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너 등록</title>
<style>
	.main-form-Con{max-width: 570px; margin: 0 auto; padding: 70px 0 50px;}
	.main-form-Con>strong{display: block;font-size: 30px;font-weight: normal;margin:30px auto;text-align: center}
	.mf-inputCon{box-sizing: border-box; max-width: 570px; margin: 0 auto 30px; position: relative;}
	.mfi-img{margin: 0 auto; text-align: center; padding: 30px 20px 0; background: url(img/empimg.png) 50% 100% no-repeat; width: 205px; height: 182px;}
	.mfi-inputbox{height: 130px;background: #fff; padding: 20px 20px; position: relative;}
	.mfi-title{background: #fff; border-bottom: 1px solid #ddd; color: #777; font-size: 18px; line-height: 24px; text-align: center;padding: 30px 20px 30px; margin:0;}
	.mfi-inputbox input{font-size: 0.9rem; border: 0;
    border-bottom: 1px solid #ddd; width:530px; padding:15px;}
	.mfi-inputbox strong{color: #222; display: block; font-size: 18px; margin-bottom: 10px;}
	.mfi-inputbox .mfi-iB-tel select{width:30%; display:inline-block; height:47px; margin-right:20px; border:0; border-bottom: 1px solid #ddd;} 
	.mfi-inputbox .mfi-iB-tel input{width:30%; margin-right:20px;}
	.mfi-inputbox .mfi-iB-tel input:last-of-type{width:30%; margin-right:0px;}
	/* 부서파트 */
	.mfi-inputbox #dept_name{width:460px;}
	.mfi-inputbox #part_code{width:530px; display:inline-block; height:47px; margin-right:20px;border: 0;
    border-bottom: 1px solid #ddd}
	.regiForm-submit{width: 530px; margin: 0 auto 30px; padding:20px 20px;}
	.regiForm-submit #part-regi{transition: 0.6s;margin-left: 45px;width:400px; padding:13px;background: white; border: 1px solid rgb(0,192,239); color: rgb(0,192,239); font-size: 1em}
	.regiForm-submit #part-regi:hover{
     	box-shadow: inset 30em 0 0 0 rgb(0, 163, 239);
		color: white !important;
		border-color: rgb(0, 163, 239);
   }
	
	
	/* 상단 이미지와 네비바 */
	a{color:gray}
    a:link, a:hover a:visited{text-decoration:none;}
    button{background-color:white;cursor:pointer;} 
	 .top-banner-imgCon{background:url(img/managerbannerimg.jpg) no-repeat center; background-size:cover;
   					height:250px;position:relative; min-width:1400px; overflow:hidden;
   	}   
   .top-banner-imgCon .headerText{width:1400px;font-size:3em;color:white;z-index:100;opacity:1; margin:90px auto 0;text-align:center;}
   .top-banner-nav{display:flex;justify-content:center;width:100%;border-bottom:1px solid gray;}
   .top-banner-nav>div{padding:15px 40px;}
   .top-banner-nav>.tbn-menu2{border-bottom:4px solid rgb(0, 163, 239);}
   input[type=text]:focus{
	   	border: 1px solid rgb(0, 163, 239);
		border-bottom: 1px solid rgb(0, 163, 239);
		border-radius: 5px;
   }
   /* 네비바 파트너등록 선택된 파란색 밑줄 */
   .top-banner-nav>.tbn-menu2{border-bottom:4px solid rgb(0, 163, 239);}
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
   #part_code_name{
   font-size: 0.9rem;
    border: 0;
    border-bottom: 1px solid #ddd;
    width: 530px;
    display: inline-block;
    height: 47px;
    margin-right: 20px;
   }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		<div class="tbn-menu1"><a href="<%=request.getContextPath()%>/partnerManagePage">파트너검색</a></div>
		<div class="tbn-menu2"><a href="<%=request.getContextPath()%>/partnerManageRegi">파트너등록</a></div>	   	   
	</nav>
	<main>
	<div class="notice-con">
				<div class="page-main-notice">
					<h3>파트너등록</h3>
					<p>파트너 정보를 입력해 주세요.</p>
				</div>	
			</div>
		
			<form method="post" action="<%=request.getContextPath()%>/partnerRegister" name="frm">
				<div class="main-form-Con">
									
					<section class="mf-inputCon" style="top: -19px; left: -325px;">
					
				
						<div class="mfi-inputbox">
							<strong>담당자명
								<span>(필수)</span>
							</strong>	
							<input type="text" name="part_name" id="part_name" placeholder="파트너명"/>
						</div>
						<div class="mfi-inputbox">
							<strong>연락처
								<span>(필수)</span>
							</strong>
							<div class="mfi-iB-tel">
								<select id="tel1" name="tel1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>								
								</select>
								<input type="text" name="tel2" id="tel2"/>
								<input type="text" name="tel3" id="tel3"/>
							</div>
						</div>
						<div class="mfi-inputbox">
							<strong>이메일
								<span>(필수)</span>
							</strong>
							<input type="email" name="part__email" id="part_email" placeholder="이메일"/>
						</div>
					</section>

					<section class="mf-inputCon" style="border-left:1px solid gray;position: absolute;
    right: 380px;
    top: 730px;">
						<div class="mfi-inputbox" style="padding-left: 60px;">
							<strong>
								<span>분류명(필수)</span>
							</strong>	
							<select name="part_code_name" id="part_code_name">
								<option value="bipum">비품</option>
								<option value="food">식자재</option>
								<option value="transit">운송</option>
								<option value="equipment">설비</option>
							</select>							
						</div>
						<div class="mfi-inputbox" style="padding-left: 60px;">
							<strong>업체명
								<span>(필수)</span>
							</strong>	
							<input type="text" name="part_company" id="part_company" placeholder="업체명"/>							
						</div>
						<div class="mfi-inputbox" style="padding-left: 60px;">
														
						</div>						
					</section>
				<div class="regiForm-submit">					
					<input type="submit" id="part-regi" value="등록하기"/>
				</div>
				</div>
			</form>
		
	</main>

	<%@ include file="/inc/bottom3.jspf" %>
