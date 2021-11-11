<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Roboto:wght@300&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
   body{margin:0;font-family:'Noto Sans'}
   ul,li{list-style-type: none;padding:0;margin:0;}
   a{color:gray}
   a:link, a:hover a:visited{text-decoration: none;}
   button{background-color:white;cursor:pointer;}
   header img{width:100%;height:330px;}
   header{height:330px;position:relative;}
   #headerText{position:relative;top:-100px;left:820px;font-size:3em;color:white;opacity:0.5}
   #detailMenu{display:flex;justify-content:center;width:100%;border-bottom:1px solid gray;}
   #detailMenu>div{padding:15px 40px;}
   #menu1{border-bottom:4px solid rgb(0, 163, 239);}
   .container{height: 800px;width:1000px;margin:0 auto;}
   .delete_search{display:flex;justify-content:space-between;border-bottom:3px solid gray;margin-top:60px}
   .delete_search>form:nth-child(1){padding-top:18px}
   .delete_search>form:nth-child(1)>button{border:1px solid gray;padding:2px 3px;}
   .delete_search>div{padding-bottom:15px}
   .delete_search>div>form{border:1px solid gray;}
   ::placeholder{padding-left:5px}
   #searchKeyword{height:41px;width:250px;padding:4px;margin-right:2px;border:none;}
   #searchBox{border:1px solid gray;margin:10px}
   #delBtn{border:2px solid gray;padding:5px 14px}
   #writeBtn{padding: 5px 7px;border::2px solid gray;}
   #searchIcon{font-size:1.2em; padding:6px 6px 4px 6px;border:none;}
   .boardList{overflow:auto;}
   .boardList>li{float:left;border-bottom:1px solid gray; height:40px; line-height:40px;}
   .boardList>li:nth-child(5n+1){width:7.5%;padding-left:10px}
   .boardList>li:nth-child(5n+2){width:11%;color:#62605F}
   .boardList>li:nth-child(5n+3){width:56%;color:#62605F}
   .boardList>li:nth-child(5n+4){width:18%;color:#62605F}
   .boardList>li:nth-child(5n+5){width:6.5%;color:#62605F}
   .boardList>li:nth-child(1){width:7.5%;}
   .boardList>li:nth-child(2){width:35%;font-weight:bold;color:#382E2C}
   .boardList>li:nth-child(3){width:34%;font-weight:bold;color:#382E2C}
   .boardList>li:nth-child(4){width:14.5%;font-weight:bold;color:#382E2C}
   .boardList>li:nth-child(5){width:8%;font-weight:bold;color:#382E2C}
   .paging{display:flex;justify-content:center;margin:30px 0;font-size:1.2em;}
   .paging>li{margin:0 10px;}
   .now>a{font-weight:bold;text-decoration:underline solid #00A3EF;color:#382E2C;font-size:1.1em}
.custom-shape-divider-bottom-1634814551 {
    position: absolute;
    top:363px;
    left: 0;
    width: 100%;
    overflow: hidden;
    line-height: 0;
    transform: rotate(180deg);
}

.custom-shape-divider-bottom-1634814551 svg {
    position: relative;
    display: block;
    width: calc(100% + 1.3px);
    height: 87px;
    transform: rotateY(180deg);
}

.custom-shape-divider-bottom-1634814551 .shape-fill {
    fill: #FFFFFF;
}
</style>
<script>
$(()=>{   
   $("#headerText").animate({
       top: "-205px", opacity:0.9
       }, 600,);
   $("#menu1").click(function(){
      $(this).css('border-bottom','4px solid rgb(0, 163, 239)');
      $("#menu2").css('border','none');
   });
   $("#menu2").click(function(){
      $(this).css('border-bottom','4px solid rgb(0, 163, 239)');
      $("#menu1").css('border','none');
   });
   $("#allCheck").click(function(){
      $(".boardList input").prop("checked", $(this).prop("checked"));   
   });
   $("#delBtn").click(function(){
      $("#selectDel").attr("action","/myapp/deleteCheck");
      $("#selectDel").submit();   
   });


});
</script>
</head>
<body>
<%@ include file="/inc/top.jspf" %>
<header>
   <img src="https://www.starbucks.co.kr/common/img/coffee/coffee_espresso_wrap_bg.jpg"/>
   <div id="headerText">WHAT'S NEW</div>
</header>
<div class="custom-shape-divider-bottom-1634814551">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
        <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
        <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
        <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
    </svg>
</div>
<nav id="detailMenu"> 
   <div id="menu1"><a href="/myapp/noticeList">공지사항</a></div>
   <div id="menu2"><a href="/myapp/social">사회공헌</a></div>
</nav>
<div class="container">
      <div class="delete_search">
         <div>
         <c:if test="${auth=='관리자'}">
            <button id="delBtn"><i class="fas fa-trash-alt"></i> 삭제</button>
            <button id="writeBtn"><a href="/myapp/noticeWrite"><i class="fas fa-pencil-alt"></i> 글쓰기</a></button>  
         </c:if>            
         </div>
  		 <form method="post" action="/myapp/noticeList" id="listform">
         <div id='searchBox'>         
            <input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력해 주세요."/><button id="searchIcon"><i class="fas fa-search"></i></button>         
         </div> 
         </form>       
      </div>
     <form id="selectDel" action="/myapp/deleteCheck" method="post">
      <ul class="boardList">
      	<c:if test="${auth=='관리자'}">
         <li><input type="checkbox" id="allCheck" name="delCheck"/></li>
         </c:if>
   	 	 <c:if test="${auth!='관리자'}">
         <li></li>
         </c:if>
         <li>NO</li>
         <li>제목</li>
         <li>등록일</li>
         <li>조회수</li>         
         <c:forEach var="noticeVo" items="${list}"> 
            <c:if test="${auth=='관리자'}">
           		<li><input type="checkbox" name="delCheck" value="${noticeVo.no}"/></li>
            </c:if>
            <c:if test="${auth!='관리자'}">
            <li></li>
            </c:if>
            <li>${noticeVo.no }</li>
            <li><a href="/myapp/noticeDetail?no=${noticeVo.no }&nowpage=${pVo.nowPage}">${noticeVo.title }</a></li>
            <li>${noticeVo.writedate }</li>  
            <li>${noticeVo.hit }</li>
         </c:forEach>
      </ul>     
      </form>       
      <ul class="paging">
         <c:if test="${pVo.nowPage>1}">
            <li><a href="/myapp/noticeList?nowPage=${pVo.nowPage-1}<c:if test='${searchKeyword != null}'>&searchKeyword=${pVo.searchKeyword}</c:if>"><i class="fas fa-angle-left"></i></a></li>
         </c:if>
      <!-- 시작페이지부터 5개의 페이지를 출력한다. -->
         <!-- 6,7,8,9,10 -->
         <c:forEach var="i" begin="${pVo.startPage }" end="${pVo.startPage+pVo.onePageNumCount-1 }">
         <!-- 출력할 페이지번호 총페이지수보다 작을때만 출력한다. -->
         <c:if test="${i<=pVo.totalPage }">
            <c:if test="${i==pVo.nowPage }">
               <li class="now">
            </c:if>
            <c:if test="${i!=pVo.nowPage }">
               <li>
            </c:if>
            <a href="/myapp/noticeList?nowPage=${i}<c:if test='${searchKeyword != null}'>&searchKeyword=${pVo.searchKeyword}</c:if>">${i}</a></li>
         </c:if>
         </c:forEach>
         <c:if test="${pVo.nowPage<pVo.totalPage}">
            <li class='page-item'><a href="/myapp/noticeList?nowPage=${pVo.nowPage+1 }<c:if test='${searchKeyword != null}'>&searchKeyword=${pVo.searchKeyword}</c:if>"><i class="fas fa-angle-right"></i></a></li>
         </c:if>   
      </ul>
    
</div>
<%@ include file="/inc/bottom.jspf" %>
</body>
</html>