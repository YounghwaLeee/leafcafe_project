<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJSzwXGvvtIypU1a6qlp-Vw0hY-4ZQ_I0&callback=initMap"></script>

<style>
	a:link, a:hover, a:visited {text-decoration:none;color:black;}
	ul, li {margin:0;padding:0;list-style-type:none;}
	body{background-color:#F5F0E9;}
	.headCon{position:relative;top:-380px;color:white;width:500px;margin:0 auto;}
	.head1{width:200px;margin:0 auto;padding-bottom:20px}
	.head2>div{text-align:center;font-size:0.9rem}
	#headerImg{width:1902px;}
	.sirenInfo{display:flex;flex-direction:column;align-items:center;position:relative;top:-318px;left:415px;background-color:white;width:1100px}
	#backCon{background-color:#F5F0E9;height:400px}
	.sirenStep{display:flex;align-items:center;justify-content:space-evenly;width:800px;}
	.sirenStep>ul{display: flex;flex-direction: column;text-align: center;}
	#headerLogo{text-align:center;font-size:4rem;}
	#pageTitle{text-align:center;font-size:1.8em;border-top:1px solid;}
	#infoText{font-size:2.5rem;padding:30px 0;color:#382E2C;}
	.stepIcon{font-size:3.5rem;color:#382E2C;}
	.step{font-size:1.3rem;padding:10px;color:#7B3C07}
	#lastText{display:flex;padding:50px 0 20px 0;font-size:0.9rem}
	#goOd{padding-bottom:30px}
	#goOd2{background-color:#9F8362;color:white;border:1px solid #9F8362;}
	#safe{padding-right:15px;color:#664e49;font-weight:600}
	.flexCon{display:flex;justify-content:center}
	.sectCon{width:70%}
	#stickyCon{position:sticky;top:100px;}
	.section3{width:20%}
	#orderBtn{background-color:#9F8362;color:white}
	#mapCon{display:flex;}
	#map{width:610px;height:560px;position:relative}
	.section1{margin-bottom:200px}
	#fcImg{width:330px;height:250px}
	
	.fc_name{font-weight: 600;color: #7B3C07;}
	.fc_addr{font-size:0.9rem}
	.fc_num, .fcImg, .seleMcode{display:none}
	
	.selectStore{margin-left:50px;display:flex;flex-direction:column;}
	#findFc{width:306px;}
	#mapList{height:478px;overflow:auto;}
	.searched{padding:6px;background-color:#F5F0E9}
	.seleFcname{font-size:1.5rem;font-weight:600;color:#7B3C07;padding:20px 0}
	#detailStore{font-size:1.4rem;color:#382E2C;font-weight:500;padding-bottom:20px}
	/*section2*/
	.menu_title_container{display:flex;justify-content:space-evenly;border-bottom:1px solid gray;font-size:1.2rem}/*?????????*/
	.menu_title_container>li:hover{border-bottom:3px solid #7B3C07;cursor:pointer}
	.menu_title_container>li{padding:15px}
	#menuCon{display:flex;align-items:center;margin-bottom:120px}
	.menu{width:40%}
	#menuList{width:60%;}
	#menuSelect{font-size:1.8rem;padding:20px 0;font-weight:600}
	#selMenuList{display:flex;flex-direction:column;align-items:center}
	#selMenuList>li{padding:10px 0}
	#totalPriceSt{margin-left:280px;color:#7B3C07;font-size:1.3rem;font-weight:700;}
	#menuCntBtn>input[type='button']{width:50px;}
	#menuCnt,#shotCnt,#syrupNum{padding:0 20px}
	#shotPrice{padding:0 38px}
	#syrupPrice{padding:0 32px}
	#shotPlus,#shotMinus,#syrupPlus,#syrupMinus{width:50px}
	/*???????????????*/
	.clicked{background-color:#9F8362 !important; color:white !important}
	.imgwrap{width:110px;height:110px;display:flex;justify-content:center;border-radius:100%;margin:30px;}
	.img, .seleImg {width:110px;height:110px;border-radius:100%;}
	.menuList{display:flex;justify-content:center;flex-wrap:wrap;margin-top:50px;height:756px;overflow:auto;}
	.menuList>li{display:flex;flex-direction:column;align-items:center;}
	.imgtext{text-align:center;}
	.menuname{margin-left:80px;}
	.menuname>li{padding:7px 0}
	.p_ename {font-size:0.8em;color:#9F8362;}
	.p_price, .p_num, .m_code, .selecPnum, .seleccartPnum{display:none}
	#shotPrice, #syrupPrice{visibility: hidden;}
	#detailSty{display:flex}
	.img:hover {
		cursor: pointer;
		transform: scale(1.2); /* ????????? ????????? ????????? ????????? 1.1 ????????? ???????????????. */
		-o-transform: scale(1.2);
		-moz-transform: scale(1.2);
		-webkit-transform: scale(1.2);
		transition: transform .35s;
		-o-transition: transform .35s;
		-moz-transition: transform .35s;
		-webkit-transition: transform .35s;
		transition: all 0.3s ease-in-out;
	}
	.img:not(:hover) {
		cursor: pointer;
		transform: scale(1); /* ????????? ????????? ????????? ????????? 1.1 ????????? ???????????????. */
		-o-transform: scale(1);
		-moz-transform: scale(1);
		-webkit-transform: scale(1);
		transition: transform .35s;
		-o-transition: transform .35s;
		-moz-transition: transform .35s;
		-webkit-transition: transform .35s;
		transition: all 0.3s ease-in-out;
	}		
	#menuDetail{font-size:1.8em;padding:0 0 50px 106px;}			
	.searchstore {background:#9F8362;font-size:1.3rem;color:white;text-align:center;padding-top:10px;}	
	.searchstore>input{width: 290px;border: none;height: 40px;}

	input[type="button"]{width:190px;height:40px;border:1px solid #9F8362;;color:#9F8362;;background:white;}	
	#store{font-size: 1.8rem;padding:40px 0;font-weight: 600;}	
	#cart{font-size:1.8em;padding:40px 0}
	.cartName{margin-left:10px;font-size:1.1rem}
	.option{font-size:0.8rem}
	.cartMenu{display:flex;justify-content:space-between}
	.cartList{background-color:#F5F0E9;margin-top:30px;padding:25px}
	#cartPriSt{font-size:1.1em;font-weight:600;}
	#cartPrice{text-align:end;font-size:1.3rem;font-weight:bold;color:#7B3C07;}
	#payBtn{text-align:center;width:380px;height:45px;background-color:#9F8362;color:white;border:1px solid #9F8362;}
	#addMenu>ul{margin-top:20px}
	#cartTit{text-align:center;font-size:1.4rem;font-weight:600;color:#382E2C}	
	.addTotal{padding:20px 0}
	#seleInfo{color:gray;padding-left:20px}
</style>

<script>
	//totalPrice??? ?????? ??????
	let selectPrice;
	let shotPrice = 0;
	let syrupPrice = 0;
	
	//?????? ?????? ???????????? ????????? ????????????
	
	let cost;
	//?????? ??? ?????? val ?????? ??????
	let cup;
	let size;
	let hot_ice;
    var userid = '${regVo.userid}';
    let m_code;
    var seleFcnum;
	$(function() {
		//????????????????????? ?????? ?????? ???
		$("#All").click(function() {
			$(".coffee").css('display', 'block');
			$(".beverage").css('display', 'block');
			$(".food").css('display', 'block');
			$(".product").css('display', 'none');
		});
		$("#Coffee").click(function() {
			$(".coffee").css('display', 'block');
			$(".beverage").css('display', 'none');
			$(".food").css('display', 'none');
			$(".product").css('display', 'none');
		});
		$("#Beverage").click(function() {
			$(".beverage").css('display', 'block');
			$(".coffee").css('display', 'none');
			$(".food").css('display', 'none');
			$(".product").css('display', 'none');
		});
		$("#Food").click(function() {
			$(".food").css('display', 'block');
			$(".coffee").css('display', 'none');
			$(".beverage").css('display', 'none');
			$(".product").css('display', 'none');
		});
		
		//?????? ????????? ?????????
		function menuInit(){			
		   for (var i = 0; i < selectCup.length; i++) {
           	selectCup[i].classList.remove("clicked");
           }
		   for (var i = 0; i < selectCup.length; i++) {
       	    selectSize[i].classList.remove("clicked");
           }
	       for (var i = 0; i < selectHI.length; i++) {
           	selectHI[i].classList.remove("clicked");
           }
			$("#menuCnt").html(1);
			$("#shotCnt").html(0);
			$("#shotPrice").html(0);
			$("#syrupNum").html(0);
			$("#syrupPrice").html(0);
			$("#shotPrice").css('visibility','hidden');
			$("#syrupPrice").css('visibility','hidden');
			$('#cup').css('display','block');
			$('#size').css('display','block');
			$('#hot_ice').css('display','block');
			$('#shot').css('display','block');
			$('#syrup').css('display','block');
		}
		
		//?????? ?????? ??? ?????? ????????? ????????????/?????? ????????? ?????????
		$(".siren___menu").click(function() {
			menuInit();
			m_code = $(this).children(".imgtext").children(".m_code").text();
	//		pdCode = $(this).children(".imgtext").children(".m_code").text();
			var img = $(this).children(".imgwrap").children(".hideImg").text();
	
			if(m_code == 'food'){
				$('#cup').css('display','none');
				$('#size').css('display','none');
				$('#hot_ice').css('display','none');
				$('#shot').css('display','none');
				$('#syrup').css('display','none');
			}
			
			console.log($(this).children(".imgwrap").children(".hideImg").text());
			$("#seleImg").html("<img src= 'img/"+img+ "' class='seleImg' style='width:150px;height:150px;'/>");
			$("#selectName").html($(this).children(".imgtext").children(".p_name").text());
			$("#selectEname").html($(this).children(".imgtext").children(".p_ename").text());
			$("#selectPrice").html($(this).children(".imgtext").children(".p_price").text());
			$("#totalPrice").html($(this).children(".imgtext").children(".p_price").text());
			$(".selecPnum").html($(this).children(".imgtext").children(".p_num").text());
			$(".seleMcode").html($(this).children(".imgtext").children(".m_code").text());
			price = $(this).children(".imgtext").children(".p_price").text();
			cost = $(this).children(".imgtext").children(".p_price").text();
		});		
		let price = $("#selectPrice").text();
		//????????????
		$("#menuPlus").click(function(){
			$("#menuCnt").html(parseInt($("#menuCnt").text())+1);
			//????????? ????????????  ?????? ????????? ??????selectprice
			$("#selectPrice").html(parseInt($("#selectPrice").text())+parseInt(price));
			//?????? ????????? $("#selectPrice").text()) ??? ?????? ???????????????
			selectPrice = $("#selectPrice").text();
			$("#totalPrice").html(parseInt(selectPrice)+parseInt(shotPrice)+parseInt(syrupPrice));
		});
		$("#menuMinus").click(function(){
			if(parseInt($("#menuCnt").text())>1){
				$("#menuCnt").html(parseInt($("#menuCnt").text())-1);
				$("#selectPrice").html(parseInt($("#selectPrice").text())-parseInt(price));		
			}
			selectPrice = $("#selectPrice").text();
			$("#totalPrice").html(parseInt(selectPrice)+parseInt(shotPrice)+parseInt(syrupPrice));
		});
		
		//???/?????????/???/????????? ?????? ???????????? ?????????
		var selectCup = document.getElementsByClassName("selectCup");
		var selectSize = document.getElementsByClassName("selectSize");
		var selectHI = document.getElementsByClassName("selectHI");		
        function handleClick(event) {
            console.log(event.target.value);
            cup = event.target.value;
             // console.log(this); // ???????????? ?????? ?????? ????????? ?????? ?????????
            console.log(event.target.classList);
            if (event.target.classList[1] === "clicked") {
                event.target.classList.remove("clicked");
            }else {
	            for (var i = 0; i < selectCup.length; i++) {
	                selectCup[i].classList.remove("clicked");
	            }
            event.target.classList.add("clicked");
            }
        }
        function handleClick2(event) {
        	size = event.target.value;
        	if (event.target.classList[1] === "clicked") {
            	event.target.classList.remove("clicked");
            }else {
            for (var i = 0; i < selectCup.length; i++) {
        	    selectSize[i].classList.remove("clicked");
            }
            event.target.classList.add("clicked");
            }
	    }
        function handleClick3(event) {
        	hot_ice = event.target.value;
        	if (event.target.classList[1] === "clicked") {
               event.target.classList.remove("clicked");
            }else {
            for (var i = 0; i < selectHI.length; i++) {
            	selectHI[i].classList.remove("clicked");
            }
            event.target.classList.add("clicked");
            }
        }
	    function init() {
	    	for (var i = 0; i < selectCup.length; i++) {
	    	   selectCup[i].addEventListener("click", handleClick);	    	   
	        }
	    	for (var i = 0; i < selectSize.length; i++) {
	    		selectSize[i].addEventListener("click", handleClick2);	    	   
		    }
	    	for (var i = 0; i < selectHI.length; i++) {
	    		selectHI[i].addEventListener("click", handleClick3);	    	   
		    }
	    }
	    init();//?????? ?????? ????????? ??????
		
		//?????????
		const shot = 500;
		$("#shotPlus").click(function(){
			$("#shotCnt").html(parseInt($("#shotCnt").text())+1);
			$("#shotPrice").html(parseInt($("#shotPrice").text())+shot);
			selectPrice = $("#selectPrice").text();
			if(parseInt($("#shotCnt").text())>0){
				$("#shotPrice").css('visibility','visible');
			}
				shotPrice = $("#shotPrice").text();	
				console.log('selectPri-'+selectPrice+"shotPr-"+shotPrice+'syrup='+syrupPrice);
				$("#totalPrice").html(parseInt(selectPrice)+parseInt(shotPrice)+parseInt(syrupPrice));
		});
		$("#shotMinus").click(function(){
			if(parseInt($("#shotCnt").text())>0 && parseInt($("#shotPrice").text())>0){
				$("#shotCnt").html(parseInt($("#shotCnt").text())-1);
				$("#shotPrice").html(parseInt($("#shotPrice").text())-shot);
				shotPrice = $("#shotPrice").text();	
				$("#totalPrice").html(parseInt(selectPrice)+parseInt(shotPrice)+parseInt(syrupPrice));
			}
			if(parseInt($("#shotCnt").text())<1){
				$("#shotPrice").css('visibility','hidden');
			}
		});
		
		//?????? +,-/????????? ????????? ???????????? 500??? 
		$("#syrupPlus").click(function(){
			 $("#syrupNum").html(parseInt($("#syrupNum").text())+1);
			 $("#syrupPrice").html(500);	
			 if(parseInt($("#syrupNum").text())>0){
				 $("#syrupPrice").css('visibility','visible');
			 }
			 syrupPrice = $("#syrupPrice").text();
			 $("#totalPrice").html(parseInt(selectPrice)+parseInt(shotPrice)+parseInt(syrupPrice));
		});
		$("#syrupMinus").click(function(){
			if(parseInt($("#syrupNum").text())>0){
				$("#syrupNum").html(parseInt($("#syrupNum").text())-1);
				syrupPrice = $("#syrupPrice").text();
				$("#totalPrice").html(parseInt(selectPrice)+parseInt(shotPrice)+parseInt(syrupPrice));
			}
			if(parseInt($("#syrupNum").text())<1){
				$("#syrupPrice").html(0);
				$("#syrupPrice").css('visibility','hidden');
			}
		});
		
	      //???????????? ?????? ?????? ?????????
	      $("#addCartBtn").click(function(){
	         var menuCnt = $("#menuCnt").text();
	         var selecPnum = $(".selecPnum").text();
	         var totalPrice = $("#totalPrice").text();
	         seleFcnum = $(".seleFcnum").text();
	         console.log(seleFcnum);
	         if(seleFcnum==''){
	        	alert("????????? ??????????????????.");
	         }else{
			if(m_code =='food'){
				 var food = "<div class='addTotal'>";
				 food += "<ul class='cartMenu'>";
				 food += "<li><input type='checkbox' name='cartChk' value='"+totalPrice+","+selecPnum+","+menuCnt+","+seleFcnum+","+userid+"' checked='checked'><span class='cartName'>"+ $("#selectName").text() +"</span></li>";
				 food += "<li id='cartCnt'>"+$("#menuCnt").text()+"</li>";
				 food += "<li id='cartPriSt'><span class='price'>"+$("#totalPrice").text()+"</span>???</li>";
				 food += "<li class='seleccartPnum'>"+$(".selecPnum").text()+"</li></ul>";
				 food += "</div>";
				 $(".cartMon").html(parseInt($(".cartMon").text())+parseInt(totalPrice));
				 $("#addMenu").append(food);   		
				 $("#seleInfo").css('display','none');
	            $('#selectPrice').html(cost);
	            $("#totalPrice").html(cost);
	            menuInit();
	    		$('#cup').css('display','none');
				$('#size').css('display','none');
				$('#hot_ice').css('display','none');
				$('#shot').css('display','none');
				$('#syrup').css('display','none');
			}else if(m_code != 'food'){	         
		         if(cup==null){
		            alert("?????? ??????????????????.");
		         }else if(size==null){
		            alert("???????????? ??????????????????.");
		         }else if(hot_ice==null){
		            alert("HOT/ICE??? ??????????????????.");
		         }else if(cup != null && size != null && hot_ice != null){
		            var cartMenu = "<div class='addTotal'>";
		               cartMenu += "<ul class='cartMenu'>";
		               cartMenu += "<li><input type='checkbox' name='cartChk' value='"+totalPrice+","+selecPnum+","+menuCnt+","+seleFcnum+","+userid+"' checked='checked'><span class='cartName'>"+ $("#selectName").text() +"</span></li>";
		               cartMenu += "<li id='cartCnt'>"+$("#menuCnt").text()+"</li>";
		               cartMenu += "<li id='cartPriSt'><span class='price'>"+$("#totalPrice").text()+"</span>???</li>";
		               cartMenu += "<li class='seleccartPnum'>"+$(".selecPnum").text()+"</li></ul>";
		               cartMenu += "<div class='option'>"+cup+"/"+size+"/"+hot_ice;
		               if(parseInt($("#shotCnt").text())>0){
		                  cartMenu += "<br/>?????????"+$("#shotCnt").text()+"???(+"+$("#shotPrice").text()+")";
		               }
		               if(parseInt($("#syrupNum").text())>0){
		                  cartMenu += "/????????????"+$("#syrupNum").text()+"???(+"+500+")";
		               }
		               cartMenu += "</div>";
		            $(".cartMon").html(parseInt($(".cartMon").text())+parseInt(totalPrice));
		            $("#addMenu").append(cartMenu);  
		            $("#seleInfo").css('display','none');
		            $('#selectPrice').html(cost);
		            $("#totalPrice").html(cost);
		            menuInit();
		            cup=null;
		            shot=null;
		            hot_ice=null;
		         }
			}
	        
	         }  
	      });
		
		//????????? ?????? ??? ???????????? ??????
	//	$(".searched").click(function(){
		$(document).on('click','.searched',function(){
			var fcImg = $(this).children(".fcImg").text();
		
			$(".seleFcname").html($(this).children(".fc_name").text());
			$('.seleFcnum').html($(this).children(".fc_num").text());
			seleFcnum = $(".seleFcnum").text();
			$(".sirenImg").html("<img src= 'img/"+fcImg+"'id='fcImg'/>");
	//		$("#selectEname").html($(this).children(".fc_name").schildren(".p_ename").text());
		});
	});
</script>
<!-- ?????? api -->
<script>
	// https://cloud.google.com/maps-platform/
	// https://maps.googlepis.com/
	//??????, ??????
	var latitude = 37.5010689;
	var longitude = 127.0430285;

	function initMap() {
		var myCenter = new google.maps.LatLng(latitude, longitude);
		// ????????? ?????? ??? ?????????  ???????????? JSON????????? ???????????? ????????????.							
		var mapProperty = {
			center : myCenter,
			zoom : 14,//0~21????????? ?????? ????????????. ????????? ????????? ????????????.
			mapTypeId : google.maps.MapTypeId.ROADMAP
		//????????????(ROADMAP, HYBRID, STEELITE, TERRAIN)
		};
		//????????? ????????? ???	
		var map = new google.maps.Map(document.getElementById("map"), mapProperty);
		//????????????
		var geocoder = new google.maps.Geocoder();
	 	geocodeAddress(geocoder, map);

        function geocodeAddress(geocoder, resultMap) {
            console.log('geocodeAddress ?????? ??????');
     		resultedMap= resultMap;
     	
     		mapList();
        }
	}	
	function mapList(searchMap){
		$.ajax({
	    	//???????????????????????? ?????? ????????? ????????????.
		url: '/myapp/map',
		data: {search:searchMap},
		success:function(e){
			
			var tag="";
			
	      	for(var i in e){
	      		var lat = Number(e[i].lat);
	      		var lon = Number(e[i].lon);
	      		var darwin = new google.maps.LatLng(lat, lon);
			        // ??? ??????
		        var marker = new google.maps.Marker({
                      map: resultedMap,
                      position: {lat:lat,lng:lon},
                      title:e[i].fc_name
                });
		        marker.addListener("click", (event) => {
		        	resultedMap.setZoom(15);
		        	resultedMap.setCenter(event.latLng);
		        	
		        });
			//		tag += "<li>"+e[i].fc_name+"<br /> "+e[i].fc_addr+"<br /></li> ";
					tag += "<ul class='searched'>";
					tag += "<li class='fc_name'>"+e[i].fc_name+"</li>";
					tag += "<li class='fc_addr'>"+e[i].fc_addr+"</li>";
					tag += "<li class='fc_num'>"+e[i].fc_num+"</li>";
					tag += "<li class='fcImg'>"+e[i].fc_img+"</li>";
					tag += "</ul>";
	            };
				
				$('#mapList').append(tag);
				
			}, error:function(){
				console.log("error");
			}
		});
		
	}
	
	$(()=>{
		   $('#searchMap').keyup(function(){
			   $('#mapList').html("");
			   mapList($('#searchMap').val());
		   });
		});

</script>
</head>
<body>
<%@ include file="/inc/top.jspf" %>
<header><img src=https://www.baristapaulbassett.co.kr/images/society/introductionVisual.jpg id="headerImg"></header>
<div id="backCon">
	<div class="headCon">
		<div class="head1">
			<div id="headerLogo">leaf</div>
			<div id="pageTitle">SIREN ORDER</div>
		</div>
		<div class="head2">
			<div>leaf??? ????????? ???????????? ?????? ????????? ???????????? ?????? ????????? ?????????.</div>
			<div>?????? ?????? ?????? ??? ?????? ???????????? leaf??? ?????? ???????????????.</div>
		</div>
	</div>
	<section class="sirenInfo">
		<div id="infoText"><strong>"??? ????????? ??????"</strong>??? ????????? ?????????.</div>
		<div class="sirenStep">
			<ul>
				<li class="stepIcon"><i class="fas fa-user-check"></i></li>
				<li class="step">STEP1</li>
				<li>?????????</li>
			</ul>
			<div><img src="img/next.png"/></div>
			<ul>
				<li class="stepIcon"><i class="fas fa-coffee"></i></li>
				<li class="step">STEP2</li>
				<li>????????????</li>
			</ul>
			<div><img src="img/next.png"/></div>
			<ul>
				<li class="stepIcon"><i class="fas fa-map-marker-alt"></i></li>
				<li class="step">STEP3</li>
				<li>????????????</li>
			</ul>
			<div><img src="img/next.png"/></div>
			<ul>
				<li class="stepIcon"><i class="fas fa-credit-card"></i></li>
				<li class="step">STEP4</li>
				<li>????????????</li>
			</ul>
		</div>
		<div id="lastText">
			<div id="safe">????????????</div>
			<div>-????????? ?????? ???????????? : 08:00 ~ 21:30<br/>
			-?????? ??? ????????? ?????? 2km ???????????? ???????????????.</div>
		</div>
		<div id="goOd"><a href="#menuSelect"><input type="button" value="??????????????????" id="goOd2"/></a></div>
	</section>
</div>
<!-- ?????????????????? -->
<div class=flexCon>
	<div class="sectCon">
		<section class="section2">
		<div id="menuSelect">?????? ??????</div>
		<div id="menuCon">
			<div id="menuList">
				<ul class="menu_title_container">
					<li id="All">All</li>
					<li id="Coffee">Coffee</li>
					<li id="Beverage">Beverage</li>
					<li id="Food">Food</li>
				</ul>		
				<ul class="menuList">
					<c:forEach var="menuVo" items="${menuVo}">
					<li class="siren___menu ${menuVo.m_code}">
						<div class="imgwrap">
							<img src="img/${menuVo.p_img}" class="img"/>
							<div class='hideImg' style="display:none">${menuVo.p_img}</div>
						</div>
						<div class="imgtext">
							<div class="p_name">${menuVo.p_name}</div>
							<div class="p_ename">${menuVo.p_ename}</div>
							<div class="p_price">${menuVo.p_price}</div>
							<div class="m_code">${menuVo.m_code}</div>
							<div class="p_num">${menuVo.p_num }</div>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div class="detail menu">
				<div id="menuDetail">?????? ??????</div>
				<ul id="selMenuList">
					<li id="detailSty">
						<div id="seleImg"> <img src="img/americano.png" class="seleImg"style="width: 150px; height: 150px;" /></div> 
						<ul class="menuname">
							<li id="selectName">???????????????</li>
							<li id="selectEname" class="p_ename">Americano</li>
							<li ><span id="selectPrice">4300</span>???</li>
							<li class="selecPnum"></li>
							<li class="seleMcode"></li>
							<li id="menuCntBtn">
								<input id="menuMinus" class="cntBtn" type="button" value="-"> 
								<span id="menuCnt"> 1 </span> <input id="menuPlus" class="cntBtn" type="button" value="+">
							</li>
						</ul>
					</li>
					<li id="cup">
						<input type="button" value="????????????" class="selectCup">
						<input type="button" value="?????????" class="selectCup">
					</li>
					<li id="size">
						<input type="button" value="TALL" class="selectSize">
						<input type="button" value="GRANDE" class="selectSize">
					</li>
					<li id="hot_ice">
						<input type="button" value="HOT" class="selectHI">
						<input type="button" value="ICE" class="selectHI">
					</li>
					<li id="shot">
						????????? 
						<span id="shotPrice">0</span>
						<input id="shotMinus" class="cntBtn" type="button" value="-"> 
						<span id="shotCnt"> 0 </span>
						<input id="shotPlus" class="cntBtn" type="button" value="+">
					</li>
					<li id="syrup">
						???????????? 
						<span id="syrupPrice">0</span>
						<input id="syrupMinus" class="cntBtn" type="button" value="-"> 
						<span id="syrupNum"> 0 </span>
						<input id="syrupPlus" class="cntBtn" type="button" value="+">
					</li>
					<li id="totalPriceSt"><span id="totalPrice">4300</span>???</li>
					<li>
						<input type="button" value="???????????? ??????" id="addCartBtn">
						<input type="button" value="????????????" id="orderBtn">
					</li>
				</ul>
			</div>
		</div>
		</section>
		<section class="section1">
			<div id="store">?????? ??????</div>
			<div id="mapCon">
				<ul id="findFc">
					<li class="searchstore">????????????</li>
					<li class="searchstore"><input type="text" id="searchMap" name="searchMap" placeholder="????????? ?????? ??????"></li>
					<li id='mapList'>
				<!--		<c:forEach var="franVo" items="${franVo}">
						<ul class="searched ">
							<li class="fc_name">${franVo.fc_name}</li>
							<li class="fc_addr">${franVo.fc_addr}</li>
							<li class="fc_num">${franVo.fc_num}</li>
							<li class="fcImg">${franVo.fc_img}</li>
						</ul>
						</c:forEach>   -->
					</li>
				</ul>
				<div id="map" class="list"></div>
				<ul class="selectStore">
					<li id="detailStore">?????? ??????</li>
					<li class="sirenImg"><img src="img/sirenImg3.jpg" id='fcImg'/></li>
					<li class="seleFcname">?????????????????????</li>
					<li class="seleFcnum" style="display:none"></li>
					<li>-????????? ?????? ????????????:08:00~21:30</li>
				</ul>
			</div>
		</section>
	</div>
	<section class="section3">
	<form id="stickyCon">
		<ul class="cartList">
			<li id="cartTit">????????????</li>
			<li><hr/></li>					
			<li id="addMenu">
				<span id="seleInfo">????????? ??????????????????.</span>
			</li>
			<li><hr/></li>
			<li id="cartPrice">??? <span class="cartMon">0</span>???</li>
		</ul>							
		<div><input type="button" value="??????????????????" id="payBtn"/></div>
	</form>
	</section>
</div>

<script>
    $('#orderBtn').click(function () {  
        var IMP = window.IMP;
        IMP.init('imp54411040');
        
        var money = $('#totalPrice').text();
        var userName = '${regVo.username}';
        var userid =  '${regVo.userid}';
        var p_num = $('.selecPnum').text();
        var od_cnt = $('#menuCnt').text();
        var selectName = $('#selectName').text();
        console.log('??????-'+money);
        if(cup==null){
            alert("?????? ??????????????????.");
         }else if(size==null){
            alert("???????????? ??????????????????.");
         }else if(hot_ice==null){
            alert("HOT/ICE??? ??????????????????.");
         }else if($(".seleFcnum").text()==''){
        	alert("????????? ???????????????.");
         }else if(cup!=null && size!=null && hot_ice!=null && $(".seleFcnum").text()!=''){
	        IMP.request_pay({
	            pg: 'pg',
	            pay_method:'card',
	            merchant_uid: 'merchant_' + new Date().getTime(),
	            name: selectName,
	            amount: money,//money??? ?????????
	            buyer_name: userName,
	            buyer_postcode:'113-343',            
	        }, function (rsp) {
	            if (rsp.success) {
	                var msg = '????????? ?????????????????????.';	                
	                msg += '??????ID : ' + rsp.imp_uid;
	                msg += '?????? ??????ID : ' + rsp.merchant_uid;
	                msg += '?????? ?????? : ' + rsp.paid_amount;
	                msg += '?????? ???????????? : ' + rsp.apply_num;
	                $.ajax({
	                    type: "GET",
	                    url: "/myapp/order", //?????? ???????????? ?????? url ??????
	                    data: {
	                        "od_price": money,
	                        "p_num": p_num,
	                        "od_cnt": od_cnt,
	                        "fc_num": 3,
	                        "userid": userid                  
	                    },
	                });
	            } else {
	                var msg = '????????? ?????????????????????.';
	                msg += '???????????? : ' + rsp.error_msg;
	            }
	            alert(msg);
	            document.location.href = '/myapp/siren'; //alert??? ?????? ??? ????????? url ??????
	        });

         }
        
    });
</script>
<script>
$('#payBtn').click(function () {
//	console.log($("input:checkbox[name=cartChk]").length);
//	console.log($("input:checkbox[name=cartChk]:checked").length);
    var IMP = window.IMP;
    IMP.init('imp54411040');
    var userName = '${regVo.username}';
	var cartPrice = $(".cartMon").text();
	console.log("??????");
	console.log(cartPrice);
	var param = '';
	$("input[name=cartChk]:checked").each(function(){
		param += $(this).val()+"/";
	});
	console.log(param);
	if($(".seleFcnum").text()==''){
   		alert("????????? ???????????????.");
    }else if($("input:checkbox[name=cartChk]:checked").length<1){
    	alert("?????? ?????? ????????? ??????????????????.");
    }else if($(".seleFcnum").text()!='' && $("input:checkbox[name=cartChk]:checked").length>=1){
	    IMP.request_pay({
	        pg: 'pg',
	        pay_method:'card',
	        merchant_uid: 'merchant_' + new Date().getTime(),
	        name: '???'+$("input:checkbox[name=cartChk]:checked").length+"???",
	        amount: cartPrice,//cartPrice??? ?????????
	        buyer_name: userName,
	        buyer_postcode:'113-343',            
	    }, function (rsp) {
	        console.log(rsp);
	        if (rsp.success) {
	            var msg = '????????? ?????????????????????.';  
	            msg += '??????ID : ' + rsp.imp_uid;
	            msg += '?????? ??????ID : ' + rsp.merchant_uid;
	            msg += '?????? ?????? : ' + rsp.paid_amount;
	            msg += '?????? ???????????? : ' + rsp.apply_num;
	            console.log(param);
	            $.ajax({
	                type: "GET",
	                url: "/myapp/cartOrder", //?????? ???????????? ?????? url ??????
	                data: { param : param },            
	            });
	        } else {
	            var msg = '????????? ?????????????????????.';
	            msg += '???????????? : ' + rsp.error_msg;
	        }
	        alert(msg);
	        document.location.href = '/myapp/siren';
	    });
    }
});
</script>
</body>
</html>