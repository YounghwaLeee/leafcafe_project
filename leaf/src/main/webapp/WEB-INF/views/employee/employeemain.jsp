<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>

<script>
	const regExpEmpNum = /^[0-9]{1,4}$/;
	const regExpDeptName = /^[가-힣]{1,10}$/;
	
	function listSelect(i,searchKey,searchWord){
											
		let nowPage = i;
			
		//ajax로 검색한 리스트 출력.(라디오버튼,사원번호,사원명,직급,연락처,이메일,입사일,재직여부)
		$.ajax({
		url: "/myapp/empSearch",
		data : "searchKey="+searchKey+"&"+
				"searchWord="+searchWord+"&"+
				"nowPage="+nowPage,	
		success:function(result){ // List<EmployeeVO>
			let empvo = $(result.empvo);
			
			if(empvo.length==0){
				let notSearch = '<div>'+searchWord+'에 대해 0건이 발견되었습니다.</div>';					
				$('#emp-list').html(notSearch);
				$('.page_nation').empty();
			}else{
				let empNumList = '';
				
				empvo.each(function(idx,vo){
					empNumList +='<li><input type="radio" name="emp-select"/></li>'+
								'<li>'+vo.emp_num+'</li>'+
								'<li>'+vo.username+'</li>'+
								'<li>'+vo.dept_name+'</li>'+
								'<li>'+vo.emp_posi+'</li>'+
								'<li>'+vo.tel+'</li>'+
								'<li>'+vo.email+'</li>'+
								'<li>'+vo.emp_regdate+'</li>'+
								'<li>'+vo.emp_status+'</li>';
				});				
				$('#emp-list').html(empNumList);
				
				// 페이징					
				$('.page_nation').empty(); // 버튼을 담을 div를 비워줌
				
				var sk = "'"+result.pvo.searchKey+"'"; //스크립트 메소드의 매개변수 String값을 셋팅시 값으로 인식시켜주기 위함
				var sw = "'"+result.pvo.searchWord+"'";
				
				let nowPageMinerOne = nowPage-1;  // 현재페이지-1
				nowPageMinerOne = "'"+nowPageMinerOne+"'";
								
				let nextBtn = parseInt(nowPage);
				let plusOne = parseInt("1");
				let nowPagePlusOne = parseInt(nextBtn + plusOne);				
				
				////////////////////////////////////
				if(nowPage>1){
					$('.page_nation').append('<a class="arrow pprev" href="javascript:listSelect(1,'+sk+','+sw+')"></a>');
					$('.page_nation').append('<a class="arrow prev" href="javascript:listSelect('+nowPageMinerOne+','+sk+','+sw+')"></a>');					
					
				}else if(nowPage==1){
					$('.page_nation').append('<a class="arrow pprev" href="javascript:listSelect(1,'+sk+','+sw+')"></a>');
					$('.page_nation').append('<a class="arrow prev" href="javascript:listSelect(1,'+sk+','+sw+')"></a>');
										
				}				
				for (var j = result.pvo.startPage; j <=result.pvo.startPage+result.pvo.onePageViewNum-1; j++) {						
					var sk = "'"+result.pvo.searchKey+"'";
					var sw = "'"+result.pvo.searchWord+"'";
					if(j<=result.pvo.totalPage){
						if(j==nowPage){
							$('.page_nation').append('<a class="active" href="javascript:listSelect('+j+','+sk+','+sw+')">'+j+'</a>');
						}else if(j!=nowPage){
							$('.page_nation').append('<a href="javascript:listSelect('+j+','+sk+','+sw+')">'+j+'</a>');						
						}
					}
				}
				if(nowPage==result.pvo.totalPage){
					$('.page_nation').append('<a class="arrow next" href="javascript:listSelect('+result.pvo.totalPage+','+sk+','+sw+')"></a>');					
				}else{
					$('.page_nation').append('<a class="arrow next" href="javascript:listSelect('+nowPagePlusOne+','+sk+','+sw+')"></a>');
				}
				$('.page_nation').append('<a class="arrow nnext" href="javascript:listSelect('+result.pvo.totalPage+','+sk+','+sw+')"></a>');
			}
		}, error:function(){	
			console.log("실패");
			return false;
			}
		}); 			
	}// 자바스크립트 함수
	
	$(()=>{
		// 처음 화면 로그인시
		listSelect(1, '', '');
	
		
		$('#searchEmpBtn').on('click',function(){
			let searchKey = $('#searchKey').val();
			let searchWord = $('#searchWord').val();
			
			if(searchWord===null || searchWord==""){
				alert("검색어를 입력해주세요.");
				return false;
			}else if(searchKey==='emp_num'){
				if(!regExpEmpNum.test(searchWord)){
					alert("사원번호는 4자리 숫자만 입력가능합니다.");
					return false;
				}
			}else if(searchKey==="username"){
				if(!regExpDeptName.test(searchWord)){
					alert("올바른 사원명을 입력해주세요");
					return false;
				}
			}else if(searchKey==="dept_name"){
				if(!regExpDeptName.test(searchWord)){
					alert("올바른 부서명을 입력해주세요");
					return false;
				}
			}			
			let nowPage=1;
			
			$.ajax({
				url: "/myapp/empSearch",
				data : "searchKey="+searchKey+"&"+
						"searchWord="+searchWord+"&"+
						"nowPage="+nowPage,
				success:function(result){
					let empvo = $(result.empvo);
					
					if(empvo.length==0){
						let notSearch = '<div>'+searchWord+'에 대해 0건이 발견되었습니다.</div>';					
						$('#emp-list').html(notSearch);
						$('.page_nation').empty();
					}else{
						let empNumList = '';					
						empvo.each(function(idx,vo){
							empNumList +='<li><input type="radio" name="emp-select"/></li>'+
										'<li>'+vo.emp_num+'</li>'+
										'<li>'+vo.username+'</li>'+
										'<li>'+vo.dept_name+'</li>'+
										'<li>'+vo.emp_posi+'</li>'+
										'<li>'+vo.tel+'</li>'+
										'<li>'+vo.email+'</li>'+
										'<li>'+vo.emp_regdate+'</li>'+
										'<li>'+vo.emp_status+'</li>';						
						}); // empvo.each문
						
						$('#emp-list').html(empNumList);
						
										
						// 페이징					
						$('.page_nation').empty(); // 버튼을 담을 div를 비워줌
						
						var sk = "'"+result.pvo.searchKey+"'"; //스크립트 메소드의 매개변수 String값을 셋팅시 값으로 인식시켜주기 위함
						var sw = "'"+result.pvo.searchWord+"'";
						
						let nowPageMinerOne = nowPage-1;  // 현재페이지-1
						nowPageMinerOne = "'"+nowPageMinerOne+"'";
										
						let nextBtn = parseInt(nowPage);
						let plusOne = parseInt("1");
						let nowPagePlusOne = parseInt(nextBtn + plusOne);				
						
						////////////////////////////////////
						if(nowPage>1){
							$('.page_nation').append('<a class="arrow pprev" href="javascript:listSelect(1,'+sk+','+sw+')"></a>');
							$('.page_nation').append('<a class="arrow prev" href="javascript:listSelect('+nowPageMinerOne+','+sk+','+sw+')"></a>');					
							
						}else if(nowPage==1){
							$('.page_nation').append('<a class="arrow pprev" href="javascript:listSelect(1,'+sk+','+sw+')"></a>');
							$('.page_nation').append('<a class="arrow prev" href="javascript:listSelect(1,'+sk+','+sw+')"></a>');
												
						}				
						for (var j = result.pvo.startPage; j <=result.pvo.startPage+result.pvo.onePageViewNum-1; j++) {						
							var sk = "'"+result.pvo.searchKey+"'";
							var sw = "'"+result.pvo.searchWord+"'";
							if(j<=result.pvo.totalPage){
								if(j==nowPage){
									$('.page_nation').append('<a class="active" href="javascript:listSelect('+j+','+sk+','+sw+')">'+j+'</a>');
								}else if(j!=nowPage){
									$('.page_nation').append('<a href="javascript:listSelect('+j+','+sk+','+sw+')">'+j+'</a>');						
								}
							}
						}
						if(nowPage==result.pvo.totalPage){
							$('.page_nation').append('<a class="arrow next" href="javascript:listSelect('+result.pvo.totalPage+','+sk+','+sw+')"></a>');					
						}else{
							$('.page_nation').append('<a class="arrow next" href="javascript:listSelect('+nowPagePlusOne+','+sk+','+sw+')"></a>');
						}
						$('.page_nation').append('<a class="arrow nnext" href="javascript:listSelect('+result.pvo.totalPage+','+sk+','+sw+')"></a>');
					
						
					}
					
										
					
				},error:function(){
					console.log("검색 불러오기 실패");
					return false;
				}		
			});

		});// 검색 클릭이벤트

		
		////////////////////////////////
		$(document).on('click','input[name=emp-select]',function(){
			let selectEmpNum = $(this).parent().next().text();
			
			$('#empChange').click(function(){
				
				function empChangeGo(emp_num){
					let empForm = document.createElement('form');
					empForm.setAttribute('method','post');
					empForm.setAttribute('action','/myapp/employeeChange');
					
					let empValue;
					empValue = document.createElement('input');
					empValue.setAttribute('type','hidden');
					empValue.setAttribute('name','emp_num');
					empValue.setAttribute('value',emp_num);
					
					empForm.appendChild(empValue);
					document.body.appendChild(empForm);
					empForm.submit();
				}
				empChangeGo(selectEmpNum);
			});
		});
			
	});		

