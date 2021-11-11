<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너관리</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	const regExpEmpNum = /^[0-9]{1,4}$/;
	const regExpDeptName = /^[가-힣]{1,10}$/;
	
	function listSelect(i,searchKey,searchWord){
											
		let nowPage = i;
			
		//ajax로 검색한 리스트 출력.(라디오버튼,사원번호,사원명,직급,연락처,이메일,입사일,재직여부)
		$.ajax({
		url: "/myapp/partSearch",
		data : "searchKey="+searchKey+"&"+
				"searchWord="+searchWord+"&"+
				"nowPage="+nowPage,	
		success:function(result){ // List<EmployeeVO>
			let partvo = $(result.partvo);
			
			if(partvo.length==0){
				let notSearch = '<div>'+searchWord+'에 대해 0건이 발견되었습니다.</div>';					
				$('#emp-list').html(notSearch);
				$('.page_nation').empty();
			}else{
				let partNumList = '';
				
				partvo.each(function(idx,vo){
					partNumList +='<li><input type="radio" name="emp-select"/></li>'+
								'<li>'+vo.part_num+'</li>'+
								'<li>'+vo.part_code_name+'</li>'+
								'<li>'+vo.part_company+'</li>'+
								'<li>'+vo.part_name+'</li>'+
								'<li>'+vo.part_tel+'</li>'+
								'<li>'+vo.part_email+'</li>'+
								
								'<li>'+vo.part_regdate+'</li>';
				});				
				$('#emp-list').html(partNumList);
				
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
			}		
			let nowPage=1;
			
			$.ajax({
				url: "/myapp/partSearch",
				data : "searchKey="+searchKey+"&"+
						"searchWord="+searchWord+"&"+
						"nowPage="+nowPage,
				success:function(result){
					let partvo = $(result.partvo);
					
					if(partvo.length==0){
						let notSearch = '<div>'+searchWord+'에 대해 0건이 발견되었습니다.</div>';					
						$('#emp-list').html(notSearch);
						$('.page_nation').empty();
					}else{
						let partNumList = '';					
						partvo.each(function(idx,vo){
							partNumList +='<li><input type="radio" name="emp-select"/></li>'+
										'<li>'+vo.part_num+'</li>'+
										'<li>'+vo.part_code_name+'</li>'+
										'<li>'+vo.part_company+'</li>'+
										'<li>'+vo.part_name+'</li>'+
										'<li>'+vo.part_tel+'</li>'+
										'<li>'+vo.part_email+'</li>'+
										
										'<li>'+vo.part_regdate+'</li>';
						}); // empvo.each문
						
						$('#emp-list').html(partNumList);
						
										
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
			
			$('#partnerChange').click(function(){
				
				function empChangeGo(part_num){
					let empForm = document.createElement('form');
					empForm.setAttribute('method','post');
					empForm.setAttribute('action','/myapp/partnerChange');
					
					let empValue;
					empValue = document.createElement('input');
					empValue.setAttribute('type','hidden');
					empValue.setAttribute('name','part_num');
					empValue.setAttribute('value',part_num);
					
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
	.manage-listCon{overflow:auto; text-align:center; padding:0;}
	/* ------------------ */
		
	/*사원 검색폼*/
	.emptopCon{height:100px;}
	
	#searchForm{width: 730px; height: 60px; margin: 0 auto;}
	select[name=searchEmpSelect]{height:50px; width:100px; font-size: 0.9rem; border:0; border-bottom:1px solid #ddd;}
	select[name=searchKey]{height:50px; width:100px; font-size:0.9em;border:0;}
	input[name="searchWord"]{padding-left: 20px;height:50px; width:500px; font-size:1em;border:0;border-bottom: 1px solid #ddd;}
	#searchButton{height:50px; width:100px; box-sizing: border-box; font-size:0.9em;background:white;}
	
	/* 사원 리스트 정렬 select박스 */
	.array_button{width:1400px; height:80px;}
	select[name=empArraySelect]{font-size:0.9rem; display:inline-block; width:100px; height:40px; position:relative; left:1300px; top:20px;}
	
	/* 사원리스트 top */
	.manage-list-container{width:1400px; height:800px; margin:50px auto 0 auto;}
	#emp-list-top{border-bottom: 2px solid lightblue; overflow:auto; text-align:center; padding:0; height:50px; font-size:0.9rem; line-height:45px;}
	#emp-list-top>li{font-size:0.9rem; float:left; width:10%; border-top:3px solid black;}
	#emp-list-top>li:nth-child(8n+1){width:3%;}
	#emp-list-top>li:nth-child(8n+2){width:7%;}
	#emp-list-top>li:nth-child(8n+5){width:15%;}	
	#emp-list-top>li:nth-child(8n+6){width:25%;}
	#emp-list-top>li:nth-child(8n+7){width:20%;}
	/*사원 리스트*/
	#emp-list{overflow:auto; text-align:center; padding:0;font-size:0.9rem;}
	#emp-list>li{float:left; width:10%; border-bottom: 1px solid black; height:50px; font-size:0.9rem; line-height:50px;}
	#emp-list>li:nth-child(8n+1){width:3%;}
	#emp-list>li:nth-child(8n+2){width:7%;}
	#emp-list>li:nth-child(8n+5){width:15%;}
	#emp-list>li:nth-child(8n+6){width:25%;}
	#emp-list>li:nth-child(8n+7){width:20%;}
	
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
	
	/* 파트너 등록, 수정버튼 */
	.emp-button{display:inline-block; position:absolute; left:1280px;}	
	#partnerChange{line-height: 33px;
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
 #partnerChange:hover{
    cursor: pointer;
    box-shadow: inset 30em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);
  }
	
	/* 네비바 파트너검색 선택된 파란색 밑줄 */
   .top-banner-nav>.tbn-menu1{border-bottom:4px solid rgb(0, 163, 239);}	
</style>
</head>
<body>
	<%@ include file="/inc/adminTop.jspf" %>
	<div class=top-banner-imgCon></div>
	<nav class="top-banner-nav">
		<div class="tbn-menu1"><a href="<%=request.getContextPath()%>/partnerManagePage">파트너검색</a></div>
		<div class="tbn-menu2"><a href="<%=request.getContextPath()%>/partnerRegiPage">파트너등록</a></div>	   
	</nav>
	<!-- 메인부 -->
	<main>
		<div class="notice-con">
			<div class="page-main-notice">
				<h3>파트너 관리</h3>
				<p>파트너 정보를 확인하실 수 있습니다.</p>
			</div>	
		</div>
		<div class="manage-list-container">
			<!-- 협력업체 검색폼 -->
			<div class="emptopCon">
				
				<div id="searchForm">
					<select name="searchKey" id="searchKey">
						<option value="part_company">업체명</option>
						<option value="part_name">담당자</option>						
					</select>
					<input type="text" name="searchWord" id="searchWord"/>
					<input type="button" value="검색하기" id="searchButton"/>
				</div>
			</div>
			<!-- 협력헙체 리스트 -->
			<div class="manage-listCon">								
				<ul id="emp-list-top">
					<li>선택</li>				
					<li>파트너번호</li>
					<li>분류명</li>
					<li>업체명</li>
					<li>담당자</li>
					<li>연락처</li>
					<li>이메일</li>
					<li>등록일</li>
				</ul>
				<ul id="emp-list">	
					
				</ul>
				
			</div>
			<!-- 페이징 버튼 -->
			<div class="page_wrap">
				<!-- 사원등록 -->
				<div class="emp-button">					
					<input type="button" value="파트너수정" name="partnerChange" id="partnerChange"/>
				</div>
				<div class="page_nation">
					
				</div>
			</div>	
		</div>
	</main>

	
	<%@ include file="/inc/bottom3.jspf" %>