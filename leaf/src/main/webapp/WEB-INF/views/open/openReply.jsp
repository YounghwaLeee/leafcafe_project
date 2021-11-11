<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업문의 답변</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	/* 네비바 파트너등록 선택된 파란색 밑줄 */
   .top-banner-nav>.tbn-menu2{border-bottom:4px solid rgb(0, 163, 239);}

	/*  창업문의자 정보 */
	.open-question-main{width:1400px; margin:0 auto;}
	.open-question-info{width:100%; margin:0 auto;}
	.open-question-info>h3{margin:50px auto 50px auto; text-align:center; font-size:2em;}
	.oqi-Con{width:100%; height:135px; border:1px solid gray;border-radius: 3px; box-sizing: border-box; margin:0 auto;}
	.oqi-Con .oqi-img{margin:0 auto; padding:30px 20px 0; background:url(img/empimg.png) 50% 100% no-repeat; width:200px; height:100px;}
	.oqi-Con .oqi-img+p{text-align:center; font-size:25px;} 
	.oqi-Con .oqi-box{background: #fff; padding: 20px 20px; position: relative;    width: 349px;
    float: left;}
	.oqi-box .oqi-title{padding-left: 5px;color: #222; display: block; font-size: 18px; margin-bottom: 10px;}
	.oqi-box .oqi-info{font-size: 0.9rem;border-bottom: 1px solid #ddd; box-sizing: border-box; display: inline-block; width:320px; padding:12px;}
	
	/* 창업문의 내용 */
	.open-write-ct:before{display:block; width:1400px; border-bottom:2px solid rgb(0, 128, 192); content:''; margin:80px auto 0;}
	.open-write-ct{width:1400px; margin:0 auto;}
	.open-write-ct h2 {margin:30px 0 0 100px;}
	.owc{width:1200px; margin:50px auto; border-top:3px solid gray; height:800px;}
	.owc-ct{overflow:auto;}
	.owc-ct li{float:left; border-bottom:1px solid gray; width:20%; height:25px; font-size:1em;text-align:center;font-family: 'Noto Sans KR';box-sizing: content-box;}
	
	.owc-ct li:nth-child(2n+1){border-right: 1px solid #ddd;padding:15px;clear:both;font-weight:600;}	
	.owc-ct li:nth-child(2n){width:74%; padding:15px;}
	.owc-ct li:nth-child(5){height:130px;}
	.owc-ct li:nth-child(6){height:130px;}
	.owc-ct li:nth-child(11){height:270px;}
	.owc-ct li:nth-child(12){height:270px; position:relative}
	.owc-ct li:nth-child(13){height:270px;}
	.owc-ct li:nth-child(14){height:270px; position:relative}
	.owc-ct li input[type=text]{border:0px solid; text-align:center; width:100%; height:100%;}
	
	#lastdatelabel{height:25px;}
	#lastdatevalue{height:25px;}	
	.owc-ct .rpcontent{resize:none; background:#fff; width:95%; height:220px; line-height:35px; font-size:1.2em;
					border-collapse:collapse; border:1px solid gray; text-align:left;
	}	
	.owc-ct #text-count{font-size:1.3em;float:right; margin:10px 20px;font-family: 'Noto Sans KR';}
	.owc-ct #replywritebtn{line-height: 38px; text-align: center; background-color: white; width: 150px; height: 40px; border-radius: 2px;
	    border: 1px solid rgb(0, 163, 239); font-size: 0.9rem; color: rgb(0, 163, 239); transition: 0.4s; padding-left: 0px; position:absolute; left:385px; top:247px;}
	#replywritebtn:hover{cursor: pointer; box-shadow: inset 30em 0 0 0 rgb(0, 163, 239); color: white; border-color: rgb(0, 163, 239);}
	#rpconlabel{border:0px;}
	input[type=button]{width:100px; height:35px;border: 0px solid; background: rgb(0,192,239); color: #fff; font-weight: bold;
				box-sizing: border-box; position:relative; top:20px; left:966px;
	}
	input[value="삭제하기"], input[value="취소하기"]{margin-left:30px;}
	input:focus{outline:none;}
	input[type=text]{readonly:readonly;}
	#rpcon{border:0;}
	#content{resize: none; border:0px; width:100%; height:100%; text-align:center;}
	#content:focus{outline:none;}
	#openreplyfrm{font-size:0.9rem;}	
	#openListGoBtn{line-height: 38px; text-align: center; background-color: white; width: 150px; height: 40px; border-radius: 2px;
	    border: 1px solid rgb(0, 163, 239); font-size: 0.9rem; color: rgb(0, 163, 239); margin:30px 0px 0px 1040px; transition: 0.4s; padding-left: 0px; display:inline-block;}
	#openListGoBtn:hover{cursor: pointer; box-shadow: inset 30em 0 0 0 rgb(0, 163, 239); color: white;border-color: rgb(0, 163, 239);}
	#replyOkListGo{position:absolute; left:500px; top: 300px;}
	#replyOkopenListGoBtn{display:inline-block; width:100px; height:35px; position:absolute; background-color: rgb(0, 192, 239); top:1667px; left:1187px; color:#fff; text-align:center;
							font-weight:600; padding:7px;
	}    	
