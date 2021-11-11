<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/franTop.jspf" %>
<style>
	.container{margin:0 auto;max-width: 1250px;}
	h3{margin-top: 100px;}
	.menu_bar{padding: 20px;margin-top: 20px;background-color: lightblue;border-radius: 10px;}
	.btn{margin-left:5px;background-color:rgb(119, 119, 119);color:white;width:100px;height:40px;margin-bottom: 150px;}
	.button{margin-top:50px;display:flex;justify-content: flex-end;}
	b{margin-left:30px;}
	.content_bar{margin-top: 50px;line-height: 30px;border-top:2px solid gray;border-bottom:2px solid gray;margin-bottom: 50px;}
	ul{display:flex;}
	li{line-height:50px;}
	hr{margin:0px;}
	input{height:30px;width: 700px;border-top: none;border-left: none;border-right: none;border-bottom: 1px solid;}
	.select{height: 30px;border-radius: 10px;}
	.container li:nth-of-type(1){width:150px;}
	textarea{width: 930px;height:400px;resize:none;}
	.content_bar_text{height:450px;border-bottom:3px solid gray;margin-bottom:30px;}
	input>file-upload-button{height:30px;}
	.content_bar_text>ul{border:none;}
	#filename {display: none;}
</style>
<script>
$(() => {
	$("input[type='file']").change(function(event){
		var imageFile = event.target.files[0];
		console.log(imageFile.name);
		var reader = new FileReader();
		reader.onload = (e) => {
			$("#fileimg").children().attr("src", e.target.result);
			$("#uploaded").html(imageFile.name);
		};
		reader.readAsDataURL(imageFile);
	});
});
</script>
<div class="container">
	<h3><b>공지사항수정</b></h3>
	<div class="menu_bar">
		<b>leaf는 본사직원의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다. </cb><br/>
		<b>본사 직원이 확인할 수 있는 공지사항을 입력해 주세요.</b>
	</div>
	<form method="post" action= "/myapp/adminnoticeEditOk" >
	<div class="content_bar">
		<ul>
			<li><b>구분</b></li>
			<li><select name="section">
				    <option value="">구분</option>
				    <option value="m1">상품출시</option>
				    <option value="m2">LEAF와문화</option>
				    <option value="m3">LEAF사회공헌</option>
			   </select>
			   
			</li>
		</ul>	
		<hr/>
		<ul>
			<li><b>제목</b></li>
			<li><input type="text" name="admin_title"  value="${vo.admin_title }"/></li>
		</ul>	
		<hr/>
		<ul>
			<li><b>첨부파일</b></li>
			<li id="file"><label for="filename" id="filebutton">파일선택</label><div id="uploaded"></div><input type="file" id="filename" name="img"  value="${vo.img }"/></li>
		</ul>	
		<hr/>
	</div>
	<div class="content_bar_text">
		<ul>
			<li><b>내용</b></li>
			<li><textarea  placeholder="글내용을 입력하는 곳" name="admin_content">${vo.admin_content }</textarea></li>
		</ul>
		<hr/>	
	</div>
		
	<div class="button">
		<input type="submit" value="수정하기" class="btn">
		<input type="hidden" name="admin_no" value="${vo.admin_no }"/>
		
		<input type="button" class="btn"value="취소하기" onclick="location.href='/myapp/adminnoticeMain'"/>
	</div>
	</form>	
</div>
<%@ include file="/inc/bottom.jspf" %>