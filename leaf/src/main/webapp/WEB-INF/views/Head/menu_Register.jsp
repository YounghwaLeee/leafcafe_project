<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/adminTop.jspf" %>
<style>
   body{
      margin: 0;
      background-color:rgb(242, 242, 242);
   }
   .container{
      max-width: 1000px;
      display: flex;
       justify-content: center;
       margin:0 auto;
       box-shadow: 0px 1px 5px 2px lightslategrey;
       background-color:white;
       margin-top:100px;
       margin-bottom:200px;
       border-radius:10px;
       font-size: 0.9rem;
       
   }
   #memo{
      width: 770px;
      height:150px;
      padding: 10px;
      
   }
   
   .row{
      width:100%;
      display: inline-block;
      font-weight:bold;
      margin-left: 0;
      margin-bottom: 3px;
          font-size: 1rem;
   }
   .Nutrition{
      position: relative;
     	padding:12px;
       border: 2px solid #ddd;
    height: 300px;
   }
   #fileimg>img{
      width:200px;
      height:200px;
      border-radius:100%;
      position: relative;
      top: -20px;
       left: 24px;
   		border: 2px solid rgb(0, 163, 239);
   }
   #fileimg{
      position: absolute;
    width: 300px;
    height: 300px;
    left: 1112px;
    top: 680px;
   }
   #reg, #submit{
      text-align:center;
      font-size:2em;
      color:rgb(30, 57, 50);
      font-weight:bold;
   }
   .nutname{
      width:50%;
      float:left;
      
   }
   .will-be-moved {
     
       position: relative;
   }
   input{
       height: 30px;
      border:none;
      border-bottom:1px solid #ddd;
      outline:none;
      width: 90%;
      margin-bottom: 10px;
      padding-left: 10px;
   }
    input:focus{
	   	border: 1px solid rgb(0, 163, 239);
		border-bottom: 1px solid rgb(0, 163, 239);
		border-radius: 5px;
   }
   input[type=radio]{
   		width:13px;
   		margin-right: 7px;
   		height: 12px;
   }
 
   .row>input{
    
      width: 70%;
   
   }
   .inputbox{
      margin:100px;
      
   }

   #filebutton, #submit>input{
       line-height: 34px;
    text-align: center;
      background-color: white;
	    width: 110px;
	    height: 35px;
	    border-radius: 2px;
	    border: 1px solid rgb(0, 163, 239);
	    font-size: 0.9em;
	    color: rgb(0, 163, 239);
	    margin-left: 7px;
	    transition: 0.4s;
	    padding-left: 0px;
   }
   #submit>input{
   	    font-size: 0.9rem
   }
   #filebutton:hover, #submit>input:hover{
      cursor: pointer;
      box-shadow: inset 30em 0 0 0 rgb(0, 163, 239);
	color: white;
	border-color: rgb(0, 163, 239);
   }
   
   #filename {
      display: none;
   }
   
   #file {
       display: flex;
       flex-direction: column;
       align-items: center;
       width: 250px;
   }
   textarea{
      resize:none;
   }
       /*head 이미지*/
   header{
         height:330px;
         position:relative;
         }
   #headerText{
         top:-100px;
         font-size:3em;
         color:white;
         opacity:0.5;
         text-align:center;
         position: relative;
         }
   nav{
         display:flex;
         justify-content:center;
         width:100%;
         border-bottom:1px solid gray;
         }
   nav>div{
         padding:15px 40px;
         }
   #head_img{
      background-image:url(https://www.baristapaulbassett.co.kr/images/menu/subVisual_new.jpg);
      z-index:-1;
      width:100%;
      height:330px;
   }
   
   select, textarea{
   width: 268px;
    height: 30px;
    border: none;
    border-bottom: 1px solid #ddd;

    }
    hr{
    margin-top: 2rem;
    margin-bottom: 2rem;
    }
   .best>li{
   	float: left;
   	width: 110px;
   }
   .best{
   margin-top:5px;
   	height:30px;
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
    fill: rgb(242, 242, 242);
}
</style>
<script>
   
   $(() => {
      $("input[type='file']").change(function(event){
         var imageFile = event.target.files[0];
        
         var reader = new FileReader();
         reader.onload = (e) => {
            $("#fileimg").children().attr("src", e.target.result);
            $("#uploaded").html(imageFile.name);
         };
         reader.readAsDataURL(imageFile);
      });
       
   });
   
   $(function(){
      console.log("폼", $(".form"));
      $(".m_code").change(function(){
         var selectedCtg = $(".m_code:selected").val();
         if(selectedCtg == "coffee") {
            $(".s_code .coffee").css('display','block');
            $(".s_code :not(.coffee)").css('display','none');
         }else if(selectedCtg == "beverage"){
            $(".s_code .beverage").css('display','block');
            $(".s_code :not(.beverage)").css('display','none');
         }else if(selectedCtg == "food"){
            $(".s_code .food").css('display','block');
            $(".s_code :not(.food)").css('display','none');
         }else if(selectedCtg == "product"){
            $(".s_code .product").css('display','block');
            $(".s_code :not(.product)").css('display','none');
         }   
   
      });

      $("#headerText").animate({
             top: "-205px", opacity:0.9
             }, 600,);
   });
   