</style>
<script>	
	let regex = /<br\s*[\/]?>/gi;

	$(()=>{
		
		function openReplyStart(){ // 처음시작
			
			let openOqNum = 'oq_num=${oqVo.oq_num}';			
			$.ajax({				
				url:'/myapp/openReplyView',
				data:openOqNum,				
				success:function(result){
 
					let tag="";					
						tag += "<form method='post' id='openreplyfrm'>";
						tag += "<li>문의번호</li>";
						tag += "<li><input type='text' name='oq_num' value='${oqVo.oq_num}'></li>";
						tag += "<li>등록일</li>";
						tag += "<li><input type='text' name='writedate' value='${oqVo.writedate}'/></li>";
						tag += "<li>내용</li>";			
						tag += "<li><textarea name='content' id='content'>";
						let realcontent= '${oqVo.content}';
						realcontent = realcontent.replace(regex,"\r\n");
						tag += realcontent+"</textarea></li>";
						tag += "<li>답변상태</li>";
						tag += "<li><input type='text' name='oq_status' value='${oqVo.oq_status}'></li>";
						tag += "<li>답변자</li>";
					if('${rpvo.username}'=='nousername'){ // 답글이 없는 경우
						tag += "<li>없음</li>";
						tag += "<li>답변하기</li>";
						tag += "<li><textarea name='rpcon' id='rpcon' class='rpcontent' cols='50' rows='11'></textarea>";
						tag += "<label id='text-count'>0/500글자</label>";
						tag += "<input type='submit' value='답변하기' id='replywritebtn'/></li></form></ul>";
					    tag += "<a href='/myapp/openQuestionPage' id='openListGoBtn'>목록으로</a>";	
					}else{ // 답글이 있는 경우
						tag += "<li><input type='text' name='username' value='${rpvo.username}'></li>";			
						tag += "<li id='lastdatelabel'>최종답변일</li>";
						tag += "<li id='lastdatevalue'><input type='text' name='rpldate' value='${rpvo.rpldate}'/></li>"
						tag += "<li>답변내용</li>";						
						
						if('${rpvo.userid}'!='nosamereplyid'){// 로그인한 사람이 답글 작성자인 경우		
							tag += "<li><textarea class='rpcontent' id='rpcon' name='rpcon' readonly>${rpvo.rpcon}</textarea>";
							tag += "<label id='text-count' style='display:none';>0/500글자</label></li><ul>";
							$('.editbtn').append("<a href='/myapp/openQuestionPage' id='replyOkopenListGoBtn'>목록으로</a>");
							$('.editbtn').append("<input type='button' value='수정하기'/></form>");
							$('.editbtn').append("<input type='button' value='삭제하기'/></form>");
						}else{ // 로그인한 사람이 답글 작성자가 아닌경우
							tag += "<li><textarea class='rpcontent' id='rpcon' name='rpcon' readonly>${rpvo.rpcon}</textarea></li><a href='/myapp/openQuestionPage' id='openListGoBtn'>목록으로</a></form></ul>";
						}
					}
					$('.owc-ct').empty();
					$('.owc-ct').html(tag);		 
					
				},error:function(error){
					alert("페이지를 불러올 수 없습니다.");
				}
			});
		}
		
		
		
		
		function openReplyList(){
			
			let openOqNum = 'oq_num=${oqVo.oq_num}';			
			$.ajax({				
				url:'/myapp/openReplyViewList',
				data:openOqNum,				
				success:function(result){
 					let oqlist = result.oqlistvo;
 					let rplist = result.rplistvo; 					
					let tag="";					
						tag += "<form method='post' id='openreplyfrm'>";
						tag += "<li>문의번호</li>";
						tag += "<li><input type='text' name='oq_num' value='"+oqlist.oq_num+"'></li>";
						tag += "<li>등록일</li>";
						tag += "<li><input type='text' name='writedate' value='"+oqlist.writedate+"'/></li>";
						tag += "<li>내용</li>";			
						let realcontent= oqlist.content;
						realcontent = realcontent.replace(regex,"\r\n");
						tag += "<li><input type='text' name='content' value='realcontent'></li>";
//						tag += "<li><input type='text' name='content' value='"+oqlist.content+"'></li>";
						tag += "<li>답변상태</li>";
						tag += "<li><input type='text' name='oq_status' value='"+oqlist.oq_status+"'></li>";
						tag += "<li>답변자</li>";
					if(rplist.username=='nousername'){ // 답글이 없는 경우
						tag += "<li>없음</li>";
						tag += "<li>답변하기</li>";
						tag += "<li><textarea name='rpcon' id='rpcon' class='rpcontent' cols='50' rows='11'></textarea>";
						tag += "<label id='text-count'>0/500글자</label>";
						tag += "<input type='submit' value='답변하기' id='replywritebtn'/></li></form></ul>";
						tag += "<a href='/myapp/openQuestionPage' id='openListGoBtn'>목록으로</a>";
						$('.editbtn').empty();
					}else{ // 답글이 있는 경우
						tag += "<li><input type='text' name='username' value='"+rplist.username+"'></li>";			
						tag += "<li id='lastdatelabel'>최종답변일</li>";
						tag += "<li id='lastdatevalue'><input type='text' name='rpldate' value='"+rplist.rpldate+"'/></li>"
						tag += "<li>답변내용</li>";

						if(rplist.userid!='nosamereplyid'){// 로그인한 사람이 답글 작성자인 경우		
							tag += "<li><textarea class='rpcontent' id='rpcon' name='rpcon' readonly>"+rplist.rpcon+"</textarea>";
							tag += "<label id='text-count' style='display:none';>0/500글자</label></li><ul>";
							$('.editbtn').empty();
							$('.editbtn').append("<a href='/myapp/openQuestionPage' id='replyOkopenListGoBtn'>목록으로</a>");
							$('.editbtn').append("<input type='button' value='수정하기'/></form>");
							$('.editbtn').append("<input type='button' value='삭제하기'/></form>");
						}else{ // 로그인한 사람이 답글 작성자가 아닌경우
							tag += "<li><textarea class='rpcontent' id='rpcon' name='rpcon' readonly>"+rplist.rpcon+"</textarea></li><a href='/myapp/openQuestionPage' id='openListGoBtn'>목록으로</a></form></ul>";
						}
					}
					$('.owc-ct').empty();					
					$('.owc-ct').html(tag);		 
					
				},error:function(error){
					alert("불러오기 실패");
				}
			});
		}
		
		// 글자수 카운트 500자 제한
		$(document).on('keyup','#rpcon',function(){
			if($(this).val().length > 500) {
                $(this).val($(this).val().substring(0, 500));
                $('#test_cnt').html("글자수가 초과되었습니다.");
            }else{
				$('#text-count').html($(this).val().length+ " / 500글자");            	
            }
		});// 글자수 제한 메소드
		
		// 답변하기 클릭
		$(document).on('click','#replywritebtn',function(){
			let rpcontent = $('#rpcon').val(); 			
			if(rpcontent=="" || rpcontent=="null"){
				$('#rpcon').attr('placeholder','답변을 입력해주세요');
				$('#rpcon').focus();
				return false;
			}else{
				rpcontent = encodeURIComponent(rpcontent); // 텍스트 특수문자 인코딩
				let replydata = $("#openreplyfrm").serialize();				
				$.ajax({
					type:'post',
					url:'/myapp/openReplyWrite',
					data: replydata,
					success:function(result){						
						openReplyList();
					}											
				});
			}
			return false;
		});// 답변하기 메소드
		
		
 		// 수정클릭 메소드		
		$(document).on('click','input[value="수정하기"]',function(){
				
				$('#rpcon').attr('readonly',false);
				$('#test_cnt').css('display','block');	
				
				// 버튼 변경 (변경하기,취소하기)
				$('input[value="수정하기"]').css('display','none');
				$('input[value="삭제하기"]').css('display','none');
				
				$('.editbtn').append("<input type='button' value='변경하기'/>");
				$('.editbtn').append("<input type='button' value='취소하기'/>");
				

		});// 수정메소드
		
		$(document).on('click','input[value="변경하기"]',function(){
				let oqNumber = $('input[name=oq_num]').val();
				
				let rpcontent = $('#rpcon').val();
				
				$('#rpcon').change(function(e) {

					rpcontent = $('#rpcon').val();
				});
				
				if(rpcontent=="" || rpcontent=="null"){
					$('#rpcon').attr('placeholder','답변을 입력해주세요');
					$('#rpcon').focus();
					openReplyEdit=0;
					return false;
				}
				
				$.ajax({
					type:'post',
					url:'/myapp/openReplyEdit',
					data: "oq_num="+oqNumber+"&"+
						  "rpcon="+rpcontent,
					success:function(result){														
						if(result.replyeditresult==0){
							alert("수정에 실패하였습니다.");								
							return false;
						}
						alert("수정에 성공하였습니다.");
						openReplyList();
						return false;
					},error:function(error){
						alert("수정에 실패하였습니다.");
						return false;
					}
				}); // 수정ajax			
		});		

		// 취소하기
 		$(document).on('click','input[value="취소하기"]',function(){			
			openReplyList();
 		}); 
								
			

	
		// 삭제하기 버튼클릭
		$(document).on('click','input[value="삭제하기"]',function(){
			if(confirm("답변을 삭제하시겠습니까?") == true){
				let oqNumber = $('input[name=oq_num]').val();
				$.ajax({
					type:'post',
					url:'/myapp/openReplyDelete',
					data:"oq_num="+oqNumber,
					success:function(result){
						alert("답글 삭제가 완료되었습니다.");
						openReplyList();
						if(result.replyDeleteResult==0){
							alert("답글 삭제에 실패하였습니다.");
							return false;
						}						
						openReplyList();
					},error:function(error){
						alert("답글 삭제에 실패하였습니다.");
						return false;
					}					
				});
			}else{
				return false;
			}			
			
		});// 삭제하기 버튼
		
		
		openReplyStart(); // 처음 시작
	});// jquery
