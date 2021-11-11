<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
 <script>
   $(()=>{   
      $("#headerText").animate({
          top: "-160px", opacity:1
          }, 1200,);
      $("#menu1").click(function(){
         $(this).css('border-bottom','4px solid rgb(0, 163, 239)');
         $("#menu2").css('border','none');
      });
      $("#menu2").click(function(){
         $(this).css('border-bottom','4px solid rgb(0, 163, 239)');
         $("#menu1").css('border','none');
      });
      $('#content').summernote({
            height: 450,   //set editable area's height
            codemirror: { // codemirror options
              theme: 'monokai'
            }
      });
      $(document).ready(function(){
    	 $('.note-resizebar').css('display','none'); 
      });
   
   });
</script>
<style>
	body{margin:0;}
   nav a{color:gray}
   a:link, a:hover a:visited{text-decoration: none;}
   ul,li{list-style-type: none;padding:0;margin:0;}
   header img{width:100%;height:250px;}
   header{height:250px;position:relative;}
   #headerText{position:relative;top:-100px;left:790px;font-size:3em;color:white;z-index:100;opacity:0.5}
   nav{display:flex;justify-content:center;width:100%;border-bottom:1px solid gray;}
   nav>div{padding:15px 40px;}
   #menu1{border-bottom:4px solid rgb(0, 163, 239);}
   .write{width:1200px;margin:0 auto;text-align:center;padding:20px 0px;color:#2E1500;font-size:1.5em;}
   #boardTitle:focus{outline:none;}
   .background{background-color:#F5F0E9;width:100%;height:80vh}
   .form{width:900px;margin:0 auto;} 
   #title{width:900px;height:30px;margin:10px 0;border:none;}
   #title::placeholder{padding-left:10px}   
   #title:focus{outline:none}
   .form>li:nth-child(2){height:530px}
   .form>li:last-child{text-align:end}
   .form>li:last-child input{margin:0 0 40px 15px;padding:10px 25px;background-color:#9F8362;border:none;color:white;cursor:pointer}
   .form>li:last-child a{padding:9.51px 24px;margin:15px; background-color:#9F8362;color:white;font-size:0.9em}
</style>
</head>
<body>
<header>
	<img src="img/social2.jpg"/>
	<div id="headerText">WHAT'S NEW</div>
</header>
<nav> 
	<div id="menu1"><a href="/myapp/noticeList">공지사항</a></div>
	<div id="menu2"><a href="/myapp/social">사회공헌</a></div>
</nav>
<div class="background">
	<div class="write">글 수정하기</div>
	<form method="post" action="/myapp/franNoticeEditOk">
    <ul class="form">
      <li><input type="text" name="title" id="title" value="${vo.title }"/></li>
      <li><textarea name="content" id="content">${vo.content }</textarea></li>
      <input type="hidden" name="no" value="${vo.no }"/>
      <li><input type="submit" value="등록"/><input type="button" value="취소" onclick="location.href='/myapp/noticeList'"/></li>
    </ul>
</form>
</div>
</body>
</html>