</script>
<header>
   <div id="head_img"></div>
   <div id="headerText">MENU REGISTER</div>
</header>
<div class="custom-shape-divider-bottom-1634814355">
    <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
        <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
        <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
        <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
    </svg>
</div>
   <form method="post" action="/myapp/menu_RegisterOk" >
      <div class="container">
         <div class="inputbox">
            
            <div class="row">분  류</div><br/>
                <select class="form m_code" required name="m_code">
                   <option value="">메뉴선택</option>
                   <option value="coffee" class="m_code coffee">coffee</option>
                   <option value="beverage" class="m_code beverage">beverage</option>
                   <option value="food" class="m_code food">food</option>
                   <option value="product" class="m_code product">product</option>
                </select>
                <select class="form s_code" required name="s_code">
                   <option value="" >상세분류</option>
                   <option value="shot" class="coffee">shot</option>
                   <option value="latte" class="coffee">latte</option>
                   <option value="espresso" class="coffee">espresso</option>
                   <option value="bakery" class="food">bakery</option>
                   <option value="cake" class="food">cake</option>
                   <option value="tea" class="beverage">tea</option>
                   <option value="ade" class="beverage">ade</option>
                   <option value="yogurt" class="beverage">yogurt</option>
                   <option value="Bean" class="product">Bean</option>
                   <option value="Tumbler" class="product">Tumbler</option>
                   <option value="product" class="product">mug</option>
                </select><br/><br/>
      
            <div class="row">제품명<br/><input type="text" class="form" name="p_name" required/><br/></div>
               
            <div class="row">제품명(영어)<br/><input type="text" class="form" name="p_ename" required/><br/></div>   
              
            <div class="row">가격<br/><input type="text" class="form" name="p_price" required/><br/><br/></div>   
               
            <div class="row">new/best</div>   
               <ul class="best">
               	<li><input type="radio" name="new_best" value="new" checked="checked"/>NEW</li>
                  <li><input type="radio" name="new_best" value="best"/>BEST </li>
                  <li><input type="radio" name="new_best" value=""/> 없음</li>
                   </ul>
               <div><br/>
                  <div class="Nutrition">
              		 <div class="row" style="margin-bottom: 10px;">영양정보</div>
                     <div class="nutname">제공량(ml)<br/><input type="text" class="form" name="p_info1" required/></div>
                     <div class="nutname">열 량(kcal)<br/><input type="text" class="form"  name="p_info2" required/></div>
                     <div class="nutname">당 류(g) <br/><input type="text" class="form"  name="p_info3" required/></div>
                     <div class="nutname">나트륨(mg)<br/><input type="text" class="form"  name="p_info4" required/></div>
                     <div class="nutname">단백질(g) <br/><input type="text" class="form"  name="p_info5" required/></div>
                     <div class="nutname">포화지방(g) <br/><input type="text" class="form"  name="p_info6" required/></div>
                     <div class="nutname">카페인(mg) <br/><input type="text" class="form"  name="p_info7" required/></div>
                  </div>   
                  <hr/>
            <div class="row will-be-moved">제품설명</div>
               <textarea id="memo" placeholder="글내용을 입력하는 곳" name="p_desc" required></textarea><br/>
            </div><br/>
            <div id="submit"><input type="submit" value="등록하기"/></div>
            <div id="fileimg"><img src="img/latte.png"/>
                <div id="file"><label for="filename" id="filebutton">파일선택</label><div id="uploaded"></div><input type="file" name="p_img" id="filename" /></div>
            </div>
         </div>   
      </div>
   </form>
<%@ include file="/inc/bottom.jspf" %>