<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업문의</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>	
	const regExpUserName = /^[가-힣]{1,10}$/;
 	let oq_status = 0; // 답변대기 체크박스 클릭
	 
	function listSelect(i,searchKey,searchWord,oq_status){									
		let nowPage = i;

		//ajax로 검색한 리스트 출력.(라디오버튼,사원번호,사원명,직급,연락처,이메일,입사일,재직여부)
		$.ajax({			
		url: "/myapp/openQuestionSearch",
		data : "searchKey="+searchKey+"&"+
				"searchWord="+searchWord+"&"+
				"nowPage="+nowPage+"&"+
				"oq_status="+oq_status,
		success:function(result){

			let openvo = $(result.openvo);

			
			if(openvo.length==0){
				let notSearch = '<div>'+searchWord+'에 대해 0건이 발견되었습니다.</div>';					
				$('#open-list').html(notSearch);
				$('.page_nation').empty();
			}else{
				let openList = '';
				
				openvo.each(function(idx,vo){
					openList +='<li><input type="radio" name="regi-select"/></li>'+
					'<li>'+vo.oq_num+'</li>'+
					'<li>'+vo.content+'</li>'+
					'<li>'+vo.username+'</li>'+
					'<li>'+vo.writedate+'</li>'+
					'<li>'+vo.oq_status+'</li>';
				});				
				$('#open-list').html(openList);
				
				// 페이징					
				$('.page_nation').empty();
				
				
				let sk1 = "'"+result.pvo.searchKey+"'"; 
				let sw1 = "'"+result.pvo.searchWord+"'";
				let st1 = "'"+result.pvo.oq_status+"'";
				
				let nowPageMinerOne = nowPage-1;  // 현재페이지-1
				nowPageMinerOne = "'"+nowPageMinerOne+"'";
								
				let nextBtn = parseInt(nowPage);
				let plusOne = parseInt("1");
				let nowPagePlusOne = parseInt(nextBtn + plusOne);				
				
				////////////////////////////////////
				if(nowPage>1){
					$('.page_nation').append('<a class="arrow pprev" href="javascript:listSelect(1,'+sk1+','+sw1+','+st1+')"></a>');
					$('.page_nation').append('<a class="arrow prev" href="javascript:listSelect('+nowPageMinerOne+','+sk1+','+sw1+','+st1+')"></a>');

					
				}else if(nowPage==1){
					$('.page_nation').append('<a class="arrow pprev" href="javascript:listSelect(1,'+sk1+','+sw1+','+st1+')"></a>');
					$('.page_nation').append('<a class="arrow prev" href="javascript:listSelect(1,'+sk1+','+sw1+','+st1+')"></a>');

										
				}				
				for (var j = result.pvo.startPage; j <=result.pvo.startPage+result.pvo.onePageViewNum-1; j++) {						
					let sk2 = "'"+result.pvo.searchKey+"'";
					let sw2 = "'"+result.pvo.searchWord+"'";
					let st2 = "'"+result.pvo.oq_status+"'";
					
					
					if(j<=result.pvo.totalPage){
						if(j==nowPage){
							$('.page_nation').append('<a class="active" href="javascript:listSelect('+j+','+sk2+','+sw2+','+st2+')">'+j+'</a>');

						}else if(j!=nowPage){
							$('.page_nation').append('<a href="javascript:listSelect('+j+','+sk2+','+sw2+','+st2+')">'+j+'</a>');

						}
					}
				}
				if(nowPage==result.pvo.totalPage){
					$('.page_nation').append('<a class="arrow next" href="javascript:listSelect('+result.pvo.totalPage+','+sk1+','+sw1+','+st1+')"></a>');

				}else{
					$('.page_nation').append('<a class="arrow next" href="javascript:listSelect('+nowPagePlusOne+','+sk1+','+sw1+','+st1+')"></a>');

				}
				$('.page_nation').append('<a class="arrow nnext" href="javascript:listSelect('+result.pvo.totalPage+','+sk1+','+sw1+','+st1+')"></a>');

			}
		}, error:function(){	
			console.log("실패");
			return false;
			}
		}); 			
	}// 자바스크립트 함수
	
	$(()=>{
		let searchKey='';
		let searchWord='';
		let oq_status=0;
		$('#ck').change(function(){
			if($('#ck').is(':checked')){				
				oq_status=1;
				listSelect(1,searchKey,searchWord,oq_status);
			}else{				
				oq_status=0;
				listSelect(1, searchKey,searchWord,oq_status);	
			}
		});
		
		
		listSelect(1, searchKey,searchWord,oq_status);	
		
		$('#searchWord').on('keyup',function(e){
			
			if(e.keyCode ===13){ // 검색창에서 엔터눌렀을 때			
			
				searchKey = $('#searchKey').val();
				searchWord = $('#searchWord').val();
				
				if(searchWord===null || searchWord==""){
					alert("검색어를 입력해주세요.");					
					return false;
					
				}else if(searchKey==="username"){
					if(!regExpUserName.test(searchWord)){
						alert("올바른 회원명을 입력해주세요");
						return false;
					}
				}
				
				let nowPage=1;
				
				$.ajax({
					url: "/myapp/openQuestionSearch",
					data : "searchKey="+searchKey+"&"+
							"searchWord="+searchWord+"&"+
							"nowPage="+nowPage+"&"+
							"oq_status="+oq_status,
					success:function(result){
						let openvo = $(result.openvo);
						
						if(openvo.length==0){
							let notSearch = '<div>'+searchWord+'에 대해 0건이 발견되었습니다.</div>';					
							$('#open-list').html(notSearch);
							$('.page_nation').empty();
						}else{
						
							let openList = '';					
							openvo.each(function(idx,vo){
								openList +='<li><input type="radio" name="regi-select"/></li>'+
											'<li>'+vo.oq_num+'</li>'+
											'<li>'+vo.content+'</li>'+
											'<li>'+vo.username+'</li>'+
											'<li>'+vo.writedate+'</li>'+
											'<li>'+vo.oq_status+'</li>';															
							}); // openvo.each문						
							$('#open-list').html(openList);
							
											
							// 페이징					
							$('.page_nation').empty(); 
							
							var sk = "'"+result.pvo.searchKey+"'"; 
							var sw = "'"+result.pvo.searchWord+"'";
							var st = "'"+result.pvo.oq_status+"'";

							
							let nowPageMinerOne = nowPage-1; 
							nowPageMinerOne = "'"+nowPageMinerOne+"'";
											
							let nextBtn = parseInt(nowPage);
							let plusOne = parseInt("1");
							let nowPagePlusOne = parseInt(nextBtn + plusOne);				
							
							
							if(nowPage>1){
								$('.page_nation').append('<a class="arrow pprev" href="javascript:listSelect(1,'+sk+','+sw+','+st+')"></a>');
								$('.page_nation').append('<a class="arrow prev" href="javascript:listSelect('+nowPageMinerOne+','+sk+','+sw+','+st+')"></a>');					
								
							}else if(nowPage==1){
								$('.page_nation').append('<a class="arrow pprev" href="javascript:listSelect(1,'+sk+','+sw+','+st+')"></a>');
								$('.page_nation').append('<a class="arrow prev" href="javascript:listSelect(1,'+sk+','+sw+','+st+')"></a>');
													
							}				
							for (var j = result.pvo.startPage; j <=result.pvo.startPage+result.pvo.onePageViewNum-1; j++) {

								if(j<=result.pvo.totalPage){

									if(j==nowPage){
										$('.page_nation').append('<a class="active" href="javascript:listSelect('+j+','+sk+','+sw+','+st+')">'+j+'</a>');
									}else if(j!=nowPage){
										$('.page_nation').append('<a href="javascript:listSelect('+j+','+sk+','+sw+','+st+')">'+j+'</a>');						
									}
								}
							}
							if(nowPage==result.pvo.totalPage){
								$('.page_nation').append('<a class="arrow next" href="javascript:listSelect('+result.pvo.totalPage+','+sk+','+sw+','+st+')"></a>');					
							}else{
								$('.page_nation').append('<a class="arrow next" href="javascript:listSelect('+nowPagePlusOne+','+sk+','+sw+','+st+')"></a>');
							}
							$('.page_nation').append('<a class="arrow nnext" href="javascript:listSelect('+result.pvo.totalPage+','+sk+','+sw+','+st+')"></a>');
					
						}					
						
					},error:function(){
						console.log("검색 불러오기 실패");
						return false;
					}		
				});
	
			}// 검색 엔터키 눌렀을 때
		});// 검색 클릭이벤트


		$(document).on('click','input[name=regi-select]',function(){
			let selectRecordNum = $(this).parent().next().text();
			
			$('#openReply').click(function(){
				
				function openReplyGo(oq_num){
					let openForm = document.createElement('form');
					openForm.setAttribute('method','post');
					openForm.setAttribute('action','/myapp/openReplyView');					
					
					let openValue = document.createElement('input');
					openValue.setAttribute('type','hidden');
					openValue.setAttribute('name','oq_num');
					openValue.setAttribute('value',oq_num);
					
					openForm.appendChild(openValue);
					document.body.appendChild(openForm);
					openForm.submit();
				}
				openReplyGo(selectRecordNum);
			});
		});
			
	});
	
	function replyClick(){
		let recordSelect = $('input[name=regi-select]');
		if(!recordSelect.is(':checked')){
			alert("답변할 게시글을 선택해주세요.");
			return false;
		}
	}