</script>

<style>
	/* 사원 컨테이너 */
	.emplistCon{height:650px; overflow:scroll;}
	/* ------------------ */
		
	/*사원 검색폼*/
	
	.searchWord-titleImg{height:100px; width:300px; display: inline-block; margin-left:220px; margin-top:15px;}
	.searchWord-title{font-size:1.4em; display:inline-block; position:relative; top:6px; left:35px;}	
	#searchForm{width: 730px; height: 60px; margin: 0 auto;}
	select[name=searchKey]{height:50px; width:100px; font-size:1em;border:0;}
	input[name="searchWord"]{padding-left: 20px;height:50px; width:500px; font-size:1em;border:0;border-bottom: 1px solid #ddd;

	}
	#searchEmpBtn{height:50px; width:100px; box-sizing: border-box; font-size:0.9em;background:white;}
	
	
	
	
	
	/* 사원리스트 top */
	.manage-List-container{width:1400px; height:900px; margin:50px auto 0 auto;}	
 	#emp-list-top{border-bottom: 2px solid lightblue;overflow:auto; text-align:center; padding:0; height:50px; font-size:0.9rem; line-height:45px;}
	#emp-list-top>li{float:left; width:10%; border-top:3px solid gray;}
	#emp-list-top>li:nth-child(9n+1){width:3%;}
	#emp-list-top>li:nth-child(9n+2){width:7%;}
	#emp-list-top>li:nth-child(9n+5){width:10%;}	
	#emp-list-top>li:nth-child(9n+6){width:15%;}
	#emp-list-top>li:nth-child(9n+7){width:20%;}
	#emp-list-top>li:nth-child(9n+8){width:15%;}
	 
	/*사원 리스트*/
	.manage-listCon{overflow:auto; text-align:center; padding:0; margin-top:70px;}
	#emp-list{font-size: 0.9rem;}
	#emp-list>li{float:left; width:10%; border-bottom: 1px solid #ddd; height:50px; font-size:1.1em; line-height:50px;}
	#emp-list>li:nth-child(9n+1){width:3%;}
	#emp-list>li:nth-child(9n+2){width:7%;}
	#emp-list>li:nth-child(9n+5){width:10%;}
	#emp-list>li:nth-child(9n+6){width:15%;}
	#emp-list>li:nth-child(9n+7){width:20%; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;}
	#emp-list>li:nth-child(9n+8){width:15%;}		
	
	/*================================================*/
	
	/* 페이징 번호*/
	.page_wrap {text-align:center; font-size:0; height:30px; margin-top: 20px; position:relative;}
	.page_nation {display:inline-block; position:relative;}
	.page_nation a {display:block; margin:0 3px; float:left; border:1px solid #e6e6e6; width:28px;
					height:28px; line-height:28px; text-align:center; background-color:#fff; font-size:13px;
					color:#999999; text-decoration:none;}
	.page_nation .arrow {border:1px solid #ccc;}
	.page_nation .pprev {background:#f8f8f8 url('img/page_pprev.png') no-repeat center center; margin-left:0;}
	.page_nation .prev {background:#f8f8f8 url('img/page_prev.png') no-repeat center center; margin-right:7px;}
	.page_nation .next {background:#f8f8f8 url('img/page_next.png') no-repeat center center; margin-left:7px;}
	.page_nation .nnext {background:#f8f8f8 url('img/page_nnext.png') no-repeat center center; margin-right:0;}
	.page_nation a.active {background-color:#42454c; color:#fff; border:1px solid #42454c;}
	
	/* 사원 등록, 수정버튼 */
	.emp-button{display:inline-block; position:absolute; left:1280px;}	
	#empChange{line-height: 33px;
    text-align: center;
      background-color: white;
	    width: 110px;
	    height: 35px;
	    border-radius: 2px;
	    border: 1px solid rgb(0, 163, 239);
	    font-size: 0.9rem;
	    color: rgb(0, 163, 239);
	    margin-left: 7px;
	    transition: 0.4s;
	    padding-left: 0px;}
	#empChange:hover{
      cursor: pointer;
      box-shadow: inset 30em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);
   }
	/* 네비바 사원검색 선택된 파란색 밑줄 */
   .top-banner-nav>.tbn-menu1{border-bottom:4px solid rgb(0, 163, 239);}	
#head_img{
      background-image:url(img/employeee.jpeg);
      z-index:-1;
      width:100%;
      height:330px;
      background-size: 100%;
    background-position-y: 390px;
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
	
	<!-- 메인부 -->
	<!-- <form method="post" action="<%=request.getContextPath()%>/employeeChange">   -->		
		<main>	
			<div class="notice-con">
				<div class="page-main-notice">
					<h3>사원관리</h3>
					<p>사원 정보를 확인하실 수 있습니다.</p>
				</div>	
			</div>
			<div class="manage-List-container">
				<!-- 회원 검색폼 -->
				<div class="emptopCon">
					<div id="searchForm">
						<select name="searchKey" id="searchKey">
							<option value="emp_num">사원번호</option>
							<option value="username">사원명</option>
							<option value="dept_name">부서명</option>
						</select>
						<input type="text" name="searchWord" id="searchWord"/>
						<input type="button" value="검색하기" id="searchEmpBtn"/>
					</div>
				</div>

				<!-- 사원 리스트 -->
				<div class="manage-listCon">											
					<ul id="emp-list-top">
						<li><i class="fas fa-check"></i></li>				
						<li>NO</li>
						<li>사원명</li>
						<li>부서명</li>
						<li>직급</li>
						<li>연락처</li>
						<li>E-mail</li>
						<li>입사일</li>
						<li>재직여부</li>
					</ul>
					<ul id="emp-list">																	
					</ul>				
				</div>
				<!-- 페이징 버튼 -->
				<div class="page_wrap">
					<!-- 사원등록 -->
					<div class="emp-button">					
						<input type="button" value="사원수정" name="empChange" id="empChange"/>
					</div>
					<div class="page_nation">
					</div>
				</div>	
			</div>
		</main>
<!-- 	</form>  -->

	
	
	<%@ include file="/inc/bottom3.jspf" %>
