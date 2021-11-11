<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

body{
   font-family: 'Hanna', fantasy;
}

ul,li{margin:0; padding:0; list-style:none;}

   
   input[type=button]{
      background-color:white;
      width: 110px;
      height:50px;
      border-radius: 10px;
      transition-duration: 0.3s;
      border:1px solid rgb(0, 163, 239);
      font-size: 1.1em;
      color:rgb(0, 163, 239);
      opacity: 0.8;
      font-family: 'Hanna', fantasy;
      
      
   }
   
      .email{
       outline:none;
      width:200px;
      height:30px;
      border:none;border-right:0px; border-top:0px; border-left:0px; border-bottom:1px solid;
   }
   
   .email1{
   		text-align: center;
   		
   }
   
</style>
<script>
	//인증번호 입력하고 확인버튼 눌렀을떄 맞으면 창닫고, 틀리면 인증번호를 다시 입력해주세요.
	
	
	   
         $(function(){
             $('#number').click(function(){
            	 
            	 const url = new URL(window.location.href);

            	// URLSearchParams 객체
            	const urlParams = url.searchParams;

            	// URLSearchParams.get()
            	console.log(urlParams.get('dice'));
            	
                 if($('#dice').val()!=urlParams.get('dice')){
                    $(".dice2").text("인증번호를 다시 입력해주세요.");
                    $(".dice2").attr("style","color:red").css("margin-left","120px").css("margin-top","-20px");
                 }else{
                	 self.opener=self;
                 	window.close();
                 };

             });
         });
	

</script>
</head>
<body>
	<div class="email1">
		<h1>이메일인증</h1>
		
      <ul>
            <li><label class="label">인증번호입력<span></span></label><input type="text" name="dice" id="dice" class="dice"/>
                  <input type="button" id="number" value="확인"/><br/>
                  <input type="hidden" id="number2" value="${dice}"/>
                  <div class="dice2">${dice}</div>
     		</li>  
     </ul>
     
     </div>		
</body>
</html>