</script>
<style>
	/* 사원 컨테이너 */
	.emplistCon{height:650px; overflow:scroll;}
	/* ------------------ */
	/* 창업문의 타이틀 */
	.page-main-notice{text-align:center;}
	.page-main-notice>h3{font-size:2em; color:#333; font-weight:700; margin-bottom:20px;}
	.page-main-notice>p{font-size:1em;}
	.page-main-notice>p:after{display:block; width:35px; border-bottom:2px solid rgb(0, 128, 192); content:''; margin:20px auto 0;}
	
	
	/*창업문의  검색폼*/
	.emptopCon{height:100px; text-align:center; margin-top:50px;}
	#openImg{height:100px; width:300px; display: inline-block; margin-left:220px; margin-top:10px;}
	#openImgWord{font-size:1.4em; display:inline-block; position:relative; top:6px; left:35px;}	
	#searchForm{display: inline-block; width: 730px; height: 60px; position:relative;}
	select[name="searchKey"]{height:50px; width:100px; font-size:0.9rem;border:0;}
	input[name="searchWord"]{padding-left: 20px;height:50px; width:500px; font-size:0.9rem;border:0;border-bottom: 1px solid #ddd;}
	input[value="Search"]{height:50px; width:100px; box-sizing: border-box; font-size:0.9em;background:white;}
	input[name=oq_status]{margin:30px 0px 0px 1237px;font-size:0.9em;}
	
	/* 창업문의 리스트 정렬 select박스 */
	.array_button{width:1400px; height:80px;}
	.array_button>label{font-size:0.9rem; margin-left:10px;}
	input[name='replyStateView']{width:16px; height:16px; display:inline-block; margin:40px 0 0 1230px;}
	
	/* 창업문의 리스트 top */
	#open-list-container{width:1400px; height:1000px; margin:50px auto 0 auto;}
	#open-list-top{overflow:auto; text-align:center; padding:0; height:50px; font-size:0.9rem; line-height:45px; border-bottom: 2px solid lightblue; }
	#open-list-top>li{float:left; width:10%; border-top:3px solid black;}
	#open-list-top>li:nth-child(6n+3){width:40%;}
	#open-list-top>li:nth-child(6n+5){width:20%;}
	
	/*창업문의 리스트*/
	#open-list{overflow:auto; text-align:center; padding:0;}
	#open-list>li{float:left; width:10%; border-bottom: 1px solid #ddd; height:50px; font-size:0.9rem; line-height:50px;white-space:nowrap; text-overflow:ellopsis; overflow:hidden;}
	#open-list>li:nth-child(6n+3){width:40%; text-align:center; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
	#open-list>li:nth-child(6n+5){width:20%; text-align:center; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
	
	
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
	#openReply{line-height: 33px;
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
	    #openReply:hover{
      cursor: pointer;
      box-shadow: inset 30em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);
   }
	
	/* 네비바 창업문의목록 선택된 파란색 밑줄 */
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
	   <div class="tbn-menu1"><a href="<%=request.getContextPath()%>/openQuestionPage">창업문의목록</a></div>	   	   	   
	</nav>
	<!-- 메인부 -->
 	
	<main>
		<div id="open-list-container">
			<div class="page-main-notice">
				<h3>창업문의</h3>
				<p>LEAF커피 창업문의 내용을 보실 수 있습니다.</p>
			</div>						
			<!-- 회원 검색폼 -->
			<div class="emptopCon">
				
				<div id="searchForm">
					<select name="searchKey" id="searchKey">
						<option value="username">작성자</option>
						<option value="content">내용</option>						
					</select>
					<input type="text" name="searchWord" id="searchWord"/>
					<input type="button" value="Search"/>
				</div>
			</div>
			<div class="array_button">
				<!-- 리스트 출력방식 CheckBox -->				
				<input type="checkbox" name="oq_status" value="1" id="ck"/><label for="ck">답변대기만 보기</label>													
			</div>
			<!-- 사원 리스트 -->
			<div id="emplistCon">								
				<ul id="open-list-top">
					<li>선택</li>				
					<li>NO</li>
					<li>내용</li>
					<li>작성자</li>
					<li>등록일</li>
					<li>답변상태</li>					
				</ul>
				<ul id="open-list">	
					<li><input type="radio" id="regi-select" name="regi-select"/></li>
					<li>1</li>
					<li><a href="#">구미에서 점포를 내고 싶은데</a></li>
					<li>이형화</li>
					<li>2021-09-02</li>
					<li>답변완료</li>									
					<!--  -->					
				</ul>				
			</div>
			<!-- 페이징 버튼 -->
			<div class="page_wrap">
				<!-- 사원등록 -->
				<div class="emp-button">
					<input type="submit" value="자세히보기" name="openReply" id="openReply" onclick="replyClick()"/>					
				</div>
				<div class="page_nation">
				</div>
			</div>	
		</div>
	</main>

	
<%@ include file="/inc/bottom3.jspf" %>
