<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name= "viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
   .container{
     
      max-width: 1400px;
      height:855px;
   }
   .purchase_ok{
      width: 100%;
      height:400px;
      border:1px solid gray;
      display:flex;
      margin-left:10px; 
      margin-top:5px;
   }
   
   .purchase_ok{
      overflow:scroll;
   }
   table,td,tr{
      padding-top: 0px;
       padding-bottom: 0px;
       height: 0px;
       text-align:center;
   }
   #name{
      font-size:2.5em;
      font-weight:bold;
      margin-top:50px;
      text-align:center;
      font-family: 'Hanna', fantasy;
   }
   #memo{
      height:200px;
      margin: 10px;
   }
   .memo{
      font-weight:bold;
   }
   #myinput{
      width: 300px;
      margin: 10px;
   }
   

	input[type=button]{
		background-color:white;
		width: 100px;
		height:50px;
		border-radius: 10px;
		transition-duration: 0.3s;
		border:1px solid rgb(0, 163, 239);
		font-size: 1.3em;
		color:rgb(0, 163, 239);
		opacity: 0.8;
		font-family: 'Hanna', fantasy;
		
	}
	
	.btnclass{
		
    display: flex;
    justify-content: center;
	}
	
	.ok{
		
		margin: 20px 20px 0 0;
	}

</style>
<script>
$(()=>{
   $('#myinput').keyup(function(){
      var data = $(this).val().toLowerCase();
      
      $('#searchList>tr').filter(function(){
         var trData = $(this).text().toLowerCase(); //tr??? ?????? ????????? ?????????.
         var idx = trData.indexOf(data);// ????????? -1, ????????? 0~??????
         //            true:?????????, false:??????
         $(this).toggle(idx>-1);
      });
   });
   
   $(".btn-warning").click(function(){
      alert('?????????????????? ???????????????.');
   });
   
});

</script>
</head>
<body>
<div class="container">
   <div id="name">????????????</div>
   <div class="search"><br/>
      <input type='text' id='myinput' placeholder='????????????' class='form-control'/>
      <div class="purchase_ok">
          <table class="table table-hover table-active">
            <thead>
               <tr class="table-active">
                  <td>??????</td>
                  <td>?????????</td>
                   <td>????????????</td>
                   <td>??????</td>
                   <td>????????????</td>
                   <td>???????????????</td>
                   <td>?????????</td>
                   <td>?????????</td>
               </tr>
               </thead>
               <tbody id='searchList'>   
                   <tr>
                      <td>1</td>
                      <td>??????</td>
                      <td>3</td>
                      <td>15,000</td>
                      <td>????????????</td>
                      <td>5</td>
                      <td>?????????</td>
                      <td>054-455-0000</td>
                  </tr>
                  <tr>
                      <td>1</td>
                      <td>??????</td>
                      <td>3</td>
                      <td>15,000</td>
                      <td>????????????</td>
                      <td>5</td>
                      <td>?????????</td>
                      <td>054-455-0000</td>
               
                  </tr>
                  <tr>
                      <td>1</td>
                      <td>??????</td>
                      <td>3</td>
                      <td>15,000</td>
                      <td>????????????</td>
                      <td>5</td>
                      <td>?????????</td>
                      <td>054-455-0000</td>
                  </tr>

        
            </tbody>
         </table>
      </div>
   </div>
   <div class="btnclass">
  		<div class="ok"><input type="button" id="ok" value="??????"/></div>
   		<div class="ok"><input type="button" id="ok" value="??????"/></div>
	</div>
</div>
</body>
</html>