</script>
</head>
<body>
	<%@ include file="/inc/adminTop.jspf" %>
	<div class=top-banner-imgCon></div>
	<nav class="top-banner-nav">
	   <div class="tbn-menu1"><a href="<%=request.getContextPath()%>/openQuestionPage">창업문의목록</a></div>
	   <div class="tbn-menu2">창업문의내용</div>	   	   	   
	</nav>
	<main class="open-question-main">
		<div class="open-question-info">
			<h3>창업문의 답변</h3>
			<div class="oqi-Con">
				<section>
					
					<div class="oqi-box">
						<strong class="oqi-title">이름</strong>
						<label class="oqi-info" id="cli_name">${oqVo.username}</label>
					</div>
					<div class="oqi-box">
						<strong class="oqi-title">이메일</strong>
						<label class="oqi-info" id="cli_email">${oqVo.openhopeemail}</label>
					</div>
					<div class="oqi-box">
						<strong class="oqi-title">연락처</strong>
						<label class="oqi-info" id="cli_tel">${oqVo.realtel}</label>
					</div>
					<div class="oqi-box">
						<strong class="oqi-title">창업 희망 지역</strong>
						<label class="oqi-info" id="openhopeaddr">${oqVo.openhopeaddr}</label>
					</div>
				</section>
			</div>
		</div>	
		<div class="open-write-ct">
			<h2>문의내용</h2>	
			<div class="owc">
				<ul class="owc-ct">
				</ul>
				<div class="editbtn">						 
				</div>
			</div>	
		</div>
	</main>

	
	
	<%@ include file="/inc/bottom3.jspf" %>
</body>
